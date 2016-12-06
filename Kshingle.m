% codeed by shangfangxin 2016-11-27
% Calc Jaccard Distance between two documents
% by calc the documents' K-shingle and the shingles in common.
clc;clear all;
%% input
comparedDocs = {'ABRACADABRA','BRICABRAC'};
%The num of K
K = 2;

%% produce the k-shingle of the docs.
%calc shingles of each doc
for i = 1 : size(comparedDocs,2)
    temp = char(comparedDocs{1,i});
    j = 1;
    while(1)
        TempShingles{i,j} = temp(j:j+K-1);
        j = j + 1;
        if(size(temp,2) < ( j + K - 1 )) break;end
    end
    % unique
    temp = unique(TempShingles(i,1:size(temp,2) - 1));
    for j = 1 : size(temp,2)
        Shingles{i,j} = temp{1,j};
    end
end

%% compare shingles and find common shingle
commonS = intersect(Shingles(1,:),Shingles(2,:));
unionS = union(Shingles(1,:),Shingles(2,:));
Jaccard = size(commonS,2) / size(unionS,2);

%% output
disp('The shingles of docs:');
disp(Shingles);
disp('common shingles:');
disp(commonS);