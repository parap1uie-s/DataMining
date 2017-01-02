% codeed by shangfangxin 2016-12-30
% Call other matlab function in this folder
clc;clear all;close all;

%% ADLmatrix test - for homework3_1 Q1

% graph = {
%         {2,3},
%         {1,4,6},
%         {1,4},
%         {2,5,3},
%         {4,6},
%         {2,5}
%     };
% [A,D,L] = ADLmatrix(graph);
% [X,lambda] = eig(L);

%% Flajolet-Martin method
data = {4,5,6,10};

diffNum = FlajoletMartin(data,@HashFunction);
