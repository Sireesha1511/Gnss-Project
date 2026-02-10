clc;
clear;
close all;

% Constants
c = 3e8;                         % Speed of light (m/s)
fc = 1.57542e9;                  % GNSS L1 frequency (Hz)

% Wind velocity (assumed)
v = 20;                          % m/s

% Doppler frequency
fd = (v/c)*fc;

% Sampling parameters
fs = 10000;
t = 0:1/fs:0.1;

% Baseband GNSS signal
f_base = 1000;
tx = cos(2*pi*f_base*t);

% Doppler shifted signal
rx = cos(2*pi*(f_base + fd)*t);

% Add noise
rx = rx + 0.01*randn(size(rx));

% FFT Analysis
N = length(rx);
Y = fftshift(fft(rx));
faxis = (-fs/2:fs/N:fs/2-fs/N);

% Plot
figure;
plot(faxis, abs(Y)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('GNSS Doppler Spectrum');
grid on;
