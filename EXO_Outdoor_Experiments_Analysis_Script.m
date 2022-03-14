%--------------------------------------------------------------------------
%% Script to analyse EXO outdoor experiments data
clc;
% close all;

load("EXO_Outdoor_Data.mat");

%--------------------------------------------------------------------------
%% Retrieve and analyze timestamp data
timestamps_part1 = part1outdoorexo(:, 1);
timestamps_part1 = cell2mat(timestamps_part1);

timestamps_part2 = part2outdoorexo(:, 1);
timestamps_part2 = cell2mat(timestamps_part2);

timestamps_part3_1 = part3outdoorexo_1(:, 1);
timestamps_part3_1 = cell2mat(timestamps_part3_1);

timestamps_part3_2 = part3outdoorexo_2(:, 1);
timestamps_part3_2 = cell2mat(timestamps_part3_2);

timestamps_part4 = part4outdoorexo(:, 1);
timestamps_part4 = cell2mat(timestamps_part4);

timestamps_part5 = part5outdoorexo(:, 1);
timestamps_part5 = cell2mat(timestamps_part5);

timestamps_part6 = part6outdoorexo(:, 1);
timestamps_part6 = cell2mat(timestamps_part6);

timestamps_part7 = part7outdoorexo(:, 1);
timestamps_part7 = cell2mat(timestamps_part7);

timestamps_part8 = part8outdoorexo(:, 1);
timestamps_part8 = cell2mat(timestamps_part8);

timestamps_part9 = part9outdoorexo(:, 1);
timestamps_part9 = cell2mat(timestamps_part9);

timestamps_part10 = part10outdoorexo(:, 1);
timestamps_part10 = cell2mat(timestamps_part10);

% Compute total times
totalTimes_EXO_Outdoor = zeros(10, 1);

totalTimes_EXO_Outdoor(1) = max(timestamps_part1) - min(timestamps_part1);

totalTimes_EXO_Outdoor(2) = max(timestamps_part2) - min(timestamps_part2);

time1 = max(timestamps_part3_1) - min(timestamps_part3_1);
time2 = max(timestamps_part3_2) - min(timestamps_part3_2);
totalTimes_EXO_Outdoor(3) = time1 + time2;

totalTimes_EXO_Outdoor(4) = max(timestamps_part4) - min(timestamps_part4);

totalTimes_EXO_Outdoor(5) = max(timestamps_part5) - min(timestamps_part5);

totalTimes_EXO_Outdoor(6) = max(timestamps_part6) - min(timestamps_part6);

totalTimes_EXO_Outdoor(7) = max(timestamps_part7) - min(timestamps_part7);

totalTimes_EXO_Outdoor(8) = max(timestamps_part8) - min(timestamps_part8);

totalTimes_EXO_Outdoor(9) = max(timestamps_part9) - min(timestamps_part9);

totalTimes_EXO_Outdoor(10) = max(timestamps_part10) - min(timestamps_part10);

clear time1 time2;

% Compute descriptive statistics
% Mean
mean_totalTimes_EXO_Outdoor = mean(totalTimes_EXO_Outdoor);

% Median
median_totalTimes_EXO_Outdoor = median(totalTimes_EXO_Outdoor);

% Standard deviation
std_totalTimes_EXO_Outdoor = std(totalTimes_EXO_Outdoor);

% Variance
var_totalTimes_EXO_Outdoor = var(totalTimes_EXO_Outdoor);

% Distribution
intervals = 15;
boundaries_totalTimes_Outdoor = linspace(0, 15, intervals+1);
distribution_totalTimes_EXO_Outdoor = histcounts((totalTimes_EXO_Outdoor ./ 60), boundaries_totalTimes_Outdoor);

% Distribution plot
figure;
histogram((totalTimes_EXO_Outdoor ./ 60), boundaries_totalTimes_Outdoor)
title("EXO outdoor total times distribution [0, 15]")
xlabel("Minutes")
ylabel("Participants")
ylim([0, 10])

clear boundaries_totalTimes_Outdoor;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone position data
position_part1 = part1outdoorexo(:, 2:4);
position_part1 = round(cell2mat(position_part1), 2);

position_part2 = part2outdoorexo(:, 2:4);
position_part2 = round(cell2mat(position_part2), 2);

position_part3_1 = part3outdoorexo_1(:, 2:4);
position_part3_1 = round(cell2mat(position_part3_1), 2);

position_part3_2 = part3outdoorexo_2(:, 2:4);
position_part3_2 = round(cell2mat(position_part3_2), 2);

position_part4 = part4outdoorexo(:, 2:4);
position_part4 = round(cell2mat(position_part4), 2);

position_part5 = part5outdoorexo(:, 2:4);
position_part5 = round(cell2mat(position_part5), 2);

position_part6 = part6outdoorexo(:, 2:4);
position_part6 = round(cell2mat(position_part6), 2);

position_part7 = part7outdoorexo(:, 2:4);
position_part7 = round(cell2mat(position_part7), 2);

position_part8 = part8outdoorexo(:, 2:4);
position_part8 = round(cell2mat(position_part8), 2);

position_part9 = part9outdoorexo(:, 2:4);
position_part9 = round(cell2mat(position_part9), 2);

position_part10 = part10outdoorexo(:, 2:4);
position_part10 = round(cell2mat(position_part10), 2);

% Plot the motion of the drone
% fh = figure;
% fh.WindowState = 'maximized';
% loops = size(position_part1, 1);
% F(loops) = struct('cdata',[],'colormap',[]);
% scatter3(position_part1(1, 1), position_part1(1, 2), position_part1(1, 3), 50, "b", "filled");
% view(90, 90);
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
clear position_part4 position_part5 position_part6 position_part7;
clear position_part8 position_part9 position_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone attitude data
% attitude_part1 = part1outdoorexo(:, 5:7);
% attitude_part1 = round(cell2mat(attitude_part1), 2);
% 
% attitude_part2 = part2outdoorexo(:, 5:7);
% attitude_part2 = round(cell2mat(attitude_part2), 2);
% 
% attitude_part3_1 = part3outdoorexo_1(:, 5:7);
% attitude_part3_1 = round(cell2mat(attitude_part3_1), 2);
% 
% attitude_part3_2 = part3outdoorexo_2(:, 5:7);
% attitude_part3_2 = round(cell2mat(attitude_part3_2), 2);
% 
% attitude_part4 = part4outdoorexo(:, 5:7);
% attitude_part4 = round(cell2mat(attitude_part4), 2);
% 
% attitude_part5 = part5outdoorexo(:, 5:7);
% attitude_part5 = round(cell2mat(attitude_part5), 2);
% 
% attitude_part6 = part6outdoorexo(:, 5:7);
% attitude_part6 = round(cell2mat(attitude_part6), 2);
% 
% attitude_part7 = part7outdoorexo(:, 5:7);
% attitude_part7 = round(cell2mat(attitude_part7), 2);
% 
% attitude_part8 = part8outdoorexo(:, 5:7);
% attitude_part8 = round(cell2mat(attitude_part8), 2);
% 
% attitude_part9 = part9outdoorexo(:, 5:7);
% attitude_part9 = round(cell2mat(attitude_part9), 2);
% 
% attitude_part10 = part10outdoorexo(:, 5:7);
% attitude_part10 = round(cell2mat(attitude_part10), 2);

% clear attitude_part1 attitude_part2 attitude_part3_1 attitude_part3_2;
% clear attitude_part4 attitude_part5 attitude_part6 attitude_part7;
% clear attitude_part8 attitude_part9 attitude_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze linear velocities data
linVel_part1 = part1outdoorexo(:, 8:10);
linVel_part1 = round(cell2mat(linVel_part1), 2);

linVel_part2 = part2outdoorexo(:, 8:10);
linVel_part2 = round(cell2mat(linVel_part2), 2);

linVel_part3_1 = part3outdoorexo_1(:, 8:10);
linVel_part3_1 = round(cell2mat(linVel_part3_1), 2);

linVel_part3_2 = part3outdoorexo_2(:, 8:10);
linVel_part3_2 = round(cell2mat(linVel_part3_2), 2);

linVel_part4 = part4outdoorexo(:, 8:10);
linVel_part4 = round(cell2mat(linVel_part4), 2);

linVel_part5 = part5outdoorexo(:, 8:10);
linVel_part5 = round(cell2mat(linVel_part5), 2);

linVel_part6 = part6outdoorexo(:, 8:10);
linVel_part6 = round(cell2mat(linVel_part6), 2);

linVel_part7 = part7outdoorexo(:, 8:10);
linVel_part7 = round(cell2mat(linVel_part7), 2);

linVel_part8 = part8outdoorexo(:, 8:10);
linVel_part8 = round(cell2mat(linVel_part8), 2);

linVel_part9 = part9outdoorexo(:, 8:10);
linVel_part9 = round(cell2mat(linVel_part9), 2);

linVel_part10 = part10outdoorexo(:, 8:10);
linVel_part10 = round(cell2mat(linVel_part10), 2);

% Plot linear velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, linVel_part9(:, 1));
xlabel("Seconds")
ylabel("m/s")
title("EXO outdoor participant 9 linear velocity in x")
subplot(3, 1, 2);
plot(t, linVel_part9(:, 2));
xlabel("Seconds")
ylabel("m/s")
title("EXO outdoor participant 9 linear velocity in y")
subplot(3, 1, 3);
plot(t, linVel_part9(:, 3));
xlabel("Seconds")
ylabel("m/s")
title("EXO outdoor participant 9 linear velocity in z")

clear linVel_part1 linVel_part2 linVel_part3_1 linVel_part3_2;
clear linVel_part4 linVel_part5 linVel_part6 linVel_part7 linVel_part8;
clear linVel_part9 linVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze angular velocities data
angVel_part1 = part1outdoorexo(:, 11:13);
angVel_part1 = round(cell2mat(angVel_part1), 2);

angVel_part2 = part2outdoorexo(:, 11:13);
angVel_part2 = round(cell2mat(angVel_part2), 2);

angVel_part3_1 = part3outdoorexo_1(:, 11:13);
angVel_part3_1 = round(cell2mat(angVel_part3_1), 2);

angVel_part3_2 = part3outdoorexo_2(:, 11:13);
angVel_part3_2 = round(cell2mat(angVel_part3_2), 2);

angVel_part4 = part4outdoorexo(:, 11:13);
angVel_part4 = round(cell2mat(angVel_part4), 2);

angVel_part5 = part5outdoorexo(:, 11:13);
angVel_part5 = round(cell2mat(angVel_part5), 2);

angVel_part6 = part6outdoorexo(:, 11:13);
angVel_part6 = round(cell2mat(angVel_part6), 2);

angVel_part7 = part7outdoorexo(:, 11:13);
angVel_part7 = round(cell2mat(angVel_part7), 2);

angVel_part8 = part8outdoorexo(:, 11:13);
angVel_part8 = round(cell2mat(angVel_part8), 2);

angVel_part9 = part9outdoorexo(:, 11:13);
angVel_part9 = round(cell2mat(angVel_part9), 2);

angVel_part10 = part10outdoorexo(:, 11:13);
angVel_part10 = round(cell2mat(angVel_part10), 2);

% Plot angular velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, angVel_part9(:, 1));
xlabel("Seconds")
ylabel("deg/s")
title("EXO outdoor participant 9 angular velocity in roll")
subplot(3, 1, 2);
plot(t, angVel_part9(:, 2));
xlabel("Seconds")
ylabel("deg/s")
title("EXO outdoor participant 9 angular velocity in pitch")
subplot(3, 1, 3);
plot(t, angVel_part9(:, 3));
xlabel("Seconds")
ylabel("deg/s")
title("EXO outdoor participant 9 angular velocity in yaw")

clear t;
clear angVel_part1 angVel_part2 angVel_part3_1 angVel_part3_2;
clear angVel_part4 angVel_part5 angVel_part6 angVel_part7 angVel_part8;
clear angVel_part9 angVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle distance data
obsDist_part1 = part1outdoorexo(:, 14);
obsDist_part1 = round(cell2mat(obsDist_part1), 2);

obsDist_part2 = part2outdoorexo(:, 14);
obsDist_part2 = round(cell2mat(obsDist_part2), 2);

obsDist_part3_1 = part3outdoorexo_1(:, 14);
obsDist_part3_1 = round(cell2mat(obsDist_part3_1), 2);

obsDist_part3_2 = part3outdoorexo_2(:, 14);
obsDist_part3_2 = round(cell2mat(obsDist_part3_2), 2);

obsDist_part4 = part4outdoorexo(:, 14);
obsDist_part4 = round(cell2mat(obsDist_part4), 2);

obsDist_part5 = part5outdoorexo(:, 14);
obsDist_part5 = round(cell2mat(obsDist_part5), 2);

obsDist_part6 = part6outdoorexo(:, 14);
obsDist_part6 = round(cell2mat(obsDist_part6), 2);

obsDist_part7 = part7outdoorexo(:, 14);
obsDist_part7 = round(cell2mat(obsDist_part7), 2);

obsDist_part8 = part8outdoorexo(:, 14);
obsDist_part8 = round(cell2mat(obsDist_part8), 2);

obsDist_part9 = part9outdoorexo(:, 14);
obsDist_part9 = round(cell2mat(obsDist_part9), 2);

obsDist_part10 = part10outdoorexo(:, 14);
obsDist_part10 = round(cell2mat(obsDist_part10), 2);

obsDist_EXO_Outdoor = [obsDist_part1; obsDist_part2; obsDist_part3_1; obsDist_part3_2; obsDist_part4; obsDist_part5; obsDist_part6; obsDist_part7; obsDist_part8; obsDist_part9; obsDist_part10];
obsDist_EXO_Outdoor(obsDist_EXO_Outdoor == Inf) = [];

% Descriptive statistics
% Mean
mean_obsDist_EXO_Outdoor = mean(obsDist_EXO_Outdoor);

% Median
median_obsDist_EXO_Outdoor = median(obsDist_EXO_Outdoor);

% Standard deviation
std_obsDist_EXO_Outdoor = std(obsDist_EXO_Outdoor);

% Variance
var_obsDist_EXO_Outdoor = var(obsDist_EXO_Outdoor);

% Distribution
intervals = 60;
boundaries_obsDist_Outdoor = linspace(0, 30, intervals+1);
distribution_obsDist_EXO_Outdoor = histcounts(obsDist_EXO_Outdoor, boundaries_obsDist_Outdoor);

% Distribution plot
figure;
histogram(obsDist_EXO_Outdoor, boundaries_obsDist_Outdoor)
title("EXO outdoor obstacle distance distribution [0, 30]")
xlabel("Meters")
ylabel("Number of readings")

clear intervals obsDist_EXO_Outdoor boundaries_obsDist_Outdoor;
clear obsDist_part1 obsDist_part2 obsDist_part3_1 obsDist_part3_2;
clear obsDist_part4 obsDist_part5 obsDist_part6 obsDist_part7;
clear obsDist_part8 obsDist_part9 obsDist_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle position data
obsPos_part1 = part1outdoorexo(:, 15);
obsPos_part1 = string(obsPos_part1);

obsPos_part2 = part2outdoorexo(:, 15);
obsPos_part2 = string(obsPos_part2);

obsPos_part3_1 = part3outdoorexo_1(:, 15);
obsPos_part3_1 = string(obsPos_part3_1);

obsPos_part3_2 = part3outdoorexo_2(:, 15);
obsPos_part3_2 = string(obsPos_part3_2);

obsPos_part4 = part4outdoorexo(:, 15);
obsPos_part4 = string(obsPos_part4);

obsPos_part5 = part5outdoorexo(:, 15);
obsPos_part5 = string(obsPos_part5);

obsPos_part6 = part6outdoorexo(:, 15);
obsPos_part6 = string(obsPos_part6);

obsPos_part7 = part7outdoorexo(:, 15);
obsPos_part7 = string(obsPos_part7);

obsPos_part8 = part8outdoorexo(:, 15);
obsPos_part8 = string(obsPos_part8);

obsPos_part9 = part9outdoorexo(:, 15);
obsPos_part9 = string(obsPos_part9);

obsPos_part10 = part10outdoorexo(:, 15);
obsPos_part10 = string(obsPos_part10);

obsPos_EXO_Outdoor = [obsPos_part1; obsPos_part2; obsPos_part3_1; obsPos_part3_2; obsPos_part4; obsPos_part5; obsPos_part6; obsPos_part7; obsPos_part8; obsPos_part9; obsPos_part10];
valueset = {'left', 'front-left', 'front', 'front-right', 'right', 'none'};
obsPos_EXO_Outdoor = categorical(obsPos_EXO_Outdoor, valueset, "Ordinal", true);

% Descriptive statistics
% Mode
mode_obsPos_EXO_Outdoor = mode(obsPos_EXO_Outdoor);

% Median
median_obsPos_EXO_Outdoor = median(obsPos_EXO_Outdoor);

% Distribution
distribution_obsPos_EXO_Outdoor = histcounts(obsPos_EXO_Outdoor);

% Distribution plot
figure;
histogram(obsPos_EXO_Outdoor)
title("EXO outdoor obstacle position distribution")
ylabel("Number of readings")

clear obsPos_EXO_Outdoor;
clear obsPos_part1 obsPos_part2 obsPos_part3_1 obsPos_part3_2;
clear obsPos_part4 obsPos_part5 obsPos_part6 obsPos_part7 obsPos_part8;
clear obsPos_part9 obsPos_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze identified targets data
%#ok<*ST2NM>
identTarg_part1 = part1outdoorexo(:, 16);
identTarg_part1 = str2num(identTarg_part1{end});

identTarg_part2 = part2outdoorexo(:, 16);
identTarg_part2 = str2num(identTarg_part2{end});

identTarg_part3_1 = part3outdoorexo_1(:, 16);
identTarg_part3_1 = str2num(identTarg_part3_1{end});

identTarg_part3_2 = part3outdoorexo_2(:, 16);
identTarg_part3_2 = str2num(identTarg_part3_2{end});

identTarg_part3 = unique([identTarg_part3_1, identTarg_part3_2]);

identTarg_part4 = part4outdoorexo(:, 16);
identTarg_part4 = str2num(identTarg_part4{end});

identTarg_part5 = part5outdoorexo(:, 16);
identTarg_part5 = str2num(identTarg_part5{end});

identTarg_part6 = part6outdoorexo(:, 16);
identTarg_part6 = str2num(identTarg_part6{end});

identTarg_part7 = part7outdoorexo(:, 16);
identTarg_part7 = str2num(identTarg_part7{end});

identTarg_part8 = part8outdoorexo(:, 16);
identTarg_part8 = str2num(identTarg_part8{end});

identTarg_part9 = part9outdoorexo(:, 16);
identTarg_part9 = str2num(identTarg_part9{end});

identTarg_part10 = part10outdoorexo(:, 16);
identTarg_part10 = str2num(identTarg_part10{end});

numTarg_EXO_Outdoor = [size(identTarg_part1, 2); size(identTarg_part2, 2); size(identTarg_part3, 2); size(identTarg_part4, 2); size(identTarg_part5, 2); size(identTarg_part6, 2); size(identTarg_part7, 2); size(identTarg_part8, 2); size(identTarg_part9, 2); size(identTarg_part10, 2)];

% Descriptive statistics
% Mean
mean_numTarg_EXO_Outdoor = mean(numTarg_EXO_Outdoor);

% Median
median_numTarg_EXO_Outdoor = median(numTarg_EXO_Outdoor);

% Standard deviation
std_numTarg_EXO_Outdoor = std(numTarg_EXO_Outdoor);

% Variance
var_numTarg_EXO_Outdoor = var(numTarg_EXO_Outdoor);

% Distribution
valueset = {'0', '1', '2', '3', '4', '5'};
numTarg_EXO_Outdoor = categorical(string(numTarg_EXO_Outdoor), valueset, "Ordinal", true);
distribution_numTarg_EXO_Outdoor = histcounts(numTarg_EXO_Outdoor);

% Distribution plot
figure;
histogram(numTarg_EXO_Outdoor)
title("EXO outdoor number of identified markers distribution")
ylabel("Participants")
ylim([0, 10])

clear intervals valueset numTarg_EXO_Outdoor;
clear identTarg_part1 identTarg_part2 identTarg_part3 identTarg_part3_1;
clear identTarg_part3_2 identTarg_part4 identTarg_part5 identTarg_part6;
clear identTarg_part7 identTarg_part8 identTarg_part9 identTarg_part10;

%--------------------------------------------------------------------------
clear timestamps_part1 timestamps_part2 timestamps_part3_1;
clear timestamps_part3_2 timestamps_part4 timestamps_part5;
clear timestamps_part6 timestamps_part7 timestamps_part8 timestamps_part9;
clear timestamps_part10;

clear part1outdoorexo part2outdoorexo part3outdoorexo_1 part3outdoorexo_2;
clear part4outdoorexo part5outdoorexo part6outdoorexo part7outdoorexo;
clear part8outdoorexo part9outdoorexo part10outdoorexo;
%--------------------------------------------------------------------------