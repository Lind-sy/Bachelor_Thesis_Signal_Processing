function XDATA= cepstral(dire, cepstralCoefficients)
%*************************************************************************%
%Ievade:
%dire - skanas signalu direktorija 
%cepstralCoefficients - mainigais nosaka, kuru metodi izmantot
%Cepstralo koeficientu iegusanai:
%           1 - LPCC
%           2 - Rasta-PLP
%           3 - MFCC
%Izvade:
%XDATA - cepstralo koeficentu matrica katram skanas signalam
%*************************************************************************%
    wav_folder = {dire};
    %Atrod visus wav failus attiecigaja direktorija
    for i = 1:length(wav_folder)
        aa = dir(fullfile(wav_folder{i}, '*.wav'));
    end
    
    for kk = 1:length(aa)
        %atrod audio faila nosaukumu
        acq_fn_1 = fullfile(wav_folder{i}, aa(kk).name);
        %Ielasa audio failu 
        [Samples, fs] = audioread(acq_fn_1);
        %Pielieto troksnu filtresanu 
        s1_f = WienerScalart96(Samples,fs);
        
        %Iegust signala ipasibu koeficientus izmantojot attiecigo metodi
        if cepstralCoefficients ==1
            ceps1=msf_lpcc(s1_f, fs,'order',10);
        elseif cepstralCoefficients ==2
            ceps1=rastaplp(s1_f, fs, 1, 12);
        elseif cepstralCoefficients == 3
            ceps1=msf_mfcc(s1_f,fs);
        end
        %Izveido matricu, kuru aizpilda ar nullem
        if kk ==1
            [x,y]=size(ceps1);
            x=x-1;
            XDATA = zeros(x*y,length(aa));
        end
        %atmet pirmo rindu
        cepsc = ceps1(2:end,:);
        %Ievieto signala ipasibu koeficientus matrica
        XDATA(:,kk) = cepsc(:);
    end    
end