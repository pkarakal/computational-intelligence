% pkg load control
close all; clear; clc;
s = tf('s');
c = 0.1;

Gc = s+2;
G = Gc/s;
Gp = 10/((s+1)*(s+9));

tf_open = Gp*G;

tf_closed = feedback(tf_open,1,-1);

figure();
rlocus(tf_open);
figure();
rlocus(tf_closed);


figure();
step(tf_open);
title('step response of open loop');
figure();
step(tf_closed);
title('step response of closed loop');

info = stepinfo(tf_closed);

if info.RiseTime > 1.2
    fprintf('Rise Time is : %d. Try another value.',info.RiseTime);
end
if info.Overshoot > 10
    fprintf('Overshoot is : %d. Try another value.',info.Overshoot);
end



