clear all
clc
 path='E:\ML3D\';
 name(1)="025Cmean";name(2)="0375Cmean";name(3)="050Cmean";name(4)="0625Cmean";
 name(5)="075Cmean";name(6)="0875Cmean"; name(7)="1Cmean";name(8)="1125Cmean";
  name(9)="125Cmean";name(10)="1375Cmean"; name(11)="15Cmean";name(12)="175Cmean";
colors = zeros(12, 3);
for i = 1:12
    % 生成从浅蓝色到浅绿色的渐变
    r = 0.2 + 0.8/12 * i; % 红色分量
    g =  0.7 - 0.4/12 * i; % 绿色分量
    b = 1.0 - 0.8/12 * i; % 蓝色分量
    colors(i, :) = [r, g, b];
end
w=2;
for i=1:1:12
      
  data(i)=importdata([path char(name(i)) '.dat']);
  
  x=data(i).data(:,1);
  y_Re300=data(i).data(:,5);
  y_Re100=data(i).data(:,7);
  d=data(i).data(:,3);
  if i<=6
      figure(1);
  plot3(x,d, y_Re300,'o-', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',8);  
  hold on
  plot3(x,d, y_Re100,'+--', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',10); 
  elseif i==7
            figure(1);
   y_Re1000=data(i).data(:,3);    y_Re300=data(i).data(:,4); 
   y_Re100=data(i).data(:,5);    y_Re10=data(i).data(:,6); 
     d=data(i).data(:,2);

  plot3(x,d, y_Re1000,'-', 'Color', colors(i,:), 'LineWidth', w,'Marker','square','MarkerSize',10);  
  hold on
  plot3(x,d, y_Re300,'o-', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',8); 
  hold on
  plot3(x,d, y_Re100,'+--', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',10);  
  hold on
  plot3(x, d,y_Re10,'--', 'Color', colors(i,:), 'LineWidth', w,'Marker','diamond','MarkerSize',8); 
  elseif i>7
            figure(1);
  plot3(x,d, y_Re300,'o-', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',8);  
  hold on
  plot3(x, d,y_Re100,'+--', 'Color', colors(i,:), 'LineWidth', w,'MarkerSize',10); 
  end
end
xlabel('phase lag', 'FontSize', 24);
ylabel('spacing(c)', 'FontSize', 24);
zlabel('CT', 'FontSize', 24);
%title('三维曲线：推力系数与相位差和d的关系', 'FontSize', 24);

% 设置坐标轴刻度
xticks(0:0.1:0.5); % x坐标刻度间隔值0.1
yticks(0:0.5:2); % y坐标刻度间隔值0.5
zticks(0:0.05:0.15);
% 设置轴线和网格线宽度
ax = gca; % 获取当前坐标轴
ax.LineWidth = 2; % 轴线宽度
% ax.XGrid = 'on'; % 打开x轴网格
% ax.YGrid = 'on'; % 打开y轴网格
% ax.ZGrid = 'on'; % 打开z轴网格
%ax.GridLineWidth = 2; % 网格线宽度
box on; 
% 调整视角
view(-1.231000000000000e+02,13.999999999999874); % 设置视角
grid on; % 打开网格
dd=importdata([path 'phi-interval.dat']);
phiinter=dd.data;
[n,~]=size(phiinter);
z=zeros(n,1);
plot3(phiinter(:,2),phiinter(:,1),z,'k')
hold on