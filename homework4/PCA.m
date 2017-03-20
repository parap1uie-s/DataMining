% codeed by shangfangxin 2017-03-10
clc;clear all;close all;

data = [
    1,2,3;
    1,2,4
    ];

m = length(data);
C = 1/m * (data * data');

[D,lambda] = eig(C);

P = D';

