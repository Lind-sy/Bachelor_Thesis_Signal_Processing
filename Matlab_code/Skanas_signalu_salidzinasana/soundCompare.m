
function [dist,nor] = soundCompare(sample1, sample2)
%Ielasa audio sign?lu
[signal_1, fs_1] = audioread(char(sample1));
[signal_2, fs_1] = audioread(char(sample2));
%Veic trokš?u filtr?ciju
s1_f = WienerScalart96(signal_1,fs_1);
s2_f = WienerScalart96(signal_2,fs_1);
%Tiek veikta fona trokš?u un klusumu iz?emšana
[segments1, fs] = detectVoiced(s1_f, fs_1);
[segments2, fs] = detectVoiced(s2_f, fs_1);

s1_fd = segments1{:};
s2_fd = segments2{:};

%Tiek vekta digit?l? laika deform?cija
d2x = dtw(s1_fd,s2_fd, fs_1);
%mfcc metodi izmanto no Audiotoolbox
[ceps1,freqresp1,fb1,fbrecon1,freqrecon1]=mfcc(s1_fd,fs_1);
[ceps2,freqresp2,fb2,fbrecon2,freqrecon2]=mfcc(d2x,fs_1);

features1 = ceps1(2:end,:);
features2 = ceps2(2:end,:);
%Veic distan?u apr??in?šanu izmantojot Eikl?da un Bhattacharyya distanci
dist = bhattacharyya(features1(:),features2(:));
nor = norm(features1-features2);
end