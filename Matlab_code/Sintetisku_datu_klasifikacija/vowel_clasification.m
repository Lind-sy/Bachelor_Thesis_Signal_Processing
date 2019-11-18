
%Input:
%   Fs - sampling rate
%   Len - sound signal lenght
%   n=300; - training samples
%   m=300; - testing samples
%   dB1 = 20; - AGWN for training samples
%   dB2 = 20; - AGWN for testing samples
%   corficients - which feature extraction to use
%                    'lpcc' - linear perdiction cepstral coeficients
%                    'mfcc' - mel frequency cepstral coeficients
%                    'rastaplp' - Relative Spectral Transform - Perceptual Linear Prediction
%   clasificator - which clasificator to use
%                    'knn' - k-nearest neighbour
%                    'tree' - decidion tree
%                    'svn' - support vector machine
%Output:
%       C - confusion matrix
%%
function C = vowel_clasification(Fs, Len, n, m, dB1 ,dB2, koeficienti, klasifikators)

w = hamming(Len);
labels = [97*ones(n,1);117*ones(n,1);105*ones(n,1);111*ones(n,1);101*ones(n,1)];

samples = {};
for ii = 1:length(labels)
    wave=MakeVowel(Len,FMPoints(Len,randi([50,500],1,1)),Fs,char(labels(ii)));
    wave = awgn(wave,dB1,'measured');
    wave = wave.*w';
    
    samples{ii}.audio = wave;
    samples{ii}.Fs = Fs;
    samples{ii}.label = char(labels(ii));
    
    if strcmp(koeficienti ,'lpcc')
        ceps = msf_lpcc(wave, Fs,'order',12);
    elseif strcmp(koeficienti ,'mfcc')
        ceps = msf_mfcc(wave, Fs);
    elseif strcmp(koeficienti ,'rastaplp')
        [ceps, freqresp,fb,fbrecon,freqrecon] = rastaplp(wave, Fs, 1, 12);
    end
    
    samples{ii}.mfcc = ceps(2:end,:);
end
%%
TRAIN_DATA = zeros(size(samples{1}.mfcc,1)*size(samples{1}.mfcc,2),size(samples,2));
for ii = 1:size(samples,2)
    TRAIN_DATA(:,ii) = samples{ii}.mfcc(:);
end
groups = cellstr(char(labels));
%%

if strcmp (klasifikators, 'knn')
    Mdl3 = fitcknn(TRAIN_DATA',groups);
elseif strcmp (klasifikators,  'tree')
    Mdl4 = fitctree(TRAIN_DATA',groups);
elseif strcmp (klasifikators,  'svm')
    Mdl5 = fitcecoc(TRAIN_DATA',groups);
end

%%
rlabel = [97*ones(m,1);117*ones(m,1);105*ones(m,1);111*ones(m,1);101*ones(m,1)];
rlabel = rlabel(randperm(length(rlabel)));

observ_label = zeros(size(rlabel));
for ii = 1:length(rlabel)
    wave=MakeVowel(Len,FMPoints(Len,randi([50,800],1,1)),Fs,char(rlabel(ii)));
    wave = awgn(wave,dB2,'measured');
    wave = wave.*w';
    
    if strcmp(koeficienti ,'lpcc')
        ceps = msf_lpcc(wave, Fs,'order',12);
    elseif strcmp(koeficienti ,'mfcc')
        ceps = msf_mfcc(wave, Fs);
    elseif strcmp(koeficienti ,'rastaplp')
        [ceps, freqresp,fb,fbrecon,freqrecon] = rastaplp(wave, Fs, 1, 12);
    end
    
    ceps = ceps(2:end,:);
    if strcmp (klasifikators, 'knn')
        label = predict(Mdl3,ceps(:)');
    elseif strcmp (klasifikators,  'tree')
        label = predict(Mdl4,ceps(:)');
    elseif strcmp (klasifikators,  'svm')
        label = predict(Mdl5,ceps(:)'); 
    end
    label = label{:};
    observ_label(ii) = double(label);
end
%%
C1 = confusionmat(rlabel,observ_label);

for ii = 1:length(C1)
C(ii) = C1(ii,ii)/300;
end
C = C';
end