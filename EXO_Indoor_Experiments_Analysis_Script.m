%--------------------------------------------------------------------------
%% Script to analyse EXO indoor experiments data
clc;
% close all;

load("EXO_Indoor_Data.mat");

%--------------------------------------------------------------------------
%% Retrieve and analyze timestamp data
timestamps_part1 = part1indoorexo(:, 1);
timestamps_part1 = cell2mat(timestamps_part1);

timestamps_part2 = part2indoorexo(:, 1);
timestamps_part2 = cell2mat(timestamps_part2);

timestamps_part3 = part3indoorexo(:, 1);
timestamps_part3 = cell2mat(timestamps_part3);

timestamps_part4 = part4indoorexo(:, 1);
timestamps_part4 = cell2mat(timestamps_part4);

timestamps_part5 = part5indoorexo(:, 1);
timestamps_part5 = cell2mat(timestamps_part5);

timestamps_part6 = part6indoorexo(:, 1);
timestamps_part6 = cell2mat(timestamps_part6);

timestamps_part7 = part7indoorexo(:, 1);
timestamps_part7 = cell2mat(timestamps_part7);

timestamps_part8 = part8indoorexo(:, 1);
timestamps_part8 = cell2mat(timestamps_part8);

timestamps_part9 = part9indoorexo(:, 1);
timestamps_part9 = cell2mat(timestamps_part9);

timestamps_part10 = part10indoorexo(:, 1);
timestamps_part10 = cell2mat(timestamps_part10);

% Compute total times
totalTimes_EXO_Indoor = zeros(10, 1);

totalTimes_EXO_Indoor(1) = max(timestamps_part1) - min(timestamps_part1);

totalTimes_EXO_Indoor(2) = max(timestamps_part2) - min(timestamps_part2);
 
totalTimes_EXO_Indoor(3) = max(timestamps_part3) - min(timestamps_part3);

totalTimes_EXO_Indoor(4) = max(timestamps_part4) - min(timestamps_part4);

totalTimes_EXO_Indoor(5) = max(timestamps_part5) - min(timestamps_part5);

totalTimes_EXO_Indoor(6) = max(timestamps_part6) - min(timestamps_part6);

totalTimes_EXO_Indoor(7) = max(timestamps_part7) - min(timestamps_part7);

totalTimes_EXO_Indoor(8) = max(timestamps_part8) - min(timestamps_part8);

totalTimes_EXO_Indoor(9) = max(timestamps_part9) - min(timestamps_part9);

totalTimes_EXO_Indoor(10) = max(timestamps_part10) - min(timestamps_part10);

clear time1 time2 time3 time4;

% Compute descriptive statistics
% Mean
mean_totalTimes_EXO_Indoor = mean(totalTimes_EXO_Indoor);

% Median
median_totalTimes_EXO_Indoor = median(totalTimes_EXO_Indoor);

% Standard deviation
std_totalTimes_EXO_Indoor = std(totalTimes_EXO_Indoor);

% Variance
var_totalTimes_EXO_Indoor = var(totalTimes_EXO_Indoor);

% Distribution
intervals = 10;
boundaries_totalTimes_Indoor = linspace(0, 10, intervals+1);
distribution_totalTimes_EXO_Indoor = histcounts((totalTimes_EXO_Indoor ./ 60), boundaries_totalTimes_Indoor);

% Distribution plot
figure;
histogram((totalTimes_EXO_Indoor ./ 60), boundaries_totalTimes_Indoor)
title("EXO indoor total times distribution [0, 10]")
xlabel("Minutes")
ylim([0, 10])

clear boundaries_totalTimes_Indoor;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone position data
position_part1 = part1indoorexo(:, 2:4);
position_part1 = round(cell2mat(position_part1), 2);

position_part2 = part2indoorexo(:, 2:4);
position_part2 = round(cell2mat(position_part2), 2);

position_part3 = part3indoorexo(:, 2:4);
position_part3 = round(cell2mat(position_part3), 2);

position_part4 = part4indoorexo(:, 2:4);
position_part4 = round(cell2mat(position_part4), 2);

position_part5 = part5indoorexo(:, 2:4);
position_part5 = round(cell2mat(position_part5), 2);

position_part6 = part6indoorexo(:, 2:4);
position_part6 = round(cell2mat(position_part6), 2);

position_part7 = part7indoorexo(:, 2:4);
position_part7 = round(cell2mat(position_part7), 2);

position_part8 = part8indoorexo(:, 2:4);
position_part8 = round(cell2mat(position_part8), 2);

position_part9 = part9indoorexo(:, 2:4);
position_part9 = round(cell2mat(position_part9), 2);

position_part10 = part10indoorexo(:, 2:4);
position_part10 = round(cell2mat(position_part10), 2);

% Plot the motion of the drone
% fh = figure;
% fh.WindowState = 'maximized';
% loops = size(position_part1, 1);
% F(loops) = struct('cdata',[],'colormap',[]);
% scatter3(position_part1(1, 1), position_part1(1, 2), position_part1(1, 3), 50, "b", "filled");
% view(-20, 45);
% axis([-8, 8, -1, 18, 0, 5])
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
clear position_part1 position_part2 position_part3 position_part4;
clear position_part5 position_part6 position_part7 position_part8;
clear position_part9 position_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone attitude data
% attitude_part1 = part1indoorexo(:, 5:7);
% attitude_part1 = round(cell2mat(attitude_part1), 2);
% 
% attitude_part2 = part2indoorexo(:, 5:7);
% attitude_part2 = round(cell2mat(attitude_part2), 2);
% 
% attitude_part3 = part3indoorexo(:, 5:7);
% attitude_part3 = round(cell2mat(attitude_part3), 2);
% 
% attitude_part4 = part4indoorexo(:, 5:7);
% attitude_part4 = round(cell2mat(attitude_part4), 2);
% 
% attitude_part5 = part5indoorexo(:, 5:7);
% attitude_part5 = round(cell2mat(attitude_part5), 2);
% 
% attitude_part6 = part6indoorexo(:, 5:7);
% attitude_part6 = round(cell2mat(attitude_part6), 2);
% 
% attitude_part7 = part7indoorexo(:, 5:7);
% attitude_part7 = round(cell2mat(attitude_part7), 2);
% 
% attitude_part8 = part8indoorexo(:, 5:7);
% attitude_part8 = round(cell2mat(attitude_part8), 2);
% 
% attitude_part9 = part9indoorexo(:, 5:7);
% attitude_part9 = round(cell2mat(attitude_part9), 2);
% 
% attitude_part10 = part10indoorexo(:, 5:7);
% attitude_part10 = round(cell2mat(attitude_part10), 2);

% clear attitude_part1 attitude_part2 attitude_part3 attitude_part4; 
% clear attitude_part5 attitude_part6 attitude_part7 attitude_part8;
% clear attitude_part9 attitude_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze linear velocities data
linVel_part1 = part1indoorexo(:, 8:10);
linVel_part1 = round(cell2mat(linVel_part1), 2);

linVel_part2 = part2indoorexo(:, 8:10);
linVel_part2 = round(cell2mat(linVel_part2), 2);

linVel_part3 = part3indoorexo(:, 8:10);
linVel_part3 = round(cell2mat(linVel_part3), 2);

linVel_part4 = part4indoorexo(:, 8:10);
linVel_part4 = round(cell2mat(linVel_part4), 2);

linVel_part5 = part5indoorexo(:, 8:10);
linVel_part5 = round(cell2mat(linVel_part5), 2);

linVel_part6 = part6indoorexo(:, 8:10);
linVel_part6 = round(cell2mat(linVel_part6), 2);

linVel_part7 = part7indoorexo(:, 8:10);
linVel_part7 = round(cell2mat(linVel_part7), 2);

linVel_part8 = part8indoorexo(:, 8:10);
linVel_part8 = round(cell2mat(linVel_part8), 2);

linVel_part9 = part9indoorexo(:, 8:10);
linVel_part9 = round(cell2mat(linVel_part9), 2);

linVel_part10 = part10indoorexo(:, 8:10);
linVel_part10 = round(cell2mat(linVel_part10), 2);

% Plot linear velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, linVel_part9(:, 1));
xlabel("Seconds")
ylabel("m/s")
title("EXO indoor participant 9 linear velocity in x")
subplot(3, 1, 2);
plot(t, linVel_part9(:, 2));
xlabel("Seconds")
ylabel("m/s")
title("EXO indoor participant 9 linear velocity in y")
subplot(3, 1, 3);
plot(t, linVel_part9(:, 3));
xlabel("Seconds")
ylabel("m/s")
title("EXO indoor participant 9 linear velocity in z")

clear linVel_part1 linVel_part2 linVel_part3 linVel_part4 linVel_part5;
clear linVel_part6 linVel_part7 linVel_part8 linVel_part9 linVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze angular velocities data
angVel_part1 = part1indoorexo(:, 11:13);
angVel_part1 = round(cell2mat(angVel_part1), 2);

angVel_part2 = part2indoorexo(:, 11:13);
angVel_part2 = round(cell2mat(angVel_part2), 2);

angVel_part3 = part3indoorexo(:, 11:13);
angVel_part3 = round(cell2mat(angVel_part3), 2);

angVel_part4 = part4indoorexo(:, 11:13);
angVel_part4 = round(cell2mat(angVel_part4), 2);

angVel_part5 = part5indoorexo(:, 11:13);
angVel_part5 = round(cell2mat(angVel_part5), 2);

angVel_part6 = part6indoorexo(:, 11:13);
angVel_part6 = round(cell2mat(angVel_part6), 2);

angVel_part7 = part7indoorexo(:, 11:13);
angVel_part7 = round(cell2mat(angVel_part7), 2);

angVel_part8 = part8indoorexo(:, 11:13);
angVel_part8 = round(cell2mat(angVel_part8), 2);

angVel_part9 = part9indoorexo(:, 11:13);
angVel_part9 = round(cell2mat(angVel_part9), 2);

angVel_part10 = part10indoorexo(:, 11:13);
angVel_part10 = round(cell2mat(angVel_part10), 2);

% Plot angular velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, angVel_part9(:, 1));
xlabel("Seconds")
ylabel("deg/s")
title("EXO indoor participant 9 angular velocity in roll")
subplot(3, 1, 2);
plot(t, angVel_part9(:, 2));
xlabel("Seconds")
ylabel("deg/s")
title("EXO indoor participant 9 angular velocity in pitch")
subplot(3, 1, 3);
plot(t, angVel_part9(:, 3));
xlabel("Seconds")
ylabel("deg/s")
title("EXO indoor participant 9 angular velocity in yaw")

clear t;
clear angVel_part1 angVel_part2 angVel_part3 angVel_part4 angVel_part5;
clear angVel_part6 angVel_part7 angVel_part8 angVel_part9 angVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle distance data
obsDist_part1 = part1indoorexo(:, 14);
obsDist_part1 = round(cell2mat(obsDist_part1), 2);

obsDist_part2 = part2indoorexo(:, 14);
obsDist_part2 = round(cell2mat(obsDist_part2), 2);

obsDist_part3 = part3indoorexo(:, 14);
obsDist_part3 = round(cell2mat(obsDist_part3), 2);

obsDist_part4 = part4indoorexo(:, 14);
obsDist_part4 = round(cell2mat(obsDist_part4), 2);

obsDist_part5 = part5indoorexo(:, 14);
obsDist_part5 = round(cell2mat(obsDist_part5), 2);

obsDist_part6 = part6indoorexo(:, 14);
obsDist_part6 = round(cell2mat(obsDist_part6), 2);

obsDist_part7 = part7indoorexo(:, 14);
obsDist_part7 = round(cell2mat(obsDist_part7), 2);

obsDist_part8 = part8indoorexo(:, 14);
obsDist_part8 = round(cell2mat(obsDist_part8), 2);

obsDist_part9 = part9indoorexo(:, 14);
obsDist_part9 = round(cell2mat(obsDist_part9), 2);

obsDist_part10 = part10indoorexo(:, 14);
obsDist_part10 = round(cell2mat(obsDist_part10), 2);

obsDist_EXO_Indoor = [obsDist_part1; obsDist_part2; obsDist_part3; obsDist_part4; obsDist_part5; obsDist_part6; obsDist_part7; obsDist_part8; obsDist_part9; obsDist_part10];
obsDist_EXO_Indoor(obsDist_EXO_Indoor == Inf) = [];

% Descriptive statistics
% Mean
mean_obsDist_EXO_Indoor = mean(obsDist_EXO_Indoor);

% Median
median_obsDist_EXO_Indoor = median(obsDist_EXO_Indoor);

% Standard deviation
std_obsDist_EXO_Indoor = std(obsDist_EXO_Indoor);

% Variance
var_obsDist_EXO_Indoor = var(obsDist_EXO_Indoor);

% Distribution
intervals = 60;
boundaries_obsDist_Indoor = linspace(0, 30, intervals+1);
distribution_obsDist_EXO_Indoor = histcounts(obsDist_EXO_Indoor, boundaries_obsDist_Indoor);

% Distribution plot
figure;
histogram(obsDist_EXO_Indoor, boundaries_obsDist_Indoor)
title("EXO indoor obstacle distance distribution [0, 30]")
xlabel("Meters")
ylabel("Number of readings")

clear intervals obsDist_EXO_Indoor boundaries_obsDist_Indoor;
clear obsDist_part1 obsDist_part2 obsDist_part3 obsDist_part4;
clear obsDist_part5 obsDist_part6 obsDist_part7 obsDist_part8;
clear obsDist_part9 obsDist_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle position data
obsPos_part1 = part1indoorexo(:, 15);
obsPos_part1 = string(obsPos_part1);

obsPos_part2 = part2indoorexo(:, 15);
obsPos_part2 = string(obsPos_part2);

obsPos_part3 = part3indoorexo(:, 15);
obsPos_part3 = string(obsPos_part3);

obsPos_part4 = part4indoorexo(:, 15);
obsPos_part4 = string(obsPos_part4);

obsPos_part5 = part5indoorexo(:, 15);
obsPos_part5 = string(obsPos_part5);

obsPos_part6 = part6indoorexo(:, 15);
obsPos_part6 = string(obsPos_part6);

obsPos_part7 = part7indoorexo(:, 15);
obsPos_part7 = string(obsPos_part7);

obsPos_part8 = part8indoorexo(:, 15);
obsPos_part8 = string(obsPos_part8);

obsPos_part9 = part9indoorexo(:, 15);
obsPos_part9 = string(obsPos_part9);

obsPos_part10 = part10indoorexo(:, 15);
obsPos_part10 = string(obsPos_part10);

obsPos_EXO_Indoor = [obsPos_part1; obsPos_part2; obsPos_part3; obsPos_part4; obsPos_part5; obsPos_part6; obsPos_part7; obsPos_part8; obsPos_part9; obsPos_part10];
valueset = {'left', 'front-left', 'front', 'front-right', 'right', 'none'};
obsPos_EXO_Indoor = categorical(obsPos_EXO_Indoor, valueset, "Ordinal", true);

% Descriptive statistics
% Mode
mode_obsPos_EXO_Indoor = mode(obsPos_EXO_Indoor);

% Median
median_obsPos_EXO_Indoor = median(obsPos_EXO_Indoor);

% Distribution
distribution_obsPos_EXO_Indoor = histcounts(obsPos_EXO_Indoor);

% Distribution plot
figure;
histogram(obsPos_EXO_Indoor)
title("EXO indoor obstacle position distribution")
ylabel("Number of readings")

clear obsPos_EXO_Indoor;
clear obsPos_part1 obsPos_part2 obsPos_part3 obsPos_part4 obsPos_part5;
clear obsPos_part6 obsPos_part7 obsPos_part8 obsPos_part9 obsPos_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze identified targets data
%#ok<*ST2NM>
identTarg_part1 = part1indoorexo(:, 16);
identTarg_part1 = str2num(identTarg_part1{end});

identTarg_part2 = part2indoorexo(:, 16);
identTarg_part2 = str2num(identTarg_part2{end});

identTarg_part3 = part3indoorexo(:, 16);
identTarg_part3 = str2num(identTarg_part3{end});

identTarg_part4 = part4indoorexo(:, 16);
identTarg_part4 = str2num(identTarg_part4{end});

identTarg_part5 = part5indoorexo(:, 16);
identTarg_part5 = str2num(identTarg_part5{end});

identTarg_part6 = part6indoorexo(:, 16);
identTarg_part6 = str2num(identTarg_part6{end});

identTarg_part7 = part7indoorexo(:, 16);
identTarg_part7 = str2num(identTarg_part7{end});

identTarg_part8 = part8indoorexo(:, 16);
identTarg_part8 = str2num(identTarg_part8{end});

identTarg_part9 = part9indoorexo(:, 16);
identTarg_part9 = str2num(identTarg_part9{end});

identTarg_part10 = part10indoorexo(:, 16);
identTarg_part10 = str2num(identTarg_part10{end});

numTarg_EXO_Indoor = [size(identTarg_part1, 2); size(identTarg_part2, 2); size(identTarg_part3, 2); size(identTarg_part4, 2); size(identTarg_part5, 2); size(identTarg_part6, 2); size(identTarg_part7, 2); size(identTarg_part8, 2); size(identTarg_part9, 2); size(identTarg_part10, 2)];

% Descriptive statistics
% Mean
mean_numTarg_EXO_Indoor = mean(numTarg_EXO_Indoor);

% Median
median_numTarg_EXO_Indoor = median(numTarg_EXO_Indoor);

% Standard deviation
std_numTarg_EXO_Indoor = std(numTarg_EXO_Indoor);

% Variance
var_numTarg_EXO_Indoor = var(numTarg_EXO_Indoor);

% Distribution
valueset = {'0', '1', '2', '3', '4', '5'};
numTarg_EXO_Indoor = categorical(string(numTarg_EXO_Indoor), valueset, "Ordinal", true);
distribution_numTarg_EXO_Indoor = histcounts(numTarg_EXO_Indoor);

% Distribution plot
figure;
histogram(numTarg_EXO_Indoor)
title("EXO indoor number of identified markers distribution")
ylabel("Participants")
ylim([0, 10])

clear intervals valueset numTarg_EXO_Indoor;
clear identTarg_part1 identTarg_part2 identTarg_part3 identTarg_part4;
clear identTarg_part5 identTarg_part6 identTarg_part7 identTarg_part8;
clear identTarg_part9 identTarg_part10;

%--------------------------------------------------------------------------
clear timestamps_part1 timestamps_part2 timestamps_part3;
clear timestamps_part4 timestamps_part5 timestamps_part6;
clear timestamps_part7 timestamps_part8 timestamps_part9 timestamps_part10;

clear part1indoorexo part2indoorexo part3indoorexo part4indoorexo;
clear part5indoorexo part6indoorexo part7indoorexo part8indoorexo;
clear part9indoorexo part10indoorexo;
%--------------------------------------------------------------------------