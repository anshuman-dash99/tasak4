clc;
clear all;
close all;
recObj = audiorecorder
disp('Start speaking.')
recordblocking(recObj, 5); %5 seconds
disp('End of Recording.');
%play(recObj); %to listen to recording
y = getaudiodata(recObj); %matrix form of sound data
t=linspace(0,0.02,100);
fc=441000/3;
fs=441000;
c=cos(2*pi*fc*t);
subplot(4,1,1);
plot(y);
xlabel('message signal');
subplot(4,1,2)
plot(c);
xlabel('carrier wave');
x=modulate(y,fc,fs,'am')
subplot(4,1,3)
plot(x)
xlabel('modulation');
z=demod(x,fc,fs,'am')
subplot(4,1,4);
plot(z);
xlabel('demodulation');
pause(5);
sound(z);