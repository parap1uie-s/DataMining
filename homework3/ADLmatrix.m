% codeed by shangfangxin 2016-12-30
% calc adjacency matrix A, the degree matrix D, and the Laplacian matrix L of a graph
% for homework 3_1 Q1

function [ A,D,L ] = ADLmatrix( graph )
    A = zeros(size(graph,1));
    D = A;
    L = A;
    
    for i = 1:length(graph)
        tempNodeOut = graph{i};
        for j = 1:length(tempNodeOut)
            A(i,tempNodeOut{j}) = 1;
        end
        D(i,i) = length(tempNodeOut);
    end
    L = D - A;
    
end

