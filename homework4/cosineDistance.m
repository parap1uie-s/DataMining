% codeed by shangfangxin 2017-03-10
function [ d ] = cosineDistance( vector1,vector2 )
%COSINEDISTANCE
%   ��������������ͬ�������������cosine���ƶ�

d = dot(vector1,vector2)/(norm(vector1)*norm(vector2));
end

