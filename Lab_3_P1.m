clear;
%Problem 1A)

n=0:1:50;

impulse_0=n==0;
impulse_1=n==1;
impulse_2=n==2;

h_1=0.25*impulse_0+0.5*impulse_1+0.25*impulse_2;
h_2=-0.25*impulse_0+0.5*impulse_1-0.25*impulse_2;

x_a=5*cos(0*n);
x_b=5*cos((pi/5)*n);
x_c=5*cos((2*pi/5)*n);
x_d=5*cos((3*pi/5)*n);
x_e=5*cos((4*pi/5)*n);
x_f=5*cos(pi*n);

x_funcs=[x_a;x_b;x_c;x_d;x_e;x_f];
rms=[];

%Problem 1B)

for i=1:6
    sum=0;
    total=0;
    for N=1:1:51
        sum=sum+(x_funcs(i,N).^2);
    end
    total=sqrt(sum/51);
    rms=[rms,total];
end

%Problem 1C)

conv_a=conv(h_1,x_a);
conv_b=conv(h_1,x_b);
conv_c=conv(h_1,x_c);
conv_d=conv(h_1,x_d);
conv_e=conv(h_1,x_e);
conv_f=conv(h_1,x_f);

conv_funcs=[conv_a;conv_b;conv_c;conv_d;conv_e;conv_f];
conv_rms=[];

for i=1:6
    sum=0;
    total=0;
    for N=1:1:101
        sum=sum+(conv_funcs(i,N).^2);
    end
    total=sqrt(sum/101);
    conv_rms=[conv_rms,total];
end

gain=[];

for i=1:6
    calc=20*log(conv_rms(i)/rms(i));
    gain=[gain,calc];
end

freq=[0,0.1,0.2,0.3,0.4,0.5];

figure(1);
hold on;
plot(freq,gain);
xlabel("Signal Frequency (Hz)");
ylabel("Signal Gain (dB)");
title("Signal Gain Over Signal Frequency");
grid on;
hold off;

%Problem 1D)

conv_a=conv(h_2,x_a);
conv_b=conv(h_2,x_b);
conv_c=conv(h_2,x_c);
conv_d=conv(h_2,x_d);
conv_e=conv(h_2,x_e);
conv_f=conv(h_2,x_f);

conv_funcs=[conv_a;conv_b;conv_c;conv_d;conv_e;conv_f];
conv_rms=[];

for i=1:6
    sum=0;
    total=0;
    for N=1:1:101
        sum=sum+(conv_funcs(i,N).^2);
    end
    total=sqrt(sum/101);
    conv_rms=[conv_rms,total];
end

gain=[];

for i=1:6
    calc=20*log(conv_rms(i)/rms(i));
    gain=[gain,calc];
end

freq=[0,0.1,0.2,0.3,0.4,0.5];

figure(2);
hold on;
plot(freq,gain);
xlabel("Signal Frequency (Hz)");
ylabel("Signal Gain (dB)");
title("Signal Gain Over Signal Frequency");
grid on;
hold off;