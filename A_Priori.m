% codeed by shangfangxin 2016-12-5
% For details of a-priori see 
% http://blog.csdn.net/rongyongfeikai2/article/details/40457827
clc;clear all;

%% input of dataSet D and parameters
D = {
        {'I1','I2','I5'},
        {'I2','I4'},
        {'I2','I3'},
        {'I1','I2','I4'},
        {'I1','I3'},
        {'I2','I3'},
        {'I1','I3'},
        {'I1','I2','I3','I5'},
        {'I1','I2','I3'}
    }';
% for conivience, we use occurrence number rather 
    % than frequency to be support
min_support = 2;
min_confidence = 0.6;

%% calc candicate set
candicateSet = zeros(size(D,2),1);
mappingTable = {};
K = 1;
while (1)
    if(K==1)
        for sampleN=1:size(D,2)
            sample = D{sampleN};
            for itemN=1:size(sample,2)
                item = sample{itemN};
                mapNum = find(strcmp(mappingTable, item));
                if(isempty(mapNum))
                    mappingTable = [mappingTable item];
                    mapNum = find(strcmp(mappingTable, item));
                end
                candicateSet(mapNum,1) = candicateSet(mapNum,1) + 1;
            end
        end
    else
        for i=1:length(mappingTable)
            subSet = split(mappingTable(i),',')';
            for j=1:length(D)
                if(any(ismember(cellstr(subSet),D{j}) == 0))
                    continue;
                else
                    candicateSet(i,1) = candicateSet(i,1) + 1;
                end
            end
        end
    end
    candicateSet = candicateSet(1:size(mappingTable,2));
    candicateSet = sortrows([mappingTable',num2cell(candicateSet)]);
    % output of pre-pruning
    disp(['candidate set of ',num2str(K),' turn(s):']);
    disp(candicateSet);
    
    % pruning
    i = 1;
    while (1)
        if(size(candicateSet,1) < i) break;end
        if(candicateSet{i,2} < min_support)
            %delete
            candicateSet(i,:) = [];
            continue;
        end
        i = i + 1;
    end
    
    % output of after-pruning
    disp(['pruned set of ',num2str(K),' turn(s):']);
    disp(candicateSet);
    
    % self-join
    joinResult = nchoosek(candicateSet(:,1),K+1);
    i = 1;
    while (1)
        if(size(joinResult,1) < i) break;end
        row = unique(split(joinResult(i,:),','));
        if(length(row) > K+1)
            joinResult(i,:) = [];
            continue;
        else
            joinResult(i,:) = cellstr(row);
        end
        i = i + 1;
    end
    % two requires of candidate set, see the csdn
    i = 1;
    while (1)
        if(size(joinResult,1) < i) break;end
        row = joinResult(i,:);
        subSet = nchoosek(row,K);
        
        for j = 1:size(subSet,1)
            if(any(ismember(subSet(j,:),split(candicateSet(:,1),',')) == 0))
                %delete
                joinResult(i,:) = [];
            end
        end
        i = i + 1;
    end
    
    if(isempty(cellstr(join(joinResult,',')))) break;end
    
    mappingTable = cellstr(join(joinResult,','))';
    candicateSet = zeros(size(mappingTable,2),1);
    
    K = K + 1;
end

% get the frequency set - the last candicateSet
frequencySet = candicateSet(:,1);
% not complete yet, need to compare the confidence
% ...

    