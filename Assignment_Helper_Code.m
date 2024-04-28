%% 1 
syms x
f = @(x) 20*x/(x^2-2*x-15);
g = @(x)5*x-8;
gof = compose(g,f,x);
g(f(2))
disp("-------------------------")
eval(subs(gof, 2))

clearvars
clc

%% 2
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);  % This sets the figure to fullscreen

syms t
x = piecewise(10 <= t & t < 15,(t-10)^2, ... % Section 1
    15 <= t & t < 25, 2*(t-5)+5, ... % Section 2
    25 <= t & t < 55, 40, ... % Section 3
    55 <= t & t < 70,t-5^2+10); % Section 4


fplot(x, [0 70], 'linewidth', 1.5, 'Color', [0.4660, 0.6740, 0.1880])
ylim([0 60]), grid on, xlabel('t'), ylabel('x(t)'), title('Method 3')

%% 3

% Set the figure to fullscreen
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);

% Symbolic variable
syms t

% Define each section of the piecewise function separately
section1 = piecewise(10 <= t & t < 15, (t-10)^2);
section2 = piecewise(15 <= t & t < 25, 2*(t-5)+5);
section3 = piecewise(25 <= t & t < 55, 40);
section4 = piecewise(55 <= t & t < 70, t-5^2+10); % Note: t-5^2 might be a typo; did you mean (t-5)^2?

% Plot each section with a different color
fplot(section1, [10 15], 'linewidth', 1.5, 'Color', 'b') % Blue for section 1
hold on % Hold on to the current figure
fplot(section2, [15 25], 'linewidth', 1.5, 'Color', 'r') % Red for section 2
fplot(section3, [25 55], 'linewidth', 1.5, 'Color', 'g') % Green for section 3
fplot(section4, [55 70], 'linewidth', 1.5, 'Color', 'm') % Magenta for section 4

% Formatting the plot
ylim([0 60]), grid on, xlabel('Domain x values'), ylabel('Range f(x) values'), title('Piecewise function')
hold off % Release the figure for new plots

%% 4
syms x
f= piecewise(x > -2.75, 4*x^2+22*x+15);
g=finverse(f);

figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
 


fplot(f)
hold on 
fplot(g)
fplot(x)
xlabel('x-axis')
ylabel('y-axis')

lgd = legend({'f(x)', 'f(x)^{-1}','y=x'}, 'Location', 'northwest');
set(lgd, 'FontSize', 14); % You can change the value to adjust the size


ylim([-20 20])
xlim([-20 20])

%% 5
% Define the parameters for the function
c = -24;   % Amplitude adjustment
a = 0.8;     % Frequency adjustment
b = -2;    % Phase shift
d = 336.25;   % Vertical shift

% Define the x values (months from January (0) to December (11)) and corresponding y values (dam volumes)
x_data = 0:11; % Months as integers starting from January = 0
y_data = [359.84, 340.74, 323.79, 316.18, 312.66, 314.41, 325.04, 340.54, 351.41, 349.82, 336.91, 320.84]; % Data points

% Create a range of x values for plotting the continuous function
x_plot = linspace(min(x_data) - 1, max(x_data) + 1, 300); % Extend the domain slightly for better visualization

% Calculate the y values for the continuous function using the sine formula
y_plot = c * sin(a * (x_plot + b)) + d;

% Initialize the plot
figure;
hold on;

% Plot the continuous transformed sine function
plot(x_plot, y_plot, 'b-', 'LineWidth', 2); 

% Plot the discrete data points
plot(x_data, y_data, 'ro', 'MarkerFaceColor', 'r');

% Customize the plot with labels, title, and legend
xlabel('Month', 'FontSize', 12); % Month label
ylabel('Dam Volume (GL)', 'FontSize', 12); % Dam volume label with units
title('Comparison of Transformed Sine Function and Discrete Dam Monthly Volume Data', 'FontSize', 14); % Title
lgd = legend('Transformed Sine Function', 'Monthly dam volume data', 'Location', 'northeast'); % Legend
set(lgd, 'FontSize', 14); % You can change the value to adjust the size
grid on; % Enable grid for easier readability

% Set x-ticks to represent months clearly with custom labels
xticks(x_data); % Set x-ticks at data points
xticklabels({'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'}); % Month labels

hold off; % Release the plot hold


%% 6
% Define the parameters for the function
c = -24;   % Amplitude adjustment
a = 0.8;     % Frequency adjustment
b = -2;    % Phase shift
d = 336.25;   % Vertical shift

% Define the x values (months from January (0) to December (11)) and corresponding y values (dam volumes)
x_data = 0:11; % Months as integers starting from January = 0
y_data = [359.84, 340.74, 323.79, 316.18, 312.66, 314.41, 325.04, 340.54, 351.41, 349.82, 336.91, 320.84]; % Data points

% Create a range of x values for plotting the continuous function
x_plot = linspace(min(x_data) - 1, max(x_data) + 1, 300); % Extend the domain slightly for better visualization

% Calculate the y values for the continuous function using the sine formula
y_plot = c * sin(a * (x_plot + b)) + d;

% Initialize the plot
figure;
hold on;

% Plot the continuous transformed sine function
plot(x_plot, y_plot, 'b-', 'LineWidth', 2); 

% Plot the discrete data points
plot(x_data, y_data, 'ro', 'MarkerFaceColor', 'r');

% Draw a horizontal line at y = 340
yline(340, 'k--', 'LineWidth', 2); % 'k--' specifies a black dashed line

% Customize the plot with labels, title, and legend
xlabel('Month', 'FontSize', 12); % Month label
ylabel('Dam Volume (GL)', 'FontSize', 12); % Dam volume label with units
title('Comparison of Transformed Sine Function and Discrete Dam Monthly Volume Data', 'FontSize', 14); % Title
lgd = legend('Transformed Sine Function', 'Monthly Dam Volume Data', 'y = 340 GL', 'Location', 'northeast'); % Update legend
set(lgd, 'FontSize', 14); % Set font size for the legend
grid on; % Enable grid for easier readability

% Set x-ticks to represent months clearly with custom labels
xticks(x_data); % Set x-ticks at data points
xticklabels({'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'}); % Month labels

hold off; % Release the plot hold

%% 7
% Assuming the CO2 data is loaded into MATLAB as a table named 'co2_data'
% and has the same structure as your text, where the 'Monthly Average' column
% contains the mean CO2 values.

co2_data = readtable("A:\ECU\Data Science Masters\Math Fundamentals\Assignment 1 - functions\co2_data.xlsx");

% Selecting data from January 2022 to December 2024
start_year = 2015;
end_year = 2024;
selected_data = co2_data(co2_data.Year >= start_year & co2_data.Year <= end_year, :);

% Extracting the mean CO2 values and the corresponding months as a continuous count
mean_co2 = selected_data.('MonthlyAverage');
months_since_start = (selected_data.Year - start_year) * 12 + selected_data.Month;

% Plotting the data
figure;
plot(months_since_start, mean_co2, 'o-');
xlabel('Months since January 2015');
ylabel('Mean CO2 Levels (ppm)');
title('Mean Monthly CO2 Levels from January 2015 to December 2024');
grid off;


% Assuming you have the 'selected_data' from the previous part with the mean CO2 values.

% Computing the logarithm of the mean CO2 levels
log_mean_co2 = log(mean_co2);

% Plotting the logarithm of the data
figure;
plot(months_since_start, log_mean_co2, 's-');
hold on; % Keep the previous plot
xlabel('Months since January 2015');
ylabel('Log of Mean CO2 Levels (log ppm)');
title('Log of Mean Monthly CO2 Levels from January 2015 to December 2024');
grid on;

% Perform linear regression to get the coefficients of the line
p = polyfit(months_since_start, log_mean_co2, 1); % p(1) will be slope, p(2) will be y-intercept

% Define the trendline using the coefficients
trendline = polyval(p, months_since_start);


plot(months_since_start, trendline, 'r-', 'LineWidth', 2);
hold off;


slope = p(1);
intercept = p(2);


trendline_equation = sprintf('y = %.4f*x + %.4f', slope, intercept);

disp(['Trendline Equation: ', trendline_equation]);

%% 8

% Assuming the CO2 data is loaded into MATLAB as a table named 'co2_data'
% and has the same structure as your text, where the 'MonthlyAverage' column
% contains the mean CO2 values.

% Load the data
co2_data = readtable("A:\ECU\Data Science Masters\Math Fundamentals\Assignment 1 - functions\co2_data.xlsx");

% Selecting data from January 2015 to December 2024
start_year = 2015;
end_year = 2024;
selected_data = co2_data(co2_data.Year >= start_year & co2_data.Year <= end_year, :);

% Extracting the mean CO2 values and the corresponding months as a continuous count
mean_co2 = selected_data.MonthlyAverage; % Adjust the field name if necessary
months_since_start = (selected_data.Year - start_year) * 12 + selected_data.Month;

% Plotting the CO2 data
figure;
plot(months_since_start, mean_co2, 'o-', 'DisplayName', 'Actual CO2 Levels');
hold on; % Keep the current plot

% Using symbolic math to plot the function
syms m;
f(m) = 400.53 * exp(0.0005*m);

% The range for 'm' will be from the first to the last month in your selected data
fplot(f, [min(months_since_start), max(months_since_start)], 'r', 'DisplayName', 'Predicted CO2 Levels');

% Enhancing the plot
xlabel('Months since January 2015');
ylabel('Mean CO2 Levels (ppm)');
title('Mean Monthly CO2 Levels from January 2015 to December 2024');
legend('Location', 'northwest'); % Add a legend
grid on; % Turn on the grid for better readability

% Hold off the plot to prevent further plotting on the same figure
hold off;


