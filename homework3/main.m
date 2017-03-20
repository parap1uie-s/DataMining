% codeed by shangfangxin 2016-12-30
% Call other matlab function in this folder
clc;clear all;close all;

%% ADLmatrix test - for homework3_1 Q1

graph = {
        {3,6},
        {5,8},
        {1,6,4},
        {3,7,5},
        {4,2,8},
        {1,3,7},
        {6,4,8},
        {2,5,7}
    };
[A,D,L] = ADLmatrix(graph);
[X,lambda] = eig(L);

%% Flajolet-Martin method
% data = {4,5,6,10};
% 
% diffNum = FlajoletMartin(data,@HashFunction);
