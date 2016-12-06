% codeed by shangfangxin 2016-11-30
% Calc confidence of association rules
% association rules {a,b} -> c
% confidence = support({a,b,...,c}) / support({a,b,...})
% i.e: B1 = {a,b,c} B2 = {a,b} and the confidence of {a,b} -> c = 1/2
clc;clear all;

%% input
basketsNum = 100;
itemsNum = 100;
minConfidence = 100;

%% produce buskets and items
%col1 of baskets = basket value 
%col2 of baskets = contain which item in the set
baskets = cell(basketsNum,2);
items = cell(itemsNum,1);
%last num of each rule is j in {...} -> j
rules = {
    {4,6,24},
    {8,10,20},
    {2,3,5,45},
    {8,16}};

%% define rules of items to baskets
% In this case(hw_2_2 Q2)
% Item i is in basket j if and only if i divides j 
% basket 24 = {1,2,3,4,6,8,12,24}
% In other cases, codes as below may be edited.
for i = 1;itemsNum;
    items{i} = i;
end
for i = 1:basketsNum
    baskets{i,1} = i;
    
    temp = {};
    for n = 1:i
        if(mod(i,n) == 0) temp = [temp n];end 
    end
    baskets{i,2} = temp;
end

%% calc confidence
conf = {size(rules,1)};
for i = 1:size(rules,1)
    rule = rules{i};
    J = rule{1,size(rule,2)};
    
    Inum = 0;
    IJnum = 0;
    for j = 1:100
        temp = setdiff(cell2mat(rule(1:size(rule,2)-1)),cell2mat(baskets{j,2}));
        if(isempty(temp)) Inum = Inum+1;end
        
        temp = setdiff(cell2mat(rule(1:size(rule,2))),cell2mat(baskets{j,2}));
        if(isempty(temp)) IJnum = IJnum+1;end
    end
    conf{i} = IJnum / Inum;
end

%% output
disp(conf);
