% codeed by shangfangxin 2016-11-17
% PageRank with power iteration
% if beta == 1
% can't handle with deadend and spider trap

clc;clear all;
%     0    0    1
% M = 1/2  0    0
%     1/2  1    0

deadEndFlag = 0;
M = [0,0,1;
    0.5,0,0;
    0.5,1,0];
beta = 1;
[N,junk] = size(M);
if(sum(M(:)) ~= N) disp('M error or M has deadEnd'); deadEndFlag = 1; end
M = beta*M + (1-beta)*(ones(N,N)/N);

r0 = (ones(N,1)/N);
rSum = sum(r0);
r(:,:,1) = r0;

i = 1;
while 1
    r(:,:,i+1) = M*r(:,:,i);
    
    if (deadEndFlag == 1 || sum(r(:,:,i+1)) ~= rSum )
        r(:,:,i+1) = (1/sum(r(:,:,i+1))) * r(:,:,i+1);
    end
    
    if (sum(abs(r(:,:,i+1) - r(:,:,i))) < 0.0001)
        break;
    end
    i = i+1;
end