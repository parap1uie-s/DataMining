% codeed by shangfangxin 2016-11-24
% Edit distance with LCS
% The edit distance is the minimum number of character 
% insertions and character deletions required to turn one string into another. 
% d(x, y) = |x| + |y| - 2|LCS(x, y)|
% LCS = Longest common string

%input
comparedStrings = {'he','she','his','hers'};

%temp var define
LCS = zeros(size(comparedStrings,2));
d = LCS;
lengthXY = zeros(size(comparedStrings,2),1);
%calc LCS
for i=1:size(comparedStrings,2)
    lengthXY(i) = size(comparedStrings{i},2);
    
    for j=1:size(comparedStrings,2)
        str1 = comparedStrings{i};
        str2 = comparedStrings{j};
        tempLCS = zeros(size(str1,2)+1,size(str2,2)+1);
        for m=1:size(str1,2)
            for n=1:size(str2,2)
                if str1(m) == str2(n)
                    tempLCS(m+1,n+1) = tempLCS(m,n)+1;
                else
                    tempLCS(m+1,n+1) = max(tempLCS(m+1,n),tempLCS(m,n+1));
                end
            end
        end
        LCS(i,j) = max(tempLCS(:));
    end
end

%calc E.D and output
d = bsxfun(@plus,lengthXY,lengthXY') - 2*LCS;
disp(d);
