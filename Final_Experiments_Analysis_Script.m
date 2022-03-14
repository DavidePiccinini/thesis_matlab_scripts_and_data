%--------------------------------------------------------------------------
%% Script to perform the final analysis on the experiments data
clc;
close all;

load("EGO_Indoor_Analysis_Results.mat");
load("EXO_Indoor_Analysis_Results.mat");
load("EGO_Outdoor_Analysis_Results.mat");
load("EXO_Outdoor_Analysis_Results.mat");

%--------------------------------------------------------------------------
%% Normality distribution and statistical tests
% Check normality distribution
normality_EGO_Indoor_Total_Times = lillietest(totalTimes_EGO_Indoor);
normality_EXO_Indoor_Total_Times = lillietest(totalTimes_EXO_Indoor);

normality_EGO_Outdoor_Total_Times = lillietest(totalTimes_EGO_Outdoor);
normality_EXO_Outdoor_Total_Times = lillietest(totalTimes_EXO_Outdoor);

% Statistical tests (for normally distributed data I will use the paired
% one-tailed t-test and the Wilcoxon Signed-rank test, otherwise only the
% Wilcoxon Signed-rank test)
% Indoor data are normally distributed but the variances aren't comparable
% 
% [p_NonPar_Indoor, h_NonPar_Indoor] = signrank(totalTimes_EGO_Indoor, totalTimes_EXO_Indoor, 'tail', 'right');
% 
% [h_Par_Outdoor, p_Par_Outdoor] = ttest(totalTimes_EGO_Outdoor, totalTimes_EXO_Outdoor, 'tail', 'right');
% [p_NonPar_Outdoor, h_NonPar_Outdoor] = signrank(totalTimes_EGO_Outdoor, totalTimes_EXO_Outdoor, 'tail', 'right');

[p_NonPar_Indoor, h_NonPar_Indoor] = signrank(totalTimes_EGO_Indoor, totalTimes_EXO_Indoor, 'tail', 'left');

[h_Par_Outdoor, p_Par_Outdoor] = ttest(totalTimes_EGO_Outdoor, totalTimes_EXO_Outdoor, 'tail', 'left');
[p_NonPar_Outdoor, h_NonPar_Outdoor] = signrank(totalTimes_EGO_Outdoor, totalTimes_EXO_Outdoor, 'tail', 'left');

%--------------------------------------------------------------------------
%% Create figures
% Normal probability plots
figure;
subplot(2, 2, 1);
normplot(totalTimes_EGO_Indoor)
title("Normal Probability Plot, EGO indoor total times")

subplot(2, 2, 2);
normplot(totalTimes_EXO_Indoor)
title("Normal Probability Plot, EXO indoor total times")

subplot(2, 2, 3);
normplot(totalTimes_EGO_Outdoor)
title("Normal Probability Plot, EGO outdoor total times")

subplot(2, 2, 4);
normplot(totalTimes_EXO_Outdoor)
title("Normal Probability Plot, EXO outdoor total times")

% Boxplots
figure;
boxplot([totalTimes_EGO_Indoor, totalTimes_EXO_Indoor, totalTimes_EGO_Outdoor, totalTimes_EXO_Outdoor], 'Labels', {'EGO indoor', 'EXO indoor', 'EGO outdoor', 'EXO outdoor'});
title("Compare total times")
ylabel("Seconds")

% Histogram of crashes
crashes = [6, 0, 3, 1];
valueset = categorical({'EGO indoor', 'EXO indoor', 'EGO outdoor', 'EXO outdoor'});
figure;
bar(valueset, crashes, 0.5)
title("Number of unrecoverable crashes during trials")

clear crashes valueset;

%--------------------------------------------------------------------------