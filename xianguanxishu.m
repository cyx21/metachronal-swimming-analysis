 clear all
 clc
X=[
1.10E+00
1.44E+03
1.91E+00
2.57E+00
1.30E+01
7.70E+02
4.46E+02
3.00E+03
1.83E+02
7.00E+02
7.00E+02
7.00E+02
8.00E+03
1.20E+04
5.00E+03
4.00E+01
1.15E+02
6.25E+02
1.29E+03
1.20E+03
5.25E+02
4.11E+02
1.33E+03
4.63E+02
9.19E+02
2.39E+01
6.83E+01




];
Y=[
9.40%
6.36%
10.44%
11.29%
14.16%
22.39%
19.29%
11.10%
12.38%
13.00%
12.50%
11.33%
14.50%
15.50%
14.75%
15.50%
12.78%
12.40%
13.30%
11.87%
10.10%
11.01%
10.00%
9.90%
11.50%
13.11%
13.04%






];
X_log10 = log10(X);
[r, p] = check_correlation(X,Y);
cOptimal=findc(Y);

% category = ['Krill S.Alben 2010'
% 'Peacock Mantis shrimp Garayev & Murphy 2021'
% 'Peacock Mantis shrimp Garayev & Murphy 2021'
% 'Peacock Mantis shrimp Garayev & Murphy 2021'
% 'Cyclopoid Copepod Morris et al. 1990'
% 'Spiny lobster puerulus Wilkin and Jeffs 2011'
% 'Antarctic krill FAST Murphy et al.2011'
% 'Copepod Acartia Kiorboe et al. 2010'
% 'Tomopterid Daniels et al. 2021'
% 'Tomopterid Daniels et al. 2021'
% 'Tomopterid Daniels et al. 2021'
% 'Tomopterid Daniels et al. 2021'
% 'Mantis shrimp Ford et al. 2021'
% 'Mantis shrimp Ford et al. 2021'
% 'Mantis shrimp Ford et al. 2021'
% 'Isopod Alexander 1988 '
% 'Barnacle Larvae Wong et al. 2020'
% 'Mysid A. bahia Ruszczyk et al. 2021'
% 'Copepod nauplii N201 Lenz et al. 2015'];
% labels = {'Krill S.Alben 2010', 'Peacock Mantis shrimp Garayev & Murphy 2021',
% 'Peacock Mantis shrimp Garayev & Murphy 2021', 'Peacock Mantis shrimp Garayev & Murphy 2021',...
% 'Cyclopoid Copepod Morris et al. 1990', 'Spiny lobster puerulus Wilkin and Jeffs 2011', ...
% 'Antarctic krill FAST Murphy et al.2011', 'Copepod Acartia Kiorboe et al. 2010', 'Tomopterid Daniels et al. 2021', ...
% 'Tomopterid Daniels et al. 2021', 'Tomopterid Daniels et al. 2021', 'Tomopterid Daniels et al. 2021',...
% 'Mantis shrimp Ford et al. 2021', 'Mantis shrimp Ford et al. 2021', 'Mantis shrimp Ford et al. 2021',...
% 'Isopod Alexander 1988 ', 'Barnacle Larvae Wong et al. 2020', 'Mysid A. bahia Ruszczyk et al. 2021', ...
% 'Copepod nauplii N201 Lenz et al. 2015'};
% % ����ÿ����𲢻�����Ӧ��ɢ��
% markers = {'o', 's','s','s', '^', 'd', 'v', '>', '<','<','<','<', 'p', 'p','p','d', '^', 'o','*'};
% % ����ɢ��ͼ
%labels=['Copepod','Krill','Shrimp','Tomopterid','Lobster','Barnacle Larvae'];
 numPoints = length(X);
%colors = rand(numPoints, 3);
hold on
% xx=linspace(0,20000,100);
% for j=1:1:length(xx)
% yy(j)= cOptimal;
% end
% plot(xx, yy, '--k', 'LineWidth', 2);
% hold on
colors = zeros(length(X), 3);
for i = 1:length(X)
    if i==1 || i==25 || i==24|| i==22  %Copepod
       colors(i,:)=[0.5 0.5 0];%labels(1,:)=['Copepod'];
    elseif (i>=3&&i<=5)||i==8||(i>=18&&i<=20) %shrimp
       colors(i,:)=[0 0.5 0.5];%labels(2,:)=['Shrimp'];
    elseif i==2 || i==6 %Krill
        colors(i,:)=[0.5 0.5 0.5]; %labels(3,:)=['Krill'];% ��ɫ
    elseif i==7||(i>=11&&i<=17) ||i==21 %Tomopterid
        colors(i,:)=[1 0.5 0];%labels(4,:)=['Tomopterid'];
    elseif i==9||i==10 %Lobster
        colors(i,:)=[0 1 0.5];%labels(5,:)=['Lobster'];
    elseif i==23 %Larvae
        colors(i,:)=[1 0.5 1];%labels(6,:)=['Barnacle Larvae '];
    end
    
    scatter(X(i), 0.01*Y(i), 100, colors(i,:), 'filled');
end
pp = polyfit(X, 0.01*Y, 1);  % 1 ��ʾ�������

% p ���ص���������ϵ�ϵ����p(1) ��б�ʣ�p(2) �ǽؾ�

% ��������ߵ� y ֵ
%y_fit = polyval(pp, X);
xx=linspace(0,0.8,100);
yy=pp(1)*xx+pp(2);
plot(xx, yy, 'r-', 'LineWidth', 2);  % ���������
hold on
% ���ͼ��
%legend(labels, 'Location', 'best');
%set(gca, 'XScale', 'log');
 set(gca, 'FontSize', 24); % ���������С
xlabel('Re_p', 'FontSize', 24); % ����x���ǩ
ylabel('Phase Lag', 'FontSize', 24); % ����y���ǩ
box on; % �������ܵĺڿ���
lineWidth = 2;
set(gca, 'LineWidth', lineWidth);
xx=xx';yy=yy';
% 
% hold on
% xlim([0 15000]);
% ylim([0 1]);
function cOptimal=findc(Y)
 

% ����Ŀ�꺯��
objective = @(c) sum((Y - c).^2); % ��ֵ��ƽ����

% ��ʼ�²�ֵ
initialGuess = 0;

% ʹ����С���˷�Ѱ�ҳ���
options = optimoptions('fminunc', 'Display', 'off');
[cOptimal, ~] = fminunc(objective, initialGuess, options);
end
function [r, p] = check_correlation(X, Y)
% ����X��Y��������֮��������
% ����:
%   X - ��һ������
%   Y - �ڶ�������
% ���:
%   r - Ƥ��ѷ���ϵ��
%   p - ���ϵ����pֵ

% ����Ƥ��ѷ���ϵ��
[r, p] = corrcoef(X, Y);
r = r(1,2);
p = p(1,2);

% ������
fprintf('Pearson correlation coefficient (r): %.4f\n', r);
fprintf('p-value: %.4f\n', p);

if p < 0.05
    fprintf('The two arrays are significantly correlated.\n');
else
    fprintf('The two arrays are not significantly correlated.\n');
end
end
