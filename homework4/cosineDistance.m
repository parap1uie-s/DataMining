% codeed by shangfangxin 2017-03-10
function [ d ] = cosineDistance( vector1,vector2 )
%COSINEDISTANCE
%   输入两个长度相同的列向量，输出cosine相似度

d = dot(vector1,vector2)/(norm(vector1)*norm(vector2));
end

