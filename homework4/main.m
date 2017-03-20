% codeed by shangfangxin 2017-03-10
% Call other matlab function in this folder
clc;clear all;close all;

%% cosine distance of rate score @ question2
a = [0,0.5,1,2];
data = [
    1,0,1,0,1,2;
    1,1,0,0,1,6;
    0,1,0,1,0,2
    ];
result = zeros(nchoosek(3,2),length(a));
chooseData = nchoosek(reshape(1:size(data,1),1,size(data,1)),2);

for i = 1:length(chooseData)
    this = chooseData(i,:);
    for j = 1:length(a)
        tempVector = [data(this(1),:);data(this(2),:)];
        tempVector(:,end) = a(j) * tempVector(:,end);
        result(i,j) = cosineDistance(tempVector(1,:),tempVector(2,:));
    end
end