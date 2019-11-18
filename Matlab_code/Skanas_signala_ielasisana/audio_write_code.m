fs = 16000;
nBits = 24;
nChannels = 1;

recorder = audiorecorder(fs, nBits, nChannels);

T =2;
recordblocking(recorder,T);
y = getaudiodata(recorder);

filename = 'file_name.wav';

audiowrite(filename,y,fs)

play(recorder)

t = 1/fs:1/fs:T;
plot(t,y);
