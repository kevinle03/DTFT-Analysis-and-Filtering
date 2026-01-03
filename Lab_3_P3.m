clear;
%Problem 3A)
noise = wgn(1,1000,1);

n=0:1:999;

impulse_0=n==0;
impulse_1=n==1;
impulse_2=n==2;

h_1=0.25*impulse_0+0.5*impulse_1+0.25*impulse_2;
h_2=-0.25*impulse_0+0.5*impulse_1-0.25*impulse_2;

conv_1=conv(noise,h_1);
conv_2=conv(noise,h_2);
w = linspace(-3*pi,3*pi,1999);

dtft_1=calculate_dtft(conv_1,w);
dtft_2=calculate_dtft(conv_2,w);

figure(1);
hold on;
plot(n,noise);
xlabel("Sample (Sample Number)");
ylabel("Noise Amplitude ([A])");
title("Gaussian Noise");
grid on;
hold off;

figure(2);
hold on;
plot(w,abs(dtft_1));
xlabel("Frequency (w)");
ylabel("Magnitude ([A])");
title("Magnitude over Frequency");
grid on;
hold off;

figure(3);
hold on;
plot(w,abs(dtft_2));
xlabel("Frequency (w)");
ylabel("Magnitude ([A])");
title("Magnitude over Frequency");
grid on;
hold off;
%work