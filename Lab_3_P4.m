%% 4. Find peaks and range from csv output

signal = readmatrix('range_signal.csv');

fs = 150e6;
n = 0:length(signal)-1;
t = n./fs;
signal_complex = signal(:,1) + 1j*signal(:,2);

figure;
plot(t, abs(signal_complex));
title('Magnitude of Matched Filter Signal vs. Time')
ylabel('Magnitude')
xlabel('Time')

[pks, locs] = findpeaks(abs(signal_complex),'MinPeakHeight', 0.001);

c = 3e8;
range = (locs-1).*c./(2*fs)