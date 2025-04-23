% 示例数据 (请替换为你的数据)
x_data = [0.50 0.50 0.75 1 1.25 1.5 0.75 1 1.25 1.5 1 1 1.75 0.25 0.25 0.625 0.625 0.875 0.875 1.125 1.125 1.375 1.375 0.375 0.375 ]; % x 值
y_data = [ 0.1148,0.112 0.127031317, 0.131729573, 0.105616609, 0.068144835, 0.12177125,... 
    0.121086602,  0.099710515, 0.067118898, 0.140759931, 0.127043791, 0.0442542160582838,...
      0.0515931240278181   0.0515931240278181  0.127010432869317  0.126644519649940...
      0.134170503441479  0.126961221409249  0.123151742317394  0.111395484056570...
      0.0847549777987418   0.0842992265323737 0.095503159		0.089600802 ]; % y 值

% 拟合函数
fit_func = @(params, x) params(1) * x .* exp(-params(2) * x.^params(3));

% 初始猜测的参数 [a, b, c]
initial_params = [1, 1, 1];

% 进行拟合
options = optimset('Display', 'off'); % 不显示迭代信息
[best_params, resnorm] = lsqcurvefit(fit_func, initial_params, x_data, y_data, [], [], options);

% 显示拟合结果
disp('fitting para:');
disp(['a = ', num2str(best_params(1))]);
disp(['b = ', num2str(best_params(2))]);
disp(['c = ', num2str(best_params(3))]);

% 绘制结果
x_fit = linspace(0, 5, 200); % 为拟合曲线生成 x 值
y_fit = fit_func(best_params, x_fit);

figure;
scatter(x_data, y_data, 'ro', 'filled'); % 绘制散点
hold on;
 plot(x_fit, y_fit, 'b-', 'LineWidth', 2); % 绘制拟合曲线
xlabel('x');
ylabel('y');
title('fit');
legend('point', 'fitting curve');
grid on;
hold off;
x_fit=x_fit';y_fit=y_fit';