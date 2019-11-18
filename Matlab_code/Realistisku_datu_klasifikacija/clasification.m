%XDATAC = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_C',cepstrum);
%XDATAFive =cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_Five',cepstrum);
%XDATAPoint = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_Point',cepstrum);
%XDATAV = cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_V',cepstrum);
%XDATAA= cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_A',cepstrum);
%XDATAB= cepstral('C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_B',cepstrum);
%Ct = XDATAC(:,1:trainingSamples);
%Fivet = XDATAFive(:,1:trainingSamples);
%Pointt = XDATAPoint(:,1:trainingSamples);
%Vt = XDATAV(:,1:trainingSamples);
clear
clc
%%
addpath('Ipasibu_izgusanas_metodes_klasifikacijai');
addpath('Dtw_skanas_signalu_salidzinasanai');
addpath('filtri');
addpath('klusuma_iznemsana');
addpath('Skanas_faili_salidzinasani');
addpath('Skanas_dati');
%%
sampleDir1 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_A';
sampleDir2 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_B';
sampleDir3 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_C';
sampleDir4 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_Five';
sampleDir5 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_Point';
sampleDir6 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Fan_V';

%%
sampleDir1 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_A';
sampleDir2 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_B';
sampleDir3 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_C';
sampleDir4 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_Five';
sampleDir5 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_Point';
sampleDir6 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Neeray_V';
%%
sampleDir1 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_A';
sampleDir2 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_B';
sampleDir3 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_C';
sampleDir4 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_Five';
sampleDir5 ='C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_Point';
sampleDir6 = 'C:\Users\linda.kalasnikova\Documents\MATLAB\Bakalaura_d\Speech_Codes\sound files\Linda_V';

%%
[labels_s, groupIDs,confMat1] = clasificator_5_testsamples(5,20,3,sampleDir1,sampleDir2,sampleDir3,sampleDir4,sampleDir5,sampleDir6 );
[labels_s, groupIDs]
%%
xlswrite('confusionMat_mfcc.xlsx',confMat1);
%confusionMat - excel
%%
[labels_s2, groupIDs2,confMat2] = clasificator(5,20,2,sampleDir1,sampleDir2);
[labels_s2, groupIDs2]

%%Skanas signalu salidzinasana
[dist, nor]= soundCompare('Maize_2.wav','Maize_4.wav');
