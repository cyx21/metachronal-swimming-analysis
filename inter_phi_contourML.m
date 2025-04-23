clear all
clc

Adeg=45/180*pi;
 f=0.2;
T=1/f;
ww=2*pi*f;
C=1;
interval_max=2*1*sin(Adeg);%0.005
interval=0.25:0.005:2;%C*sin(Adeg/180*pi)*2;
phi_boundary=zeros(length(interval),1);
for k=1:1:length(interval)
    t=linspace(0,2*T,100);
    phi=linspace(0,0.5,10000);
    m=1;
    for j=1:1:length(phi) 
        
        for i=1:1:length(t)
       
        alpha1(i)=Adeg*sin(ww*t(i));
        alpha2(i)=Adeg*sin(ww*t(i)+phi(j)*2*pi);
        dis=sin(alpha2(i))-sin(alpha1(i))+interval(k);
        if dis<=0
            phi_tmp(m)=phi(j);  
            m=m+1;
        else
            phi_tmp(m)=0.5;
            m=m+1;
        end
        
        end
        
    end
    phi_boundary(k)=min(phi_tmp);
end
 plot(phi_boundary,interval,'--')
%grid minor  % 添加细致的次刻度网格线
%set(gca, 'GridColor', [0.7 0.7 0.7]) % 设置网格线颜色为灰色
%set(gca, 'GridLineStyle', '--') 
ax = gca; % 获取当前坐标轴
ax.LineWidth = 2; % 轴线宽度
hold on

phi_boundary_s=zeros(length(interval),1);
d_shear=0.045;
for k=1:1:length(interval)
    t=linspace(0,2*T,100);
    phi=linspace(0,0.5,10000);
    m=1;
    for j=1:1:length(phi) 
        
        for i=1:1:length(t)
       
        alpha1(i)=Adeg*sin(ww*t(i));
        alpha2(i)=Adeg*sin(ww*t(i)+phi(j)*2*pi);
        dis=sin(alpha2(i))-sin(alpha1(i))+interval(k)-2*d_shear ;
        if dis<=0
            phi_tmp(m)=phi(j);  
            m=m+1;
        else
            phi_tmp(m)=0.5;
            m=m+1;
        end
        
        end
        
    end
    phi_boundary_s(k)=min(phi_tmp);
end
 plot(phi_boundary_s,interval,'--')
grid minor  % 添加细致的次刻度网格线
set(gca, 'GridColor', [0.7 0.7 0.7]) % 设置网格线颜色为灰色
set(gca, 'GridLineStyle', '--') 
hold on
 
plot(phi_boundary_s./phi_boundary,interval,'--')
hold on
interval=interval';
ddd=phi_boundary_s./phi_boundary;
errorbar=[0.0125 0.01 0.025 0.025 0.0125 0.0125 0.025 0.025 0.025 0.05 0.025 0.025];
phiboundary_forerror=[0.05106 0.077 0.1043 0.1325 0.163 0.1955 0.2327 0.2751 0.3298 0.4153 0.5 0.5];
errorbar_cor=errorbar./phiboundary_forerror;
plot(interval,0.2026*interval,'-')
data=[0.50 0.075 0.075;
0.75  0.1 0.1;
1 0.2 0.2;
1.25 0.3 0.25;
1.5  0.3 0.3];
plot(data(:,1),data(:,2),'*')
hold on
plot(data(:,1),data(:,3),'o')
hold on