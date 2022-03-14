%--------------------------------------------------------------------------
%% Script to analyse EGO outdoor experiments data
clc;
% close all;

load("EGO_Outdoor_Data.mat");

%--------------------------------------------------------------------------
%% Retrieve and analyze timestamp data
timestamps_part1 = part1outdoorego(:, 1);
timestamps_part1 = cell2mat(timestamps_part1);

timestamps_part2 = part2outdoorego(:, 1);
timestamps_part2 = cell2mat(timestamps_part2);

timestamps_part3_1 = part3outdoorego_1(:, 1);
timestamps_part3_1 = cell2mat(timestamps_part3_1);

timestamps_part3_2 = part3outdoorego_2(:, 1);
timestamps_part3_2 = cell2mat(timestamps_part3_2);

timestamps_part4_1 = part4outdoorego_1(:, 1);
timestamps_part4_1 = cell2mat(timestamps_part4_1);

timestamps_part4_2 = part4outdoorego_2(:, 1);
timestamps_part4_2 = cell2mat(timestamps_part4_2);

timestamps_part4_3 = part4outdoorego_3(:, 1);
timestamps_part4_3 = cell2mat(timestamps_part4_3);

timestamps_part5 = part5outdoorego(:, 1);
timestamps_part5 = cell2mat(timestamps_part5);

timestamps_part6 = part6outdoorego(:, 1);
timestamps_part6 = cell2mat(timestamps_part6);

timestamps_part7 = part7outdoorego(:, 1);
timestamps_part7 = cell2mat(timestamps_part7);

timestamps_part8 = part8outdoorego(:, 1);
timestamps_part8 = cell2mat(timestamps_part8);

timestamps_part9 = part9outdoorego(:, 1);
timestamps_part9 = cell2mat(timestamps_part9);

timestamps_part10 = part10outdoorego(:, 1);
timestamps_part10 = cell2mat(timestamps_part10);

% Compute total times
totalTimes_EGO_Outdoor = zeros(10, 1);

totalTimes_EGO_Outdoor(1) = max(timestamps_part1) - min(timestamps_part1);

totalTimes_EGO_Outdoor(2) = max(timestamps_part2) - min(timestamps_part2);

time1 = max(timestamps_part3_1) - min(timestamps_part3_1);
time2 = max(timestamps_part3_2) - min(timestamps_part3_2);
totalTimes_EGO_Outdoor(3) = time1 + time2;

time1 = max(timestamps_part4_1) - min(timestamps_part4_1);
time2 = max(timestamps_part4_2) - min(timestamps_part4_2);
time3 = max(timestamps_part4_3) - min(timestamps_part4_3);
totalTimes_EGO_Outdoor(4) = time1 + time2 + time3;

totalTimes_EGO_Outdoor(5) = max(timestamps_part5) - min(timestamps_part5);

totalTimes_EGO_Outdoor(6) = max(timestamps_part6) - min(timestamps_part6);

totalTimes_EGO_Outdoor(7) = max(timestamps_part7) - min(timestamps_part7);

totalTimes_EGO_Outdoor(8) = max(timestamps_part8) - min(timestamps_part8);

totalTimes_EGO_Outdoor(9) = max(timestamps_part9) - min(timestamps_part9);

totalTimes_EGO_Outdoor(10) = max(timestamps_part10) - min(timestamps_part10);

clear time1 time2 time3;

% Compute descriptive statistics
% Mean
mean_totalTimes_EGO_Outdoor = mean(totalTimes_EGO_Outdoor);

% Median
median_totalTimes_EGO_Outdoor = median(totalTimes_EGO_Outdoor);

% Standard deviation
std_totalTimes_EGO_Outdoor = std(totalTimes_EGO_Outdoor);

% Variance
var_totalTimes_EGO_Outdoor = var(totalTimes_EGO_Outdoor);

% Distribution
intervals = 15;
boundaries_totalTimes_Outdoor = linspace(0, 15, intervals+1);
distribution_totalTimes_EGO_Outdoor = histcounts((totalTimes_EGO_Outdoor ./ 60), boundaries_totalTimes_Outdoor);

% Distribution plot
figure;
histogram((totalTimes_EGO_Outdoor ./ 60), boundaries_totalTimes_Outdoor)
title("EGO outdoor total times distribution [0, 15]")
xlabel("Minutes")
ylabel("Participants")
ylim([0, 10])

clear boundaries_totalTimes_Outdoor;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone position data
position_part1 = part1outdoorego(:, 2:4);
position_part1 = round(cell2mat(position_part1), 2);

position_part2 = part2outdoorego(:, 2:4);
position_part2 = round(cell2mat(position_part2), 2);

position_part3_1 = part3outdoorego_1(:, 2:4);
position_part3_1 = round(cell2mat(position_part3_1), 2);

position_part3_2 = part3outdoorego_2(:, 2:4);
position_part3_2 = round(cell2mat(position_part3_2), 2);

position_part4_1 = part4outdoorego_1(:, 2:4);
position_part4_1 = round(cell2mat(position_part4_1), 2);

position_part4_2 = part4outdoorego_2(:, 2:4);
position_part4_2 = round(cell2mat(position_part4_2), 2);

position_part4_3 = part4outdoorego_3(:, 2:4);
position_part4_3 = round(cell2mat(position_part4_3), 2);

position_part5 = part5outdoorego(:, 2:4);
position_part5 = round(cell2mat(position_part5), 2);

position_part6 = part6outdoorego(:, 2:4);
position_part6 = round(cell2mat(position_part6), 2);

position_part7 = part7outdoorego(:, 2:4);
position_part7 = round(cell2mat(position_part7), 2);

position_part8 = part8outdoorego(:, 2:4);
position_part8 = round(cell2mat(position_part8), 2);

position_part9 = part9outdoorego(:, 2:4);
position_part9 = round(cell2mat(position_part9), 2);

position_part10 = part10outdoorego(:, 2:4);
position_part10 = round(cell2mat(position_part10), 2);

% Plot the motion of the drone
% fh = figure;
% fh.WindowState = 'maximized';
% loops = size(position_part1, 1);
% F(loops) = struct('cdata',[],'colormap',[]);
% scatter3(position_part1(1, 1), position_part1(1, 2), position_part1(1, 3), 50, "b", "filled");
% view(110, 30);
% axis([-30, 40, -50, 20, 0, 30])
% xlabel("m")
% ylabel("m")
% zlabel("m")
% drawnow
% F(1) = getframe;
% hold on;
% for i=2:loops
%     
%     scatter3(position_part1(i, 1), position_part1(i, 2), position_part1(i, 3), 50, "b", "filled");
%     plot3([position_part1(i-1, 1), position_part1(i, 1)], [position_part1(i-1, 2), position_part1(i, 2)], [position_part1(i-1, 3), position_part1(i, 3)], "k");
%     drawnow
%     F(i) = getframe;
%     
% end
% 
% movie(F, 1, 10);

clear loops;
clear position_part1 position_part2 position_part3_1 position_part3_2;
clear position_part4_1 position_part4_2 position_part4_3 position_part5;
clear position_part6 position_part7 position_part8 position_part9;
clear position_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone attitude data
% attitude_part1 = part1outdoorego(:, 5:7);
% attitude_part1 = round(cell2mat(attitude_part1), 2);
% 
% attitude_part2 = part2outdoorego(:, 5:7);
% attitude_part2 = round(cell2mat(attitude_part2), 2);
% 
% attitude_part3_1 = part3outdoorego_1(:, 5:7);
% attitude_part3_1 = round(cell2mat(attitude_part3_1), 2);
% 
% attitude_part3_2 = part3outdoorego_2(:, 5:7);
% attitude_part3_2 = round(cell2mat(attitude_part3_2), 2);
% 
% attitude_part4_1 = part4outdoorego_1(:, 5:7);
% attitude_part4_1 = round(cell2mat(attitude_part4_1), 2);
% 
% attitude_part4_2 = part4outdoorego_2(:, 5:7);
% attitude_part4_2 = round(cell2mat(attitude_part4_2), 2);
% 
% attitude_part4_3 = part4outdoorego_3(:, 5:7);
% attitude_part4_3 = round(cell2mat(attitude_part4_3), 2);
% 
% attitude_part5 = part5outdoorego(:, 5:7);
% attitude_part5 = round(cell2mat(attitude_part5), 2);
% 
% attitude_part6 = part6outdoorego(:, 5:7);
% attitude_part6 = round(cell2mat(attitude_part6), 2);
% 
% attitude_part7 = part7outdoorego(:, 5:7);
% attitude_part7 = round(cell2mat(attitude_part7), 2);
% 
% attitude_part8 = part8outdoorego(:, 5:7);
% attitude_part8 = round(cell2mat(attitude_part8), 2);
% 
% attitude_part9 = part9outdoorego(:, 5:7);
% attitude_part9 = round(cell2mat(attitude_part9), 2);
% 
% attitude_part10 = part10outdoorego(:, 5:7);
% attitude_part10 = round(cell2mat(attitude_part10), 2);

% clear attitude_part1 attitude_part2 attitude_part3_1 attitude_part3_2;
% clear attitude_part4_1 attitude_part4_2 attitude_part4_3 attitude_part5;
% clear attitude_part6 attitude_part7 attitude_part8 attitude_part9;
% clear attitude_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze linear velocities data
linVel_part1 = part1outdoorego(:, 8:10);
linVel_part1 = round(cell2mat(linVel_part1), 2);

linVel_part2 = part2outdoorego(:, 8:10);
linVel_part2 = round(cell2mat(linVel_part2), 2);

linVel_part3_1 = part3outdoorego_1(:, 8:10);
linVel_part3_1 = round(cell2mat(linVel_part3_1), 2);

linVel_part3_2 = part3outdoorego_2(:, 8:10);
linVel_part3_2 = round(cell2mat(linVel_part3_2), 2);

linVel_part4_1 = part4outdoorego_1(:, 8:10);
linVel_part4_1 = round(cell2mat(linVel_part4_1), 2);

linVel_part4_2 = part4outdoorego_2(:, 8:10);
linVel_part4_2 = round(cell2mat(linVel_part4_2), 2);

linVel_part4_3 = part4outdoorego_3(:, 8:10);
linVel_part4_3 = round(cell2mat(linVel_part4_3), 2);

linVel_part5 = part5outdoorego(:, 8:10);
linVel_part5 = round(cell2mat(linVel_part5), 2);

linVel_part6 = part6outdoorego(:, 8:10);
linVel_part6 = round(cell2mat(linVel_part6), 2);

linVel_part7 = part7outdoorego(:, 8:10);
linVel_part7 = round(cell2mat(linVel_part7), 2);

linVel_part8 = part8outdoorego(:, 8:10);
linVel_part8 = round(cell2mat(linVel_part8), 2);

linVel_part9 = part9outdoorego(:, 8:10);
linVel_part9 = round(cell2mat(linVel_part9), 2);

linVel_part10 = part10outdoorego(:, 8:10);
linVel_part10 = round(cell2mat(linVel_part10), 2);

% Plot linear velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, linVel_part9(:, 1));
xlabel("Seconds")
ylabel("m/s")
title("EGO outdoor participant 9 linear velocity in x")
subplot(3, 1, 2);
plot(t, linVel_part9(:, 2));
xlabel("Seconds")
ylabel("m/s")
title("EGO outdoor participant 9 linear velocity in y")
subplot(3, 1, 3);
plot(t, linVel_part9(:, 3));
xlabel("Seconds")
ylabel("m/s")
title("EGO outdoor participant 9 linear velocity in z")

clear linVel_part1 linVel_part2 linVel_part3_1 linVel_part3_2;
clear linVel_part4_1 linVel_part4_2 linVel_part4_3 linVel_part5;
clear linVel_part6 linVel_part7 linVel_part8 linVel_part9 linVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze angular velocities data
angVel_part1 = part1outdoorego(:, 11:13);
angVel_part1 = round(cell2mat(angVel_part1), 2);

angVel_part2 = part2outdoorego(:, 11:13);
angVel_part2 = round(cell2mat(angVel_part2), 2);

angVel_part3_1 = part3outdoorego_1(:, 11:13);
angVel_part3_1 = round(cell2mat(angVel_part3_1), 2);

angVel_part3_2 = part3outdoorego_2(:, 11:13);
angVel_part3_2 = round(cell2mat(angVel_part3_2), 2);

angVel_part4_1 = part4outdoorego_1(:, 11:13);
angVel_part4_1 = round(cell2mat(angVel_part4_1), 2);

angVel_part4_2 = part4outdoorego_2(:, 11:13);
angVel_part4_2 = round(cell2mat(angVel_part4_2), 2);

angVel_part4_3 = part4outdoorego_3(:, 11:13);
angVel_part4_3 = round(cell2mat(angVel_part4_3), 2);

angVel_part5 = part5outdoorego(:, 11:13);
angVel_part5 = round(cell2mat(angVel_part5), 2);

angVel_part6 = part6outdoorego(:, 11:13);
angVel_part6 = round(cell2mat(angVel_part6), 2);

angVel_part7 = part7outdoorego(:, 11:13);
angVel_part7 = round(cell2mat(angVel_part7), 2);

angVel_part8 = part8outdoorego(:, 11:13);
angVel_part8 = round(cell2mat(angVel_part8), 2);

angVel_part9 = part9outdoorego(:, 11:13);
angVel_part9 = round(cell2mat(angVel_part9), 2);

angVel_part10 = part10outdoorego(:, 11:13);
angVel_part10 = round(cell2mat(angVel_part10), 2);

% Plot angular velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, angVel_part9(:, 1));
xlabel("Seconds")
ylabel("deg/s")
title("EGO outdoor participant 9 angular velocity in roll")
subplot(3, 1, 2);
plot(t, angVel_part9(:, 2));
xlabel("Seconds")
ylabel("deg/s")
title("EGO outdoor participant 9 angular velocity in pitch")
subplot(3, 1, 3);
plot(t, angVel_part9(:, 3));
xlabel("Seconds")
ylabel("deg/s")
title("EGO outdoor participant 9 angular velocity in yaw")

clear t;
clear angVel_part1 angVel_part2 angVel_part3_1 angVel_part3_2;
clear angVel_part4_1 angVel_part4_2 angVel_part4_3 angVel_part5;
clear angVel_part6 angVel_part7 angVel_part8 angVel_part9 angVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle distance data
obsDist_part1 = part1outdoorego(:, 14);
obsDist_part1 = round(cell2mat(obsDist_part1), 2);

obsDist_part2 = part2outdoorego(:, 14);
obsDist_part2 = round(cell2mat(obsDist_part2), 2);

obsDist_part3_1 = part3outdoorego_1(:, 14);
obsDist_part3_1 = round(cell2mat(obsDist_part3_1), 2);

obsDist_part3_2 = part3outdoorego_2(:, 14);
obsDist_part3_2 = round(cell2mat(obsDist_part3_2), 2);

obsDist_part4_1 = part4outdoorego_1(:, 14);
obsDist_part4_1 = round(cell2mat(obsDist_part4_1), 2);

obsDist_part4_2 = part4outdoorego_2(:, 14);
obsDist_part4_2 = round(cell2mat(obsDist_part4_2), 2);

obsDist_part4_3 = part4outdoorego_3(:, 14);
obsDist_part4_3 = round(cell2mat(obsDist_part4_3), 2);

obsDist_part5 = part5outdoorego(:, 14);
obsDist_part5 = round(cell2mat(obsDist_part5), 2);

obsDist_part6 = part6outdoorego(:, 14);
obsDist_part6 = round(cell2mat(obsDist_part6), 2);

obsDist_part7 = part7outdoorego(:, 14);
obsDist_part7 = round(cell2mat(obsDist_part7), 2);

obsDist_part8 = part8outdoorego(:, 14);
obsDist_part8 = round(cell2mat(obsDist_part8), 2);

obsDist_part9 = part9outdoorego(:, 14);
obsDist_part9 = round(cell2mat(obsDist_part9), 2);

obsDist_part10 = part10outdoorego(:, 14);
obsDist_part10 = round(cell2mat(obsDist_part10), 2);

obsDist_EGO_Outdoor = [obsDist_part1; obsDist_part2; obsDist_part3_1; obsDist_part3_2; obsDist_part4_1; obsDist_part4_2; obsDist_part4_3; obsDist_part5; obsDist_part6; obsDist_part7; obsDist_part8; obsDist_part9; obsDist_part10];
obsDist_EGO_Outdoor(obsDist_EGO_Outdoor == Inf) = [];

% Descriptive statistics
% Mean
mean_obsDist_EGO_Outdoor = mean(obsDist_EGO_Outdoor);

% Median
median_obsDist_EGO_Outdoor = median(obsDist_EGO_Outdoor);

% Standard deviation
std_obsDist_EGO_Outdoor = std(obsDist_EGO_Outdoor);

% Variance
var_obsDist_EGO_Outdoor = var(obsDist_EGO_Outdoor);

% Distribution
intervals = 60;
boundaries_obsDist_Outdoor = linspace(0, 30, intervals+1);
distribution_obsDist_EGO_Outdoor = histcounts(obsDist_EGO_Outdoor, boundaries_obsDist_Outdoor);

% Distribution plot
figure;
histogram(obsDist_EGO_Outdoor, boundaries_obsDist_Outdoor)
title("EGO outdoor obstacle distance distribution [0, 30]")
xlabel("Meters")
ylabel("Number of readings")

clear intervals obsDist_EGO_Outdoor boundaries_obsDist_Outdoor;
clear obsDist_part1 obsDist_part2 obsDist_part3_1 obsDist_part3_2;
clear obsDist_part4_1 obsDist_part4_2 obsDist_part4_3 obsDist_part5;
clear obsDist_part6 obsDist_part7 obsDist_part8 obsDist_part9;
clear obsDist_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle position data
obsPos_part1 = part1outdoorego(:, 15);
obsPos_part1 = string(obsPos_part1);

obsPos_part2 = part2outdoorego(:, 15);
obsPos_part2 = string(obsPos_part2);

obsPos_part3_1 = part3outdoorego_1(:, 15);
obsPos_part3_1 = string(obsPos_part3_1);

obsPos_part3_2 = part3outdoorego_2(:, 15);
obsPos_part3_2 = string(obsPos_part3_2);

obsPos_part4_1 = part4outdoorego_1(:, 15);
obsPos_part4_1 = string(obsPos_part4_1);

obsPos_part4_2 = part4outdoorego_2(:, 15);
obsPos_part4_2 = string(obsPos_part4_2);

obsPos_part4_3 = part4outdoorego_3(:, 15);
obsPos_part4_3 = string(obsPos_part4_3);

obsPos_part5 = part5outdoorego(:, 15);
obsPos_part5 = string(obsPos_part5);

obsPos_part6 = part6outdoorego(:, 15);
obsPos_part6 = string(obsPos_part6);

obsPos_part7 = part7outdoorego(:, 15);
obsPos_part7 = string(obsPos_part7);

obsPos_part8 = part8outdoorego(:, 15);
obsPos_part8 = string(obsPos_part8);

obsPos_part9 = part9outdoorego(:, 15);
obsPos_part9 = string(obsPos_part9);

obsPos_part10 = part10outdoorego(:, 15);
obsPos_part10 = string(obsPos_part10);

obsPos_EGO_Outdoor = [obsPos_part1; obsPos_part2; obsPos_part3_1; obsPos_part3_2; obsPos_part4_1; obsPos_part4_2; obsPos_part4_3; obsPos_part5; obsPos_part6; obsPos_part7; obsPos_part8; obsPos_part9; obsPos_part10];
valueset = {'left', 'front-left', 'front', 'front-right', 'right', 'none'};
obsPos_EGO_Outdoor = categorical(obsPos_EGO_Outdoor, valueset, "Ordinal", true);

% Descriptive statistics
% Mode
mode_obsPos_EGO_Outdoor = mode(obsPos_EGO_Outdoor);

% Median
median_obsPos_EGO_Outdoor = median(obsPos_EGO_Outdoor);

% Distribution
distribution_obsPos_EGO_Outdoor = histcounts(obsPos_EGO_Outdoor);

% Distribution plot
figure;
histogram(obsPos_EGO_Outdoor)
title("EGO outdoor obstacle position distribution")
ylabel("Number of readings")

clear obsPos_EGO_Outdoor;
clear obsPos_part1 obsPos_part2 obsPos_part3_1 obsPos_part3_2;
clear obsPos_part4_1 obsPos_part4_2 obsPos_part4_3 obsPos_part5;
clear obsPos_part6 obsPos_part7 obsPos_part8 obsPos_part9 obsPos_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze identified targets data
%#ok<*ST2NM>
identTarg_part1 = part1outdoorego(:, 16);
identTarg_part1 = str2num(identTarg_part1{end});

identTarg_part2 = part2outdoorego(:, 16);
identTarg_part2 = str2num(identTarg_part2{end});

identTarg_part3_1 = part3outdoorego_1(:, 16);
identTarg_part3_1 = str2num(identTarg_part3_1{end});

identTarg_part3_2 = part3outdoorego_2(:, 16);
identTarg_part3_2 = str2num(identTarg_part3_2{end});

identTarg_part3 = unique([identTarg_part3_1, identTarg_part3_2]);

identTarg_part4_1 = part4outdoorego_1(:, 16);
identTarg_part4_1 = str2num(identTarg_part4_1{end});

identTarg_part4_2 = part4outdoorego_2(:, 16);
identTarg_part4_2 = str2num(identTarg_part4_2{end});

identTarg_part4_3 = part4outdoorego_3(:, 16);
identTarg_part4_3 = str2num(identTarg_part4_3{end});

identTarg_part4 = unique([identTarg_part4_1, identTarg_part4_2, identTarg_part4_3]);

identTarg_part5 = part5outdoorego(:, 16);
identTarg_part5 = str2num(identTarg_part5{end});

identTarg_part6 = part6outdoorego(:, 16);
identTarg_part6 = str2num(identTarg_part6{end});

identTarg_part7 = part7outdoorego(:, 16);
identTarg_part7 = str2num(identTarg_part7{end});

identTarg_part8 = part8outdoorego(:, 16);
identTarg_part8 = str2num(identTarg_part8{end});

identTarg_part9 = part9outdoorego(:, 16);
identTarg_part9 = str2num(identTarg_part9{end});

identTarg_part10 = part10outdoorego(:, 16);
identTarg_part10 = str2num(identTarg_part10{end});

numTarg_EGO_Outdoor = [size(identTarg_part1, 2); size(identTarg_part2, 2); size(identTarg_part3, 2); size(identTarg_part4, 2); size(identTarg_part5, 2); size(identTarg_part6, 2); size(identTarg_part7, 2); size(identTarg_part8, 2); size(identTarg_part9, 2); size(identTarg_part10, 2)];

% Descriptive statistics
% Mean
mean_numTarg_EGO_Outdoor = mean(numTarg_EGO_Outdoor);

% Median
median_numTarg_EGO_Outdoor = median(numTarg_EGO_Outdoor);

% Standard deviation
std_numTarg_EGO_Outdoor = std(numTarg_EGO_Outdoor);

% Variance
var_numTarg_EGO_Outdoor = var(numTarg_EGO_Outdoor);

% Distribution
valueset = {'0', '1', '2', '3', '4', '5'};
numTarg_EGO_Outdoor = categorical(string(numTarg_EGO_Outdoor), valueset, "Ordinal", true);
distribution_numTarg_EGO_Outdoor = histcounts(numTarg_EGO_Outdoor);

% Distribution plot
figure;
histogram(numTarg_EGO_Outdoor)
title("EGO outdoor number of identified markers distribution")
ylabel("Participants")
ylim([0, 10])

clear intervals valueset numTarg_EGO_Outdoor;
clear identTarg_part1 identTarg_part2 identTarg_part3 identTarg_part3_1;
clear identTarg_part3_2 identTarg_part4 identTarg_part4_1;
clear identTarg_part4_2 identTarg_part4_3 identTarg_part5 identTarg_part6;
clear identTarg_part7 identTarg_part8 identTarg_part9 identTarg_part10;

%--------------------------------------------------------------------------
clear timestamps_part1 timestamps_part2 timestamps_part3_1;
clear timestamps_part3_2 timestamps_part4_1 timestamps_part4_2;
clear timestamps_part4_3 timestamps_part5 timestamps_part6;
clear timestamps_part7 timestamps_part8 timestamps_part9 timestamps_part10;

clear part1outdoorego part2outdoorego part3outdoorego_1 part3outdoorego_2;
clear part4outdoorego_1 part4outdoorego_2 part4outdoorego_3;
clear part5outdoorego part6outdoorego part7outdoorego part8outdoorego;
clear part9outdoorego part10outdoorego;
%--------------------------------------------------------------------------