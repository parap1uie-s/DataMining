% codeed by shangfangxin 2016-11-26
% Calc Jaccard Distance between two documents
% Implement1->the jaccard distance of the Signature matrix eqls to documents
% Implement2->for big data, use a lot hash functions to approximate.
% This script use the idea of Implement1.
% J.D(x,y) = (x ¡É y) / (x ¡È y)

%% input
comparedDocs = [
    0,1,0,0,1,0;
    1,0,1,0,0,1;
    1,1,0,1,1,0;
    0,1,1,0,0,0]';
%The num of permutation and combination
PCNum = 1;

%% produce random permutation and combination
PCs = zeros(PCNum,size(comparedDocs,1))';
PCs(:,1) = [3,6,4,1,5,2]';
% PCs(:,2) = [4,2,1,3,6,7,5]';
% PCs(:,3) = [3,4,7,2,6,1,5]';

%% calc signature matrix
signs = zeros(PCNum,size(comparedDocs,2));
for i=1:PCNum
    for j=1:size(comparedDocs,2)
        tempMin = size(comparedDocs,1);
        for r=1:size(comparedDocs,1)
            if(comparedDocs(r,j) == 1 && PCs(r,i) < tempMin)
                tempMin = PCs(r,i);
            end
        end
        signs(i,j) = tempMin;
    end
end

%% calc Similarities between docs(cols) and signs
CompareNum = nchoosek(size(comparedDocs,2),2);
CSim = cell(3,CompareNum);
CalcTimes = 1;
for i=1:size(comparedDocs,2)
    for j=i+1:size(comparedDocs,2)
        %calc Sim of Cols
        SimCinter = 0;
        SimCunion = 0;
        for r=1:size(comparedDocs,1)
            if(comparedDocs(r,i) == 1 && comparedDocs(r,i) == comparedDocs(r,j))
                SimCinter = SimCinter + 1;
            end
            if(comparedDocs(r,i) ~= 0 || comparedDocs(r,j) ~= 0)
                SimCunion = SimCunion + 1;
            end
        end
        SimC = SimCinter / SimCunion;
        %calc Sim of Signs
        SimSinter = 0;
        SimSunion = PCNum;
        for r=1:PCNum
           if(signs(r,i) == signs(r,j))
                SimSinter = SimSinter + 1;
           end
        end
        SimS = SimSinter / SimSunion;
        
         CSim{1,CalcTimes} = [num2str(i),'-',num2str(j)];
         CSim{2,CalcTimes} = SimC;
         CSim{3,CalcTimes} = SimS;
         CalcTimes = CalcTimes + 1;
    end
end