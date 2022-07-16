close all; clear; clc;

%%%%%% Making / Loading the Fuzzy Controller
FLC = readfis('FuzzyController');
%fuzzyLogicDesigner(FLC);

figure('Position',[225 70 1100 700]);
subplot(2,1,1),plotmf(FLC,'input',1);
xlabel('E/dE');
title('E/dE membership function');
subplot(2,1,2),plotmf(FLC,'output',1);
title('dU membership function');

s = tf('s');
c = 0.1;

Gc = s+4;
G = Gc/s;

Gp = 10/((s+1)*(s+9));

%%% b)
% E is PM and dE is ZR, get output
output = evalfis(FLC, [0.66 0]);
ruleview(FLC);
%%% c)
figure();
gensurf(FLC);
title('FLC output (dU) relative to inputs E and dE');