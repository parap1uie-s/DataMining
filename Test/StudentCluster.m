clc;clear all;close all;

%% ������
xlsfile='data.xlsx';
[tempID,courseID]=xlsread(xlsfile,1);
[~,~,studentOData] = xlsread(xlsfile,2,'A1:B74');
%% ���ݲ��
tempID = [tempID;NaN];
courseID(cellfun(@isempty,courseID))=[];
[m,~]=find(isnan(tempID));

studentIDs = cell(length(m),1);
for i=1:length(m)-1
    studentIDs{i} = tempID(m(i)+1:m(i+1)-1,1);
end

% ͳ�Ƴ��ֵ�ѧ��ѧ�� + ȥ��Դ�����ļ������õı������
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

%% ȥ�أ���ó��ֵ�ѧ��ѧ��
studentID = unique(studentID);
studentID = studentID(2:end);
%% ��ѧ��ѧ����γ̽��ж�Ӧ����þ������� - ���зֲ�����һ����ѧ�ţ�������Ϊ�Ƿ�ѡ��01
electiveData = zeros(length(studentID),length(courseID));
electiveData = [studentID,electiveData];
for i=1:length(studentIDs)
    temp = studentIDs{i};
    for j=1:length(temp)
        electiveData(find(studentID==temp(j)),i+1)=1;
    end
end

%% ����
K = 5;
[Idx,C]=kmeans(electiveData(:,2:end),K,'distance','Hamming');

%% �����������
delete 'output.xlsx';
output = [studentID,Idx];
temp = cell(length(output),1);
for i=1:length(output)
    temp(i) = studentOData(find( output(i,1)==cell2mat(studentOData(:,2)) ),1);
end
xlswrite('output.xlsx',output,1,'A1');
xlswrite('output.xlsx',temp,1,'C1');