function KNNstruct = traingClasificator(trainingSamples,cepstrum)
%*************************************************************************%
%INPUT:
%trainingSamples - number of samples we use for training the clasificator 
%cepstrum - determins which method to use to calculate cepstrum coeficients:
%           1)LPCC
%           2)Rasta-PLP
%           3)MFCC
%dir1, dir2 - directory where to take training samples from
%OUTPUT
%SVMstruct -contains information about the trained 
%   classifier, including the support vectors, that is used by SVMCLASSIFY
%   for classification numeric matrix of predictor data
%*************************************************************************%

XDATAC = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\C_Linda',cepstrum);
XDATAFive =cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Five_Linda',cepstrum);
XDATAPoint = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Point_Linda',cepstrum);
XDATAV = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\V_Linda',cepstrum);
XDATAA= cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\A_Linda',cepstrum);
XDATAB= cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\B_Linda',cepstrum);


At = XDATAA(:,1:trainingSamples);
Bt = XDATAB(:,1:trainingSamples);
Ct = XDATAC(:,1:trainingSamples);
Fivet = XDATAFive(:,1:trainingSamples);
Pointt = XDATAPoint(:,1:trainingSamples);
Vt = XDATAV(:,1:trainingSamples);

X_train = [At, Bt, Ct, Fivet, Pointt, Vt]';
twos(1,1:trainingSamples) = 2;
threes(1,1:trainingSamples) = 3;
fours(1,1:trainingSamples) = 4;
fives(1,1:trainingSamples) = 5;
zeros(1,1:trainingSamples) =0;
ones(1,1:trainingSamples) =1;
labels_t = [zeros, ones, twos, threes,fours, fives];

KNNstruct = fitcknn(X_train,labels_t);
%nomainit uz fitCSVM vai fitcknn
end