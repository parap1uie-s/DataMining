% codeed by shangfangxin 2017-03-15
% clustering 10 points to 10 centroid
% identifiy which point will be reclassified after 1 iteration

clc;clear all;close all;

centroid = [25,125;44,105;29,97;35,63;55,63;42,57;23,40;64,37;33,22;55,20];
point = [
    25,125;44,105;29,97;35,63;55,63;42,57;23,40;64,37;33,22;55,20;
    28,145;65,140;50,130;55,118;38,115;50,90;43,83;50,60;50,30;63,88];

%step1 classify points
clusterResult1 = zeros(length(point),2);

for i = 1:length(point)
    minId = 0;
    minDis = 100;
    for j = 1:length(centroid)
        tempDis = sqrt(sum(( centroid(j,:)-point(i,:) ).^2));
        if(tempDis < minDis)
            minId = j;
            minDis = tempDis;
        end
        if(tempDis == 0)
            break;
        end
    end
    clusterResult1(i,1) = minId;
    clusterResult1(i,2) = minDis;
end

%step2 recompute the centroid
for i = 1:length(centroid)
    tempSet = point(clusterResult1==i,:);
    centroid(i,1) = mean(tempSet(:,1));
    centroid(i,2) = mean(tempSet(:,2));
end

%step3 classify points with new centroid
clusterResult2 = zeros(length(point),2);

for i = 1:length(point)
    minId = 0;
    minDis = 100;
    for j = 1:length(centroid)
        tempDis = sqrt(sum(( centroid(j,:)-point(i,:) ).^2));
        if(tempDis < minDis)
            minId = j;
            minDis = tempDis;
        end
        if(tempDis == 0)
            break;
        end
    end
    clusterResult2(i,1) = minId;
    clusterResult2(i,2) = minDis;
end