%% 2. (b) DTFT of impulse response h1[n] and h2[n]
n=0:50;

impulse_0=n==0;
impulse_1=n==1;
impulse_2=n==2;

h_1=0.25*impulse_0+0.5*impulse_1+0.25*impulse_2;
h_2=-0.25*impulse_0+0.5*impulse_1-0.25*impulse_2;

num_samples = 100;

w = linspace(-3*pi,3*pi,num_samples);
H_1 = calculate_dtft(h_1,w);
H_2 = calculate_dtft(h_2,w);

%% 2. (c) Plot of DTFT of impulse response h1[n] and h2[n]
figure;
plot(w,abs(H_1));
xlabel('Frequency (w)');
ylabel('Magnitude');
title('DTFT of impulse response h1');

figure;
plot(w,abs(H_2));
xlabel('Frequency (w)');
ylabel('Magnitude');
title('DTFT of impulse response h2');