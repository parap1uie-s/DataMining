clc;clear all;close all;

%% 读数据
xlsfile='data.xlsx';
[tempID,courseID]=xlsread(xlsfile,1);
[~,~,studentOData] = xlsread(xlsfile,2,'A1:B74');
%% 数据拆分
tempID = [tempID;NaN];
courseID(cellfun(@isempty,courseID))=[];
[m,~]=find(isnan(tempID));

studentIDs = cell(length(m),1);
for i=1:length(m)-1
    studentIDs{i} = tempID(m(i)+1:m(i+1)-1,1);
end

% 统计出现的学生学号 + 去除源数据文件中无用的标记数字
studentID = zeros();
for i=1:length(studentIDs)
    temp = studentIDs{i};
    for j=1:length(temp)
        if(log10(temp(j)) < 3)
            temp(j) = [];
        end
    end
    studentID = [studentID;temp];
    studentIDs{i} = temp;
end

%% 去重，获得出现的学生学号
studentID = unique(studentID);
studentID = studentID(2:end);
%% 将学生学号与课程进行对应，获得聚类数据 - 按行分布，第一列是学号，其余列为是否选课01
electiveData = zeros(length(studentID),length(courseID));
electiveData = [studentID,electiveData];
for i=1:length(studentIDs)
    temp = studentIDs{i};
    for j=1:length(temp)
        electiveData(find(studentID==temp(j)),i+1)=1;
    end
end

%% 聚类
K = 5;
[Idx,C]=kmeans(electiveData(:,2:end),K,'distance','Hamming');

%% 构造输出数据
delete 'output.xlsx';
output = [studentID,Idx];
temp = cell(length(output),1);
for i=1:length(output)
    temp(i) = studentOData(find( output(i,1)==cell2mat(studentOData(:,2)) ),1);
end
xlswrite('output.xlsx',output,1,'A1');
xlswrite('output.xlsx',temp,1,'C1');