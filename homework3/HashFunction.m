% codeed by shangfangxin 2017-01-01
% Hash function of Flajolet-Martin method
% h(x) = (3x+7) mod 11. eg h(8) = 9 = 3*8+7=31, the remainder of 31/11 = 9.
% for homework 3_1 Q4
function [ h ] = HashFunction( x )
    h = mod(3*x+7,11);
end

