format  rat
A=[1,0,1,0,1,2;1,1,0,0,1,6;0,1,0,1,0,2];
scale1=A;
fprintf('when �� = 0 \n');
scale1(:,6)=A(:,6)*0;
result=(sum(scale1(1,:).*scale1(2,:)))/(sqrt(sum(scale1(1,:).^2))*sqrt(sum(scale1(2,:).^2)));
fprintf('cos(A and B)=%f\n',result);
result=(sum(scale1(2,:).*scale1(3,:)))/(sqrt(sum(scale1(2,:).^2))*sqrt(sum(scale1(3,:).^2)));
fprintf('cos(B and C)=%f\n',result);
result=(sum(scale1(1,:).*scale1(3,:)))/(sqrt(sum(scale1(1,:).^2))*sqrt(sum(scale1(3,:).^2)));
fprintf('cos(A and C)=%f\n',result);
scale2=A;
fprintf('when �� = 0.5 \n');
scale1(:,6)=A(:,6)*0.5;
result=(sum(scale2(1,:).*scale2(2,:)))/(sqrt(sum(scale2(1,:).^2))*sqrt(sum(scale2(2,:).^2)));
fprintf('cos(A and B)=%f\n',result);
result=(sum(scale2(2,:).*scale2(3,:)))/(sqrt(sum(scale2(2,:).^2))*sqrt(sum(scale2(3,:).^2)));
fprintf('cos(B and C)=%f\n',result);
result=(sum(scale2(1,:).*scale2(3,:)))/(sqrt(sum(scale2(1,:).^2))*sqrt(sum(scale2(3,:).^2)));
fprintf('cos(A and C)=%f\n',result);
scale3=A;
fprintf('when �� = 1 \n');
scale1(:,6)=A(:,6)*1;
result=(sum(scale3(1,:).*scale3(2,:)))/(sqrt(sum(scale3(1,:).^2))*sqrt(sum(scale3(2,:).^2)));
fprintf('cos(A and B)=%f\n',result);
result=(sum(scale3(2,:).*scale3(3,:)))/(sqrt(sum(scale3(2,:).^2))*sqrt(sum(scale3(3,:).^2)));
fprintf('cos(B and C)=%f\n',result);
result=(sum(scale3(1,:).*scale3(3,:)))/(sqrt(sum(scale3(1,:).^2))*sqrt(sum(scale3(3,:).^2)));
fprintf('cos(A and C)=%f\n',result);
scale4=A;
fprintf('when �� = 2 \n');
scale1(:,6)=A(:,6)*2;
result=(sum(scale4(1,:).*scale4(2,:)))/(sqrt(sum(scale4(1,:).^2))*sqrt(sum(scale4(2,:).^2)));
fprintf('cos(A and B)=%f\n',result);
result=(sum(scale4(2,:).*scale4(3,:)))/(sqrt(sum(scale4(2,:).^2))*sqrt(sum(scale4(3,:).^2)));
fprintf('cos(B and C)=%f\n',result);
result=(sum(scale4(1,:).*scale4(3,:)))/(sqrt(sum(scale4(1,:).^2))*sqrt(sum(scale4(3,:).^2)));
fprintf('cos(A and C)=%f\n',result);