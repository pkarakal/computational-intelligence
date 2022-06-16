% pkg load control
close all; clear; clc;
s = tf('s');
c = 0.1;

Gc = s+0.8;
Gp = 10/((s+1)*(s+9));

tf_open = Gc*Gp;

tf_closed = feedback(tf_open,1,-1);

figure();
hold on;

rlocus(tf_open);
rlocus(tf_closed);
hold off;

figure();
step(tf_open);
figure();
step(tf_closed);

