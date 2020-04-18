clear all;
clc;
L1=304.8;L2=101.6;L3=254.0;L4=177.8; %������֪�������˳� L1,L2,L3,L4 
th2=(0:1/12:2)*pi; %��������Ƕȴ� 0 �� 360 �ȣ�����Ϊ pi/6 
th34=zeros(length(th2),2); %����һ�� th2 �� 2 �е�����󣬵�һ�д�Ŧ� _3,�ڶ��д�� �� _3
options=optimset('display','off'); %
for m=1:length(th2) %���� for ѭ������� �� _3���� _4
    th34(m,:)=fsolve('fourbarposition',[1 1], options,th2(m),L2,L3,L4,L1); %�ķ����Գ�Խ���̣���������� th34 ��
end 
figure(1);
j=0;

for p=1:length(th2)
    j=j+1;
    clf;
    x(1)=0;
    y(1)=0;
    x(2)=L2*cos(th2(p));
    y(2)=L2*sin(th2(p));
    x(3)=L2*cos(th2(p))+L3*cos(th34(p));%L1+L4*cos(th34(p,2));
    y(3)=L2*sin(th2(p))+L3*sin(th34(p));
    %������y(3)=y(2)+L3*sin(th34(p));
    x(4)=L1;
    y(4)=0;
    x(5)=0;
    y(5)=0;
    plot(x,y);
    grid on;
    hold on;
    plot(x(1),y(1),'o');
    plot(x(2),y(2),'o');
    plot(x(3),y(3),'o');
    plot(x(4),y(4),'o');
    plot(x(5),y(5),'o');
    axis([-400 400 -400 400]);
    axis square;
    axis equal;
    f(:,j)=getframe;
    
end 
movie(f,100,10)
