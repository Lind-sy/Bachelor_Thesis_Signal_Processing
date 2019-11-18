function [TRAIN_DATA1,labels_target ] = vowel_NN_clasification(Fs, Len, n, dB, koeficienti)

w = hamming(Len);
labels = [97*ones(n,1);117*ones(n,1);105*ones(n,1);111*ones(n,1);101*ones(n,1)];

samples = {};
for ii = 1:length(labels)
    wave=MakeVowel(Len,FMPoints(Len,randi([50,500],1,1)),Fs,char(labels(ii)));
    wave = awgn(wave,dB,'measured');
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
TRAIN_DATA1 = zeros(size(samples{1}.mfcc,1)*size(samples{1}.mfcc,2),size(samples,2));
for ii = 1:size(samples,2)
    TRAIN_DATA1(:,ii) = samples{ii}.mfcc(:);
end
labels_target = zeros(length(unique(labels)),size(TRAIN_DATA1,2));


%%
count=1;
for label= 1:size(labels_target,1)
    
    labels_target(label,count:count+n-1)=1;
    
    count = count+n;
end
end