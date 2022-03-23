%--------------------------------------------------------------------------
%% Script to analyse EGO indoor experiments data
clc;
close all;

load("EGO_Indoor_Data.mat");

%--------------------------------------------------------------------------
%% Retrieve and analyze timestamp data
timestamps_part1 = part1indoorego(:, 1);
timestamps_part1 = cell2mat(timestamps_part1);

timestamps_part2 = part2indoorego(:, 1);
timestamps_part2 = cell2mat(timestamps_part2);

timestamps_part3_1 = part3indoorego_1(:, 1);
timestamps_part3_1 = cell2mat(timestamps_part3_1);

timestamps_part3_2 = part3indoorego_2(:, 1);
timestamps_part3_2 = cell2mat(timestamps_part3_2);

timestamps_part3_3 = part3indoorego_3(:, 1);
timestamps_part3_3 = cell2mat(timestamps_part3_3);

timestamps_part3_4 = part3indoorego_4(:, 1);
timestamps_part3_4 = cell2mat(timestamps_part3_4);

timestamps_part4 = part4indoorego(:, 1);
timestamps_part4 = cell2mat(timestamps_part4);

timestamps_part5_1 = part5indoorego_1(:, 1);
timestamps_part5_1 = cell2mat(timestamps_part5_1);

timestamps_part5_2 = part5indoorego_2(:, 1);
timestamps_part5_2 = cell2mat(timestamps_part5_2);

timestamps_part5_3 = part5indoorego_3(:, 1);
timestamps_part5_3 = cell2mat(timestamps_part5_3);

timestamps_part6_1 = part6indoorego_1(:, 1);
timestamps_part6_1 = cell2mat(timestamps_part6_1);

timestamps_part6_2 = part6indoorego_2(:, 1);
timestamps_part6_2 = cell2mat(timestamps_part6_2);

timestamps_part7 = part7indoorego(:, 1);
timestamps_part7 = cell2mat(timestamps_part7);

timestamps_part8 = part8indoorego(:, 1);
timestamps_part8 = cell2mat(timestamps_part8);

timestamps_part9 = part9indoorego(:, 1);
timestamps_part9 = cell2mat(timestamps_part9);

timestamps_part10 = part10indoorego(:, 1);
timestamps_part10 = cell2mat(timestamps_part10);

% Compute total times
totalTimes_EGO_Indoor = zeros(10, 1);

totalTimes_EGO_Indoor(1) = max(timestamps_part1) - min(timestamps_part1);

totalTimes_EGO_Indoor(2) = max(timestamps_part2) - min(timestamps_part2);

time1 = max(timestamps_part3_1) - min(timestamps_part3_1);
time2 = max(timestamps_part3_2) - min(timestamps_part3_2);
time3 = max(timestamps_part3_3) - min(timestamps_part3_3);
time4 = max(timestamps_part3_4) - min(timestamps_part3_4);
totalTimes_EGO_Indoor(3) = time1 + time2 + time3 + time4;

totalTimes_EGO_Indoor(4) = max(timestamps_part4) - min(timestamps_part4);

time1 = max(timestamps_part5_1) - min(timestamps_part5_1);
time2 = max(timestamps_part5_2) - min(timestamps_part5_2);
time3 = max(timestamps_part5_3) - min(timestamps_part5_3);
totalTimes_EGO_Indoor(5) = time1 + time2 + time3;

time1 = max(timestamps_part6_1) - min(timestamps_part6_1);
time2 = max(timestamps_part6_2) - min(timestamps_part6_2);
totalTimes_EGO_Indoor(6) = time1 + time2;

totalTimes_EGO_Indoor(7) = max(timestamps_part7) - min(timestamps_part7);

totalTimes_EGO_Indoor(8) = max(timestamps_part8) - min(timestamps_part8);

totalTimes_EGO_Indoor(9) = max(timestamps_part9) - min(timestamps_part9);

totalTimes_EGO_Indoor(10) = max(timestamps_part10) - min(timestamps_part10);

clear time1 time2 time3 time4;

% Compute descriptive statistics
% Mean
mean_totalTimes_EGO_Indoor = mean(totalTimes_EGO_Indoor);

% Median
median_totalTimes_EGO_Indoor = median(totalTimes_EGO_Indoor);

% Standard deviation
std_totalTimes_EGO_Indoor = std(totalTimes_EGO_Indoor);

% Variance
var_totalTimes_EGO_Indoor = var(totalTimes_EGO_Indoor);

% Distribution
intervals = 10;
boundaries_totalTimes_Indoor = linspace(0, 10, intervals+1);
distribution_totalTimes_EGO_Indoor = histcounts((totalTimes_EGO_Indoor ./ 60), boundaries_totalTimes_Indoor);

% Distribution plot
figure;
histogram((totalTimes_EGO_Indoor ./ 60), boundaries_totalTimes_Indoor)
title("EGO indoor total times distribution [0, 10]")
xlabel("Minutes")
ylabel("Participants")
ylim([0, 10])

clear boundaries_totalTimes_Indoor;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone position data
position_part1 = part1indoorego(:, 2:4);
position_part1 = round(cell2mat(position_part1), 2);

position_part2 = part2indoorego(:, 2:4);
position_part2 = round(cell2mat(position_part2), 2);

position_part3_1 = part3indoorego_1(:, 2:4);
position_part3_1 = round(cell2mat(position_part3_1), 2);

position_part3_2 = part3indoorego_2(:, 2:4);
position_part3_2 = round(cell2mat(position_part3_2), 2);

position_part3_3 = part3indoorego_3(:, 2:4);
position_part3_3 = round(cell2mat(position_part3_3), 2);

position_part3_4 = part3indoorego_4(:, 2:4);
position_part3_4 = round(cell2mat(position_part3_4), 2);

position_part4 = part4indoorego(:, 2:4);
position_part4 = round(cell2mat(position_part4), 2);

position_part5_1 = part5indoorego_1(:, 2:4);
position_part5_1 = round(cell2mat(position_part5_1), 2);

position_part5_2 = part5indoorego_2(:, 2:4);
position_part5_2 = round(cell2mat(position_part5_2), 2);

position_part5_3 = part5indoorego_3(:, 2:4);
position_part5_3 = round(cell2mat(position_part5_3), 2);

position_part6_1 = part6indoorego_1(:, 2:4);
position_part6_1 = round(cell2mat(position_part6_1), 2);

position_part6_2 = part6indoorego_2(:, 2:4);
position_part6_2 = round(cell2mat(position_part6_2), 2);

position_part7 = part7indoorego(:, 2:4);
position_part7 = round(cell2mat(position_part7), 2);

position_part8 = part8indoorego(:, 2:4);
position_part8 = round(cell2mat(position_part8), 2);

position_part9 = part9indoorego(:, 2:4);
position_part9 = round(cell2mat(position_part9), 2);

position_part10 = part10indoorego(:, 2:4);
position_part10 = round(cell2mat(position_part10), 2);

% Plot the motion of the drone
% Position of the targets
targetsPos_X = [-1.03, 5.26, -5.95, 4.22, -1.9];
targetsPos_Y = [18.71, 12.07, 14.8, 18.38, 9.6];
targetsPos_Z = [2.85, 0.3, 0.3, 0.3, 0.3];

initPos_size = 250;
target_size = 150;
pos_size = 80;
font_size = 10;

fh = figure;
fh.Position = [0, 50, 900, 600];
loops = size(position_part7, 1);
view3D(loops) = struct('cdata',[],'colormap',[]);
for i=2:loops
    
    scatter3(position_part7(1, 1), position_part7(1, 2), position_part7(1, 3), initPos_size, "r", "filled", "v");
    
    view(-35, 20);
    axis([-9, 9, -1, 20, 0, 5])
    xlabel("x [m]")
    ylabel("y [m]")
    zlabel("z [m]")
    hold on;
    
    % Change the target color and show the position of the drone when a
    % target is identified
    if i < 44
        scatter3(targetsPos_X, targetsPos_Y, targetsPos_Z, target_size, "k", "filled", "s");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    elseif i < 100
        scatter3([targetsPos_X(1:2), targetsPos_X(4:end)], [targetsPos_Y(1:2), targetsPos_Y(4:end)], [targetsPos_Z(1:2), targetsPos_Z(4:end)], target_size, "k", "filled", "s");
        scatter3(targetsPos_X(3), targetsPos_Y(3), targetsPos_Z(3), target_size, "g", "filled", "s");
        
        scatter3(position_part7(44, 1), position_part7(44, 2), position_part7(44, 3), pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    elseif i < 154
        scatter3([targetsPos_X(1:2), targetsPos_X(end)], [targetsPos_Y(1:2), targetsPos_Y(end)], [targetsPos_Z(1:2), targetsPos_Z(end)], target_size, "k", "filled", "s");
        scatter3(targetsPos_X(3:4), targetsPos_Y(3:4), targetsPos_Z(3:4), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2)];
        id_pos_Z = [position_part7(44, 3), position_part7(100, 3)];
        
        scatter3(id_pos_X, id_pos_Y, id_pos_Z, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    elseif i < 182
        scatter3([targetsPos_X(1), targetsPos_X(end)], [targetsPos_Y(1), targetsPos_Y(end)], [targetsPos_Z(1), targetsPos_Z(end)], target_size, "k", "filled", "s");
        scatter3(targetsPos_X(2:4), targetsPos_Y(2:4), targetsPos_Z(2:4), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2)];
        id_pos_Z = [position_part7(44, 3), position_part7(100, 3), position_part7(154, 3)];
        
        scatter3(id_pos_X, id_pos_Y, id_pos_Z, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    elseif i < 313
        scatter3(targetsPos_X(1), targetsPos_Y(1), targetsPos_Z(1), target_size, "k", "filled", "s");
        scatter3(targetsPos_X(2:end), targetsPos_Y(2:end), targetsPos_Z(2:end), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1), position_part7(182, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2), position_part7(182, 2)];
        id_pos_Z = [position_part7(44, 3), position_part7(100, 3), position_part7(154, 3), position_part7(182, 3)];
        
        scatter3(id_pos_X, id_pos_Y, id_pos_Z, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    else
        scatter3(targetsPos_X, targetsPos_Y, targetsPos_Z, target_size, "k", "filled", "s");
        scatter3(targetsPos_X, targetsPos_Y, targetsPos_Z, target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1), position_part7(182, 1), position_part7(313, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2), position_part7(182, 2), position_part7(313, 2)];
        id_pos_Z = [position_part7(44, 3), position_part7(100, 3), position_part7(154, 3), position_part7(182, 3), position_part7(313, 3)];
        
        scatter3(id_pos_X, id_pos_Y, id_pos_Z, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter3(position_part7(i, 1), position_part7(i, 2), position_part7(i, 3), pos_size, "b", "filled");
        plot3([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], [position_part7(1:i-1, 3), position_part7(2:i, 3)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "northeast", "FontSize", font_size)
    end
    
    drawnow
    view3D(i-1) = getframe;
    hold off;
    
end

% movie(view3D, 1, 8);

fh = figure;
fh.Position = [0, 50, 900, 600];
loops = size(position_part7, 1);
view2D(loops) = struct('cdata',[],'colormap',[]);
for i=2:loops
    
    scatter(position_part7(1, 1), position_part7(1, 2), initPos_size, "r", "filled", "v");
    axis([-9, 9, -1, 20])
    xlabel("x [m]")
    ylabel("y [m]")
    hold on;
    
    % Change the target color and show the position of the drone when a
    % target is identified
    if i < 44
        scatter(targetsPos_X, targetsPos_Y, target_size, "k", "filled", "s");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    elseif i < 100
        scatter([targetsPos_X(1:2), targetsPos_X(4:end)], [targetsPos_Y(1:2), targetsPos_Y(4:end)], target_size, "k", "filled", "s");
        scatter(targetsPos_X(3), targetsPos_Y(3), target_size, "g", "filled", "s");
        
        scatter(position_part7(44, 1), position_part7(44, 2), pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    elseif i < 154
        scatter([targetsPos_X(1:2), targetsPos_X(end)], [targetsPos_Y(1:2), targetsPos_Y(end)], target_size, "k", "filled", "s");
        scatter(targetsPos_X(3:4), targetsPos_Y(3:4), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2)];
        
        scatter(id_pos_X, id_pos_Y, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    elseif i < 182
        scatter([targetsPos_X(1), targetsPos_X(end)], [targetsPos_Y(1), targetsPos_Y(end)], target_size, "k", "filled", "s");
        scatter(targetsPos_X(2:4), targetsPos_Y(2:4), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2)];
        
        scatter(id_pos_X, id_pos_Y, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    elseif i < 313
        scatter(targetsPos_X(1), targetsPos_Y(1), target_size, "k", "filled", "s");
        scatter(targetsPos_X(2:end), targetsPos_Y(2:end), target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1), position_part7(182, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2), position_part7(182, 2)];
        
        scatter(id_pos_X, id_pos_Y, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    else
        scatter(targetsPos_X, targetsPos_Y, target_size, "k", "filled", "s");
        scatter(targetsPos_X, targetsPos_Y, target_size, "g", "filled", "s");
        
        id_pos_X = [position_part7(44, 1), position_part7(100, 1), position_part7(154, 1), position_part7(182, 1), position_part7(313, 1)];
        id_pos_Y = [position_part7(44, 2), position_part7(100, 2), position_part7(154, 2), position_part7(182, 2), position_part7(313, 2)];
        
        scatter(id_pos_X, id_pos_Y, pos_size, [0.8500 0.3250 0.0980], "filled");
        
        scatter(position_part7(i, 1), position_part7(i, 2), pos_size, "b", "filled");
        plot([position_part7(1:i-1, 1), position_part7(2:i, 1)], [position_part7(1:i-1, 2), position_part7(2:i, 2)], "c");
        
%         legend("Starting position", "Unidentified targets", "Identified targets", "Drone position when a target is identified", "Drone position", "Trajectory", "Location", "southeast", "FontSize", font_size)
    end
    
    drawnow
    view2D(i-1) = getframe;
    hold off;
    
end

% movie(view2D, 1, 8);

clear loops fh i;
clear id_pos_X id_pos_Y id_pos_Z targetsPos_X targetsPos_Y targetsPos_Z;
clear font_size initPos_size pos_size target_size;
clear position_part1 position_part2 position_part3_1 position_part3_2;
clear position_part3_3 position_part3_4 position_part4 position_part5_1;
clear position_part5_2 position_part5_3 position_part6_1 position_part6_2;
clear position_part7 position_part8 position_part9 position_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze drone attitude data
% attitude_part1 = part1indoorego(:, 5:7);
% attitude_part1 = round(cell2mat(attitude_part1), 2);
% 
% attitude_part2 = part2indoorego(:, 5:7);
% attitude_part2 = round(cell2mat(attitude_part2), 2);
% 
% attitude_part3_1 = part3indoorego_1(:, 5:7);
% attitude_part3_1 = round(cell2mat(attitude_part3_1), 2);
% 
% attitude_part3_2 = part3indoorego_2(:, 5:7);
% attitude_part3_2 = round(cell2mat(attitude_part3_2), 2);
% 
% attitude_part3_3 = part3indoorego_3(:, 5:7);
% attitude_part3_3 = round(cell2mat(attitude_part3_3), 2);
% 
% attitude_part3_4 = part3indoorego_4(:, 5:7);
% attitude_part3_4 = round(cell2mat(attitude_part3_4), 2);
% 
% attitude_part4 = part4indoorego(:, 5:7);
% attitude_part4 = round(cell2mat(attitude_part4), 2);
% 
% attitude_part5_1 = part5indoorego_1(:, 5:7);
% attitude_part5_1 = round(cell2mat(attitude_part5_1), 2);
% 
% attitude_part5_2 = part5indoorego_2(:, 5:7);
% attitude_part5_2 = round(cell2mat(attitude_part5_2), 2);
% 
% attitude_part5_3 = part5indoorego_3(:, 5:7);
% attitude_part5_3 = round(cell2mat(attitude_part5_3), 2);
% 
% attitude_part6_1 = part6indoorego_1(:, 5:7);
% attitude_part6_1 = round(cell2mat(attitude_part6_1), 2);
% 
% attitude_part6_2 = part6indoorego_2(:, 5:7);
% attitude_part6_2 = round(cell2mat(attitude_part6_2), 2);
% 
% attitude_part7 = part7indoorego(:, 5:7);
% attitude_part7 = round(cell2mat(attitude_part7), 2);
% 
% attitude_part8 = part8indoorego(:, 5:7);
% attitude_part8 = round(cell2mat(attitude_part8), 2);
% 
% attitude_part9 = part9indoorego(:, 5:7);
% attitude_part9 = round(cell2mat(attitude_part9), 2);
% 
% attitude_part10 = part10indoorego(:, 5:7);
% attitude_part10 = round(cell2mat(attitude_part10), 2);

% clear attitude_part1 attitude_part2 attitude_part3_1 attitude_part3_2;
% clear attitude_part3_3 attitude_part3_4 attitude_part4 attitude_part5_1;
% clear attitude_part5_2 attitude_part5_3 attitude_part6_1 attitude_part6_2;
% clear attitude_part7 attitude_part8 attitude_part9 attitude_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze linear velocities data
linVel_part1 = part1indoorego(:, 8:10);
linVel_part1 = round(cell2mat(linVel_part1), 2);

linVel_part2 = part2indoorego(:, 8:10);
linVel_part2 = round(cell2mat(linVel_part2), 2);

linVel_part3_1 = part3indoorego_1(:, 8:10);
linVel_part3_1 = round(cell2mat(linVel_part3_1), 2);

linVel_part3_2 = part3indoorego_2(:, 8:10);
linVel_part3_2 = round(cell2mat(linVel_part3_2), 2);

linVel_part3_3 = part3indoorego_3(:, 8:10);
linVel_part3_3 = round(cell2mat(linVel_part3_3), 2);

linVel_part3_4 = part3indoorego_4(:, 8:10);
linVel_part3_4 = round(cell2mat(linVel_part3_4), 2);

linVel_part4 = part4indoorego(:, 8:10);
linVel_part4 = round(cell2mat(linVel_part4), 2);

linVel_part5_1 = part5indoorego_1(:, 8:10);
linVel_part5_1 = round(cell2mat(linVel_part5_1), 2);

linVel_part5_2 = part5indoorego_2(:, 8:10);
linVel_part5_2 = round(cell2mat(linVel_part5_2), 2);

linVel_part5_3 = part5indoorego_3(:, 8:10);
linVel_part5_3 = round(cell2mat(linVel_part5_3), 2);

linVel_part6_1 = part6indoorego_1(:, 8:10);
linVel_part6_1 = round(cell2mat(linVel_part6_1), 2);

linVel_part6_2 = part6indoorego_2(:, 8:10);
linVel_part6_2 = round(cell2mat(linVel_part6_2), 2);

linVel_part7 = part7indoorego(:, 8:10);
linVel_part7 = round(cell2mat(linVel_part7), 2);

linVel_part8 = part8indoorego(:, 8:10);
linVel_part8 = round(cell2mat(linVel_part8), 2);

linVel_part9 = part9indoorego(:, 8:10);
linVel_part9 = round(cell2mat(linVel_part9), 2);

linVel_part10 = part10indoorego(:, 8:10);
linVel_part10 = round(cell2mat(linVel_part10), 2);

% Plot linear velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, linVel_part9(:, 1));
xlabel("Seconds")
ylabel("m/s")
title("EGO indoor participant 9 linear velocity in x")
subplot(3, 1, 2);
plot(t, linVel_part9(:, 2));
xlabel("Seconds")
ylabel("m/s")
title("EGO indoor participant 9 linear velocity in y")
subplot(3, 1, 3);
plot(t, linVel_part9(:, 3));
xlabel("Seconds")
ylabel("m/s")
title("EGO indoor participant 9 linear velocity in z")

clear linVel_part1 linVel_part2 linVel_part3_1 linVel_part3_2;
clear linVel_part3_3 linVel_part3_4 linVel_part4 linVel_part5_1;
clear linVel_part5_2 linVel_part5_3 linVel_part6_1 linVel_part6_2;
clear linVel_part7 linVel_part8 linVel_part9 linVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze angular velocities data
angVel_part1 = part1indoorego(:, 11:13);
angVel_part1 = round(cell2mat(angVel_part1), 2);

angVel_part2 = part2indoorego(:, 11:13);
angVel_part2 = round(cell2mat(angVel_part2), 2);

angVel_part3_1 = part3indoorego_1(:, 11:13);
angVel_part3_1 = round(cell2mat(angVel_part3_1), 2);

angVel_part3_2 = part3indoorego_2(:, 11:13);
angVel_part3_2 = round(cell2mat(angVel_part3_2), 2);

angVel_part3_3 = part3indoorego_3(:, 11:13);
angVel_part3_3 = round(cell2mat(angVel_part3_3), 2);

angVel_part3_4 = part3indoorego_4(:, 11:13);
angVel_part3_4 = round(cell2mat(angVel_part3_4), 2);

angVel_part4 = part4indoorego(:, 11:13);
angVel_part4 = round(cell2mat(angVel_part4), 2);

angVel_part5_1 = part5indoorego_1(:, 11:13);
angVel_part5_1 = round(cell2mat(angVel_part5_1), 2);

angVel_part5_2 = part5indoorego_2(:, 11:13);
angVel_part5_2 = round(cell2mat(angVel_part5_2), 2);

angVel_part5_3 = part5indoorego_3(:, 11:13);
angVel_part5_3 = round(cell2mat(angVel_part5_3), 2);

angVel_part6_1 = part6indoorego_1(:, 11:13);
angVel_part6_1 = round(cell2mat(angVel_part6_1), 2);

angVel_part6_2 = part6indoorego_2(:, 11:13);
angVel_part6_2 = round(cell2mat(angVel_part6_2), 2);

angVel_part7 = part7indoorego(:, 11:13);
angVel_part7 = round(cell2mat(angVel_part7), 2);

angVel_part8 = part8indoorego(:, 11:13);
angVel_part8 = round(cell2mat(angVel_part8), 2);

angVel_part9 = part9indoorego(:, 11:13);
angVel_part9 = round(cell2mat(angVel_part9), 2);

angVel_part10 = part10indoorego(:, 11:13);
angVel_part10 = round(cell2mat(angVel_part10), 2);

% Plot angular velocities
figure;
t = timestamps_part9 - timestamps_part9(1);

subplot(3, 1, 1);
plot(t, angVel_part9(:, 1));
xlabel("Seconds")
ylabel("deg/s")
title("EGO indoor participant 9 angular velocity in roll")
subplot(3, 1, 2);
plot(t, angVel_part9(:, 2));
xlabel("Seconds")
ylabel("deg/s")
title("EGO indoor participant 9 angular velocity in pitch")
subplot(3, 1, 3);
plot(t, angVel_part9(:, 3));
xlabel("Seconds")
ylabel("deg/s")
title("EGO indoor participant 9 angular velocity in yaw")

clear t;
clear angVel_part1 angVel_part2 angVel_part3_1 angVel_part3_2;
clear angVel_part3_3 angVel_part3_4 angVel_part4 angVel_part5_1;
clear angVel_part5_2 angVel_part5_3 angVel_part6_1 angVel_part6_2;
clear angVel_part7 angVel_part8 angVel_part9 angVel_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle distance data
obsDist_part1 = part1indoorego(:, 14);
obsDist_part1 = round(cell2mat(obsDist_part1), 2);

obsDist_part2 = part2indoorego(:, 14);
obsDist_part2 = round(cell2mat(obsDist_part2), 2);

obsDist_part3_1 = part3indoorego_1(:, 14);
obsDist_part3_1 = round(cell2mat(obsDist_part3_1), 2);

obsDist_part3_2 = part3indoorego_2(:, 14);
obsDist_part3_2 = round(cell2mat(obsDist_part3_2), 2);

obsDist_part3_3 = part3indoorego_3(:, 14);
obsDist_part3_3 = round(cell2mat(obsDist_part3_3), 2);

obsDist_part3_4 = part3indoorego_4(:, 14);
obsDist_part3_4 = round(cell2mat(obsDist_part3_4), 2);

obsDist_part4 = part4indoorego(:, 14);
obsDist_part4 = round(cell2mat(obsDist_part4), 2);

obsDist_part5_1 = part5indoorego_1(:, 14);
obsDist_part5_1 = round(cell2mat(obsDist_part5_1), 2);

obsDist_part5_2 = part5indoorego_2(:, 14);
obsDist_part5_2 = round(cell2mat(obsDist_part5_2), 2);

obsDist_part5_3 = part5indoorego_3(:, 14);
obsDist_part5_3 = round(cell2mat(obsDist_part5_3), 2);

obsDist_part6_1 = part6indoorego_1(:, 14);
obsDist_part6_1 = round(cell2mat(obsDist_part6_1), 2);

obsDist_part6_2 = part6indoorego_2(:, 14);
obsDist_part6_2 = round(cell2mat(obsDist_part6_2), 2);

obsDist_part7 = part7indoorego(:, 14);
obsDist_part7 = round(cell2mat(obsDist_part7), 2);

obsDist_part8 = part8indoorego(:, 14);
obsDist_part8 = round(cell2mat(obsDist_part8), 2);

obsDist_part9 = part9indoorego(:, 14);
obsDist_part9 = round(cell2mat(obsDist_part9), 2);

obsDist_part10 = part10indoorego(:, 14);
obsDist_part10 = round(cell2mat(obsDist_part10), 2);

obsDist_EGO_Indoor = [obsDist_part1; obsDist_part2; obsDist_part3_1; obsDist_part3_2; obsDist_part3_3; obsDist_part3_4; obsDist_part4; obsDist_part5_1; obsDist_part5_2; obsDist_part5_3; obsDist_part6_1; obsDist_part6_2; obsDist_part7; obsDist_part8; obsDist_part9; obsDist_part10];
obsDist_EGO_Indoor(obsDist_EGO_Indoor == Inf) = [];

% Descriptive statistics
% Mean
mean_obsDist_EGO_Indoor = mean(obsDist_EGO_Indoor);

% Median
median_obsDist_EGO_Indoor = median(obsDist_EGO_Indoor);

% Standard deviation
std_obsDist_EGO_Indoor = std(obsDist_EGO_Indoor);

% Variance
var_obsDist_EGO_Indoor = var(obsDist_EGO_Indoor);

% Distribution
intervals = 60;
boundaries_obsDist_Indoor = linspace(0, 30, intervals+1);
distribution_obsDist_EGO_Indoor = histcounts(obsDist_EGO_Indoor, boundaries_obsDist_Indoor);

% Distribution plot
figure;
histogram(obsDist_EGO_Indoor, boundaries_obsDist_Indoor)
title("EGO indoor obstacle distance distribution [0, 30]")
xlabel("Meters")
ylabel("Number of readings")

clear intervals obsDist_EGO_Indoor boundaries_obsDist_Indoor;
clear obsDist_part1 obsDist_part2 obsDist_part3_1 obsDist_part3_2;
clear obsDist_part3_3 obsDist_part3_4 obsDist_part4 obsDist_part5_1;
clear obsDist_part5_2 obsDist_part5_3 obsDist_part6_1 obsDist_part6_2;
clear obsDist_part7 obsDist_part8 obsDist_part9 obsDist_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze obstacle position data
obsPos_part1 = part1indoorego(:, 15);
obsPos_part1 = string(obsPos_part1);

obsPos_part2 = part2indoorego(:, 15);
obsPos_part2 = string(obsPos_part2);

obsPos_part3_1 = part3indoorego_1(:, 15);
obsPos_part3_1 = string(obsPos_part3_1);

obsPos_part3_2 = part3indoorego_2(:, 15);
obsPos_part3_2 = string(obsPos_part3_2);

obsPos_part3_3 = part3indoorego_3(:, 15);
obsPos_part3_3 = string(obsPos_part3_3);

obsPos_part3_4 = part3indoorego_4(:, 15);
obsPos_part3_4 = string(obsPos_part3_4);

obsPos_part4 = part4indoorego(:, 15);
obsPos_part4 = string(obsPos_part4);

obsPos_part5_1 = part5indoorego_1(:, 15);
obsPos_part5_1 = string(obsPos_part5_1);

obsPos_part5_2 = part5indoorego_2(:, 15);
obsPos_part5_2 = string(obsPos_part5_2);

obsPos_part5_3 = part5indoorego_3(:, 15);
obsPos_part5_3 = string(obsPos_part5_3);

obsPos_part6_1 = part6indoorego_1(:, 15);
obsPos_part6_1 = string(obsPos_part6_1);

obsPos_part6_2 = part6indoorego_2(:, 15);
obsPos_part6_2 = string(obsPos_part6_2);

obsPos_part7 = part7indoorego(:, 15);
obsPos_part7 = string(obsPos_part7);

obsPos_part8 = part8indoorego(:, 15);
obsPos_part8 = string(obsPos_part8);

obsPos_part9 = part9indoorego(:, 15);
obsPos_part9 = string(obsPos_part9);

obsPos_part10 = part10indoorego(:, 15);
obsPos_part10 = string(obsPos_part10);

obsPos_EGO_Indoor = [obsPos_part1; obsPos_part2; obsPos_part3_1; obsPos_part3_2; obsPos_part3_3; obsPos_part3_4; obsPos_part4; obsPos_part5_1; obsPos_part5_2; obsPos_part5_3; obsPos_part6_1; obsPos_part6_2; obsPos_part7; obsPos_part8; obsPos_part9; obsPos_part10];
valueset = {'left', 'front-left', 'front', 'front-right', 'right', 'none'};
obsPos_EGO_Indoor = categorical(obsPos_EGO_Indoor, valueset, "Ordinal", true);

% Descriptive statistics
% Mode
mode_obsPos_EGO_Indoor = mode(obsPos_EGO_Indoor);

% Median
median_obsPos_EGO_Indoor = median(obsPos_EGO_Indoor);

% Distribution
distribution_obsPos_EGO_Indoor = histcounts(obsPos_EGO_Indoor);

% Distribution plot
figure;
histogram(obsPos_EGO_Indoor)
title("EGO indoor obstacle position distribution")
ylabel("Number of readings")

clear obsPos_EGO_Indoor;
clear obsPos_part1 obsPos_part2 obsPos_part3_1 obsPos_part3_2;
clear obsPos_part3_3 obsPos_part3_4 obsPos_part4 obsPos_part5_1;
clear obsPos_part5_2 obsPos_part5_3 obsPos_part6_1 obsPos_part6_2;
clear obsPos_part7 obsPos_part8 obsPos_part9 obsPos_part10;

%--------------------------------------------------------------------------
%% Retrieve and analyze identified targets data
%#ok<*ST2NM>
identTarg_part1 = part1indoorego(:, 16);
identTarg_part1 = str2num(identTarg_part1{end});

identTarg_part2 = part2indoorego(:, 16);
identTarg_part2 = str2num(identTarg_part2{end});

identTarg_part3_1 = part3indoorego_1(:, 16);
identTarg_part3_1 = str2num(identTarg_part3_1{end});

identTarg_part3_2 = part3indoorego_2(:, 16);
identTarg_part3_2 = str2num(identTarg_part3_2{end});

identTarg_part3_3 = part3indoorego_3(:, 16);
identTarg_part3_3 = str2num(identTarg_part3_3{end});

identTarg_part3_4 = part3indoorego_4(:, 16);
identTarg_part3_4 = str2num(identTarg_part3_4{end});

identTarg_part3 = unique([identTarg_part3_1, identTarg_part3_2, identTarg_part3_3, identTarg_part3_4]);

identTarg_part4 = part4indoorego(:, 16);
identTarg_part4 = str2num(identTarg_part4{end});

identTarg_part5_1 = part5indoorego_1(:, 16);
identTarg_part5_1 = str2num(identTarg_part5_1{end});

identTarg_part5_2 = part5indoorego_2(:, 16);
identTarg_part5_2 = str2num(identTarg_part5_2{end});

identTarg_part5_3 = part5indoorego_3(:, 16);
identTarg_part5_3 = str2num(identTarg_part5_3{end});

identTarg_part5 = unique([identTarg_part5_1, identTarg_part5_2, identTarg_part5_3]);

identTarg_part6_1 = part6indoorego_1(:, 16);
identTarg_part6_1 = str2num(identTarg_part6_1{end});

identTarg_part6_2 = part6indoorego_2(:, 16);
identTarg_part6_2 = str2num(identTarg_part6_2{end});

identTarg_part6 = unique([identTarg_part6_1, identTarg_part6_2]);

identTarg_part7 = part7indoorego(:, 16);
identTarg_part7 = str2num(identTarg_part7{end});

identTarg_part8 = part8indoorego(:, 16);
identTarg_part8 = str2num(identTarg_part8{end});

identTarg_part9 = part9indoorego(:, 16);
identTarg_part9 = str2num(identTarg_part9{end});

identTarg_part10 = part10indoorego(:, 16);
identTarg_part10 = str2num(identTarg_part10{end});

numTarg_EGO_Indoor = [size(identTarg_part1, 2); size(identTarg_part2, 2); size(identTarg_part3, 2); size(identTarg_part4, 2); size(identTarg_part5, 2); size(identTarg_part6, 2); size(identTarg_part7, 2); size(identTarg_part8, 2); size(identTarg_part9, 2); size(identTarg_part10, 2)];

% Descriptive statistics
% Mean
mean_numTarg_EGO_Indoor = mean(numTarg_EGO_Indoor);

% Median
median_numTarg_EGO_Indoor = median(numTarg_EGO_Indoor);

% Standard deviation
std_numTarg_EGO_Indoor = std(numTarg_EGO_Indoor);

% Variance
var_numTarg_EGO_Indoor = var(numTarg_EGO_Indoor);

% Distribution
valueset = {'0', '1', '2', '3', '4', '5'};
numTarg_EGO_Indoor = categorical(string(numTarg_EGO_Indoor), valueset, "Ordinal", true);
distribution_numTarg_EGO_Indoor = histcounts(numTarg_EGO_Indoor);

% Distribution plot
figure;
histogram(numTarg_EGO_Indoor)
title("EGO indoor number of identified markers distribution")
ylabel("Participants")
ylim([0, 10])

clear intervals valueset numTarg_EGO_Indoor;
clear identTarg_part1 identTarg_part2 identTarg_part3 identTarg_part3_1;
clear identTarg_part3_2 identTarg_part3_3 identTarg_part3_4;
clear identTarg_part4 identTarg_part5 identTarg_part5_1 identTarg_part5_2;
clear identTarg_part5_3 identTarg_part6 identTarg_part6_1;
clear identTarg_part6_2 identTarg_part7 identTarg_part8 identTarg_part9;
clear identTarg_part10;

%--------------------------------------------------------------------------
clear timestamps_part1 timestamps_part2 timestamps_part3_1;
clear timestamps_part3_2 timestamps_part3_3 timestamps_part3_4;
clear timestamps_part4 timestamps_part5_1 timestamps_part5_2;
clear timestamps_part5_3 timestamps_part6_1 timestamps_part6_2;
clear timestamps_part7 timestamps_part8 timestamps_part9 timestamps_part10;

clear part1indoorego part2indoorego part3indoorego_1 part3indoorego_2;
clear part3indoorego_3 part3indoorego_4 part4indoorego part5indoorego_1;
clear part5indoorego_2 part5indoorego_3 part6indoorego_1 part6indoorego_2;
clear part7indoorego part8indoorego part9indoorego part10indoorego;
%--------------------------------------------------------------------------