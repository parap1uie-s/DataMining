% codeed by shangfangxin 2017-03-15
% find the vertex of two rectangulars
% and let points in rectangular 1 are all belongs to cluster of point(a,b)
% let points in rectangular 2 are all belongs to cluster of point(c,d)
% init position: (a,b) = (5,10) (c,d) = (20,5)

clc;clear all;close all;

%% data
cluster1 = [5,10]; %(a,b)
cluster2 = [20,5]; %(c,d)

%% opinions
opinions = zeros(4,2,4);
opinions(:,:,1) = [3,3;10,1;13,10;16,4];
opinions(:,:,2) = [7,12;12,8;16,9;25,12];
opinions(:,:,3) = [3,15;13,7;14,10;23,6];
opinions(:,:,4) = [6,7;11,4;14,10;23,6];

distance = zeros(4,4);
%% construct the shape data of rectangular & find answer
for n = 1:size(opinions,3)
    rectYellow = zeros(4,2);
    rectBlue = zeros(4,2);

    rectYellow(1,:) = opinions(1,:,n);
    rectYellow(4,:) = opinions(2,:,n);
    rectYellow(2,:) = [ rectYellow(4,1), rectYellow(1,2) ];
    rectYellow(3,:) = [ rectYellow(1,1), rectYellow(4,2) ];

    rectBlue(1,:) = opinions(3,:,n);
    rectBlue(4,:) = opinions(4,:,n);
    rectBlue(2,:) = [ rectBlue(4,1), rectBlue(1,2) ];
    rectBlue(3,:) = [ rectBlue(1,1), rectBlue(4,2) ];
    
    subplot(2,2,n);
    axis([0 30 0 15]);
    set(gca,'FontSize',14);
    hold on;
    temp = abs(rectYellow(4,:) - rectYellow(1,:));
    w = temp(1);
    h = temp(2);
    rectangle('position',[rectYellow(3,:),w,h,]);
    
    temp = abs(rectBlue(4,:) - rectBlue(1,:));
    w = temp(1);
    h = temp(2);
    rectangle('position',[rectBlue(3,:),w,h]');
    
    plot (cluster1(1),cluster1(2),'*','color','r','MarkerSize',10);
    plot (cluster2(1),cluster2(2),'x','color','r','MarkerSize',10);
    t = ['A','B','C','D'];
    title(t(n));
    hold off;
    
    centerYellow = [mean(rectYellow(4,1) + rectYellow(3,1)),mean(rectYellow(1,2)-rectYellow(3,2))];
    centerBlue = [mean(rectBlue(4,1) + rectBlue(3,1)),mean(rectBlue(1,2)-rectBlue(3,2))];
    
    distance(n,1) = sqrt(sum(( centerYellow-cluster1 ).^2));
    distance(n,2) = sqrt(sum(( centerBlue-cluster1 ).^2));
    distance(n,3) = sqrt(sum(( centerYellow-cluster2 ).^2));
    distance(n,4) = sqrt(sum(( centerBlue-cluster2 ).^2));
    
end
