% codeed by shangfangxin 2017-01-01
% Flajolet-Martin method
% estimate the number of different element in data stream
% for homework 3_1 Q4

function [ diffNum ] = FlajoletMartin( dataSet, hashFunction )
    R = 0;
    BinLength = 4;
    for i = 1 : length(dataSet)
        temp = dataSet{i};
        temp = hashFunction(temp);
        temp = dec2bin(temp,BinLength);
        
        count = 0;
        for j = length(temp):-1:1
            if(temp(j) == '0') count = count + 1;
            else break;
            end
        end
        if(count > R) R = count;
        end
    end
    diffNum = 2^R;
end

