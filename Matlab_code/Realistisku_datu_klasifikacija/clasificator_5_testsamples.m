function [labels_s, groupIDs,confusionMat] = clasificator_5_testsamples(testSamples, traingingSamples,cepstrum,sampledir1,sampledir2,sampledir3,sampledir4,sampledir5,sampledir6)
%*************************************************************************%
%INPUT:
%testSamples -  katras klases testesanai izmantoto skanas signalu skaits
%trainingSamples -  katras klases apmacibai izmantoto skanas signalu skaits
%cepstrum - mainigais nosaka, kuru metodi izmantot cepstralo koeficientu iegusanai
%           1 - LPCC
%           2 - Rasta-PLP
%           3 - MFCC
%sampledir1, sampledir2, sampledir3, sampledir4, sampledir5, sampledir6
% - direktorijas, kas norada no kurienes tiek nemti skanas signali
% testesanai
%
%OUTPUT
%labels_s - matrica, kas norada pie kuras klases patiesi pieder skanas
%signals
%groupIDs - matrica, kas parada klasifikatora veikto skanas signalu
%klasifikaciju
%confusionMat - kludas matrica
%*************************************************************************%
%Tiek vekta skanas signalu ipasibu koeficientu izgusana
%Tiek noradita direktorija no kuras nem attiecigos skanas signalus
XDATA= cepstral(sampledir1,cepstrum);
XDATB= cepstral(sampledir2,cepstrum);
XDATAC = cepstral(sampledir3,cepstrum);
XDATAFive =cepstral(sampledir4,cepstrum);
XDATAPoint = cepstral(sampledir5,cepstrum);
XDATAV = cepstral(sampledir6,cepstrum);

%Izveido matricas, kas satur katras klases ipasibu koeficientus
As = XDATA(:,1:testSamples);
Bs = XDATB(:,1:testSamples);
Cs = XDATAC(:,1:testSamples);
Fives = XDATAFive(:,1:testSamples);
Points = XDATAPoint(:,1:testSamples);
Vs = XDATAV(:,1:testSamples);
%Iegust apmacitu klasifikatoru 
KNNstruct= traingClasificator(traingingSamples,cepstrum);
%Visus mstricu datus saliek viena mainigaja
X_sample = [As, Bs, Cs, Fives, Points, Vs]';
%nodefine piecas klases
twos(1,1:testSamples) = 2;
threes(1,1:testSamples) = 3;
fours(1,1:testSamples) = 4;
fives(1,1:testSamples) = 5;
zeros(1,1:testSamples) =0;
ones(1,1:testSamples) =1;
%Izveido vektoru, kas satures klasu nosaukumus 
labels_s = [zeros, ones, twos, threes,fours, fives];
%Veic testesanu izmantojot testa skanas signalu ipasibas un apmacito
%klasifikatoru, iegustot minejumu matricu 
groupIDs = predict(KNNstruct, X_sample);

labels_s = labels_s';
%Iegust kludas matricu 
confusionMat = confusionmat(groupIDs,labels_s);
end