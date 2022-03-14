%--------------------------------------------------------------------------
%% Script to analyse questionnaire data
clc;
close all;

load("Participant_Questionnaire_Answers.mat");

%--------------------------------------------------------------------------
%% Obtain the number of people familiar with drones and simulators/3D games
numOfQuestionnaires = size(EXPLORETechnicalTrialAnswers, 1);

familiarityAnswers = EXPLORETechnicalTrialAnswers(:, 2:3);

famDrones = [0, 0]; % first position is "yes", second is "no"
famSimGames = [0, 0]; % first position is "yes", second is "no"

for i=1:numOfQuestionnaires
    
    if familiarityAnswers{i, 1} == "Yes"
        famDrones(1) = famDrones(1) + 1;
    elseif familiarityAnswers{i, 1} == "No"
        famDrones(2) = famDrones(2) + 1;
    end
    
end

for i=1:numOfQuestionnaires
    
    if familiarityAnswers{i, 2} == "Yes"
        famSimGames(1) = famSimGames(1) + 1;
    elseif familiarityAnswers{i, 2} == "No"
        famSimGames(2) = famSimGames(2) + 1;
    end
    
end

clear familiarityAnswers;

%--------------------------------------------------------------------------
%% Evaluate the final questions
finalAnswers = EXPLORETechnicalTrialAnswers(:, end-1:end);
interfacePreference = [0, 0]; % first position is "EGO", second is "EXO"
tooMuchDataEXO = [0, 0]; % first position is "yes", second is "no"

for i=1:numOfQuestionnaires
    
    if finalAnswers{i, 1} == "EGO"
        interfacePreference(1) = interfacePreference(1) + 1;
    elseif finalAnswers{i, 1} == "EXO"
        interfacePreference(2) = interfacePreference(2) + 1;
    end
    
end

for i=1:numOfQuestionnaires
    
    if finalAnswers{i, 2} == "Yes"
        tooMuchDataEXO(1) = tooMuchDataEXO(1) + 1;
    elseif finalAnswers{i, 2} == "No"
        tooMuchDataEXO(2) = tooMuchDataEXO(2) + 1;
    end
    
end

clear finalAnswers;

%--------------------------------------------------------------------------
%% Divide the questionnaire answers between EGO and EXO
answersEGO = {};
answersEXO = {};

for i=1:numOfQuestionnaires
    
    if EXPLORETechnicalTrialAnswers{i, 1} == "EGO"
        answersEGO = [answersEGO; EXPLORETechnicalTrialAnswers(i, 4:38)];
    elseif EXPLORETechnicalTrialAnswers{i, 1} == "EXO"
        answersEXO = [answersEXO; EXPLORETechnicalTrialAnswers(i, 4:38)];
    end
    
end
% Since the answers are all numerical, convert the cell array to a matrix
answersEGO = cell2mat(answersEGO);
answersEXO = cell2mat(answersEXO);

% Get how many EGO and EXO questionnaires there are (their amount is equal)
sizeEGO = size(answersEGO, 1);

% Divide the answers according to the questionnaire (SSQ, SUS, SART)
EGO_SSQ = answersEGO(:, 1:16);
EGO_SUS = answersEGO(:, 17:26);
EGO_SART = answersEGO(:, 27:end);

EXO_SSQ = answersEXO(:, 1:16);
EXO_SUS = answersEXO(:, 17:26);
EXO_SART = answersEXO(:, 27:end);

clear answersEGO answersEXO numOfQuestionnaires;

%--------------------------------------------------------------------------
%% Compute the questionnaires' scores
EGO_SSQ_Scores = zeros(sizeEGO, 4);
EGO_SUS_Scores = zeros(sizeEGO, 1);
EGO_SART_Scores = zeros(sizeEGO, 4);

EXO_SSQ_Scores = zeros(sizeEGO, 4);
EXO_SUS_Scores = zeros(sizeEGO, 1);
EXO_SART_Scores = zeros(sizeEGO, 4);

% SSQ scores
for i=1:sizeEGO

    % EGO
    [totalScore, nauseaScore, oculomotorScore, disorientationScore] = ComputeSSQScores(EGO_SSQ(i, :));
    EGO_SSQ_Scores(i, :) = [totalScore, nauseaScore, oculomotorScore, disorientationScore];
    
    % EXO
    [totalScore, nauseaScore, oculomotorScore, disorientationScore] = ComputeSSQScores(EXO_SSQ(i, :));
    EXO_SSQ_Scores(i, :) = [totalScore, nauseaScore, oculomotorScore, disorientationScore];
    
end

% SUS scores
for i=1:sizeEGO

    % EGO
    totalScore = ComputeSUSScore(EGO_SUS(i, :));
    EGO_SUS_Scores(i) = totalScore;
    
    % EXO
    totalScore = ComputeSUSScore(EXO_SUS(i, :));
    EXO_SUS_Scores(i) = totalScore;
    
end

% SART scores
for i=1:sizeEGO

    % EGO
    [totalScore, understandingScore, demandScore, supplyScore] = ComputeSARTScores(EGO_SART(i, :));
    EGO_SART_Scores(i, :) = [totalScore, understandingScore, demandScore, supplyScore];
    
    % EXO
    [totalScore, understandingScore, demandScore, supplyScore] = ComputeSARTScores(EXO_SART(i, :));
    EXO_SART_Scores(i, :) = [totalScore, understandingScore, demandScore, supplyScore];
    
end

clear sizeEGO totalScore nauseaScore oculomotorScore disorientationScore understandingScore demandScore supplyScore;

%--------------------------------------------------------------------------
%% Normality distribution and statistical tests
% Check normality distribution
% SSQ
normality_EGO_SSQ_Scores = zeros(1, 4);
normality_EXO_SSQ_Scores = zeros(1, 4);

normality_EGO_SSQ_Scores(1) = lillietest(EGO_SSQ_Scores(:, 1));
normality_EXO_SSQ_Scores(1) = lillietest(EXO_SSQ_Scores(:, 1));

normality_EGO_SSQ_Scores(2) = lillietest(EGO_SSQ_Scores(:, 2));
normality_EXO_SSQ_Scores(2) = lillietest(EXO_SSQ_Scores(:, 2));

normality_EGO_SSQ_Scores(3) = lillietest(EGO_SSQ_Scores(:, 3));
normality_EXO_SSQ_Scores(3) = lillietest(EXO_SSQ_Scores(:, 3));

normality_EGO_SSQ_Scores(end) = lillietest(EGO_SSQ_Scores(:, end));
normality_EXO_SSQ_Scores(end) = lillietest(EXO_SSQ_Scores(:, end));

% SUS
normality_EGO_SUS_Scores = lillietest(EGO_SUS_Scores);
normality_EXO_SUS_Scores = lillietest(EXO_SUS_Scores);

% SART
normality_EGO_SART_Scores = zeros(1, 4);
normality_EXO_SART_Scores = zeros(1, 4);

normality_EGO_SART_Scores(1) = lillietest(EGO_SART_Scores(:, 1));
normality_EXO_SART_Scores(1) = lillietest(EXO_SART_Scores(:, 1));

normality_EGO_SART_Scores(2) = lillietest(EGO_SART_Scores(:, 2));
normality_EXO_SART_Scores(2) = lillietest(EXO_SART_Scores(:, 2));

normality_EGO_SART_Scores(3) = lillietest(EGO_SART_Scores(:, 3));
normality_EXO_SART_Scores(3) = lillietest(EXO_SART_Scores(:, 3));

normality_EGO_SART_Scores(end) = lillietest(EGO_SART_Scores(:, end));
normality_EXO_SART_Scores(end) = lillietest(EXO_SART_Scores(:, end));

% Statistical tests (for normally distributed data I will use the paired
% one-tailed t-test and the Wilcoxon Signed-rank test, otherwise only the
% Wilcoxon Signed-rank test)
% SSQ (only the oculomotor subscale data appears to be normally
% distributed)
[p_NonPar_SSQ_Total, h_NonPar_SSQ_Total] = signrank(EGO_SSQ_Scores(:, 1), EXO_SSQ_Scores(:, 1), 'tail', 'right');
[p_NonPar_SSQ_Nausea, h_NonPar_SSQ_Nausea] = signrank(EGO_SSQ_Scores(:, 2), EXO_SSQ_Scores(:, 2), 'tail', 'right');

[p_NonPar_SSQ_Oculomotor, h_NonPar_SSQ_Oculomotor] = signrank(EGO_SSQ_Scores(:, 3), EXO_SSQ_Scores(:, 3), 'tail', 'right');
[h_Par_SSQ_Oculomotor, p_Par_SSQ_Oculomotor] = ttest(EGO_SSQ_Scores(:, 3), EXO_SSQ_Scores(:, 3), 'tail', 'right');

[p_NonPar_SSQ_Disorientation, h_NonPar_SSQ_Disorientation] = signrank(EGO_SSQ_Scores(:, end), EXO_SSQ_Scores(:, end), 'tail', 'right');

% SUS (the total score data appears to be normally distributed)
[h_Par_SUS, p_Par_SUS] = ttest(EGO_SUS_Scores, EXO_SUS_Scores, 'tail', 'left');

[p_NonPar_SUS, h_NonPar_SUS] = signrank(EGO_SUS_Scores, EXO_SUS_Scores, 'tail', 'left');

% SART (all data appear to be normally distributed)
[h_Par_SART_Total, p_Par_SART_Total] = ttest(EGO_SART_Scores(:, 1), EXO_SART_Scores(:, 1), 'tail', 'left');
[h_Par_SART_Understanding, p_Par_SART_Understanding] = ttest(EGO_SART_Scores(:, 2), EXO_SART_Scores(:, 2), 'tail', 'left');
[h_Par_SART_Demand, p_Par_SART_Demand] = ttest(EGO_SART_Scores(:, 3), EXO_SART_Scores(:, 3), 'tail', 'right');
[h_Par_SART_Supply, p_Par_SART_Supply] = ttest(EGO_SART_Scores(:, end), EXO_SART_Scores(:, end), 'tail', 'left');

[p_NonPar_SART_Total, h_NonPar_SART_Total] = signrank(EGO_SART_Scores(:, 1), EXO_SART_Scores(:, 1), 'tail', 'left');
[p_NonPar_SART_Understanding, h_NonPar_SART_Understanding] = signrank(EGO_SART_Scores(:, 2), EXO_SART_Scores(:, 2), 'tail', 'left');
[p_NonPar_SART_Demand, h_NonPar_SART_Demand] = signrank(EGO_SART_Scores(:, 3), EXO_SART_Scores(:, 3), 'tail', 'right');
[p_NonPar_SART_Supply, h_NonPar_SART_Supply] = signrank(EGO_SART_Scores(:, end), EXO_SART_Scores(:, end), 'tail', 'left');

%--------------------------------------------------------------------------
%% Descriptive statistics
% Range, defined as the maximum value obtained minus the minimum value
% obtained
rangeEGO_SSQ = max(EGO_SSQ_Scores) - min(EGO_SSQ_Scores);
rangeEGO_SUS = max(EGO_SUS_Scores) - min(EGO_SUS_Scores);
rangeEGO_SART = max(EGO_SART_Scores) - min(EGO_SART_Scores);

rangeEXO_SSQ = max(EXO_SSQ_Scores) - min(EXO_SSQ_Scores);
rangeEXO_SUS = max(EXO_SUS_Scores) - min(EXO_SUS_Scores);
rangeEXO_SART = max(EXO_SART_Scores) - min(EXO_SART_Scores);

% Mean
meanEGO_SSQ_Scores = mean(EGO_SSQ_Scores);
meanEGO_SUS_Scores = mean(EGO_SUS_Scores);
meanEGO_SART_Scores = mean(EGO_SART_Scores);

meanEXO_SSQ_Scores = mean(EXO_SSQ_Scores);
meanEXO_SUS_Scores = mean(EXO_SUS_Scores);
meanEXO_SART_Scores = mean(EXO_SART_Scores);

% Median
medianEGO_SSQ_Scores = median(EGO_SSQ_Scores);
medianEGO_SUS_Scores = median(EGO_SUS_Scores);
medianEGO_SART_Scores = median(EGO_SART_Scores);

medianEXO_SSQ_Scores = median(EXO_SSQ_Scores);
medianEXO_SUS_Scores = median(EXO_SUS_Scores);
medianEXO_SART_Scores = median(EXO_SART_Scores);

% Standard deviation
stdEGO_SSQ_Scores = std(EGO_SSQ_Scores);
stdEGO_SUS_Scores = std(EGO_SUS_Scores);
stdEGO_SART_Scores = std(EGO_SART_Scores);

stdEXO_SSQ_Scores = std(EXO_SSQ_Scores);
stdEXO_SUS_Scores = std(EXO_SUS_Scores);
stdEXO_SART_Scores = std(EXO_SART_Scores);

% Variance
varEGO_SSQ_Scores = var(EGO_SSQ_Scores);
varEGO_SUS_Scores = var(EGO_SUS_Scores);
varEGO_SART_Scores = var(EGO_SART_Scores);

varEXO_SSQ_Scores = var(EXO_SSQ_Scores);
varEXO_SUS_Scores = var(EXO_SUS_Scores);
varEXO_SART_Scores = var(EXO_SART_Scores);

% Distribution
% SSQ
% The total score belongs to [0, 235.62].
intervals = 10;
boundariesSSQ_Total = linspace(0, 235.62, intervals+1);

distributionEGO_SSQ_Total = histcounts(EGO_SSQ_Scores(:, 1), boundariesSSQ_Total);
distributionEXO_SSQ_Total = histcounts(EXO_SSQ_Scores(:, 1), boundariesSSQ_Total);

% The nausea score belongs to [0, 200.34].
boundariesSSQ_Nausea = linspace(0, 200.34, intervals+1);

distributionEGO_SSQ_Nausea = histcounts(EGO_SSQ_Scores(:, 2), boundariesSSQ_Nausea);
distributionEXO_SSQ_Nausea = histcounts(EXO_SSQ_Scores(:, 2), boundariesSSQ_Nausea);

% The oculomotor score belongs to [0, 159.18].
boundariesSSQ_Oculomotor = linspace(0, 159.18, intervals+1);

distributionEGO_SSQ_Oculomotor = histcounts(EGO_SSQ_Scores(:, 3), boundariesSSQ_Oculomotor);
distributionEXO_SSQ_Oculomotor = histcounts(EXO_SSQ_Scores(:, 3), boundariesSSQ_Oculomotor);

% The disorientation score belongs to [0, 292.32].
boundariesSSQ_Disorientation = linspace(0, 292.32, intervals+1);

distributionEGO_SSQ_Disorientation = histcounts(EGO_SSQ_Scores(:, end), boundariesSSQ_Disorientation);
distributionEXO_SSQ_Disorientation = histcounts(EXO_SSQ_Scores(:, end), boundariesSSQ_Disorientation);

% SUS
% The total score belongs to [0, 100].
boundariesSUS_Total = linspace(0, 100, intervals+1);

distributionEGO_SUS_Total = histcounts(EGO_SUS_Scores, boundariesSUS_Total);
distributionEXO_SUS_Total = histcounts(EXO_SUS_Scores, boundariesSUS_Total);

% SART
% The total score belongs to [-15, 39].
boundariesSART_Total = linspace(-15, 39, intervals+1);

distributionEGO_SART_Total = histcounts(EGO_SART_Scores(:, 1), boundariesSART_Total);
distributionEXO_SART_Total = histcounts(EXO_SART_Scores(:, 1), boundariesSART_Total);

% The understanding score belongs to [2, 14].
intervals = 6;
boundariesSART_Understanding = linspace(2, 14, intervals+1);

distributionEGO_SART_Understanding = histcounts(EGO_SART_Scores(:, 2), boundariesSART_Understanding);
distributionEXO_SART_Understanding = histcounts(EXO_SART_Scores(:, 2), boundariesSART_Understanding);

% The demand score belongs to [3, 21].
boundariesSART_Demand = linspace(3, 21, intervals+1);

distributionEGO_SART_Demand = histcounts(EGO_SART_Scores(:, 3), boundariesSART_Demand);
distributionEXO_SART_Demand = histcounts(EXO_SART_Scores(:, 3), boundariesSART_Demand);

% The supply score belongs to [4, 28].
boundariesSART_Supply = linspace(4, 28, intervals+1);

distributionEGO_SART_Supply = histcounts(EGO_SART_Scores(:, end), boundariesSART_Supply);
distributionEXO_SART_Supply = histcounts(EXO_SART_Scores(:, end), boundariesSART_Supply);

clear i j intervals;

%--------------------------------------------------------------------------
%% Create figures
% Familiarity questions and final questions distributions
yes_no_Categories = categorical({'Yes', 'No'}, "Ordinal", true);
EGO_EXO_Categories = categorical({'EGO', 'EXO'}, "Ordinal", true);

figure;
subplot(2, 1, 1);
bar(yes_no_Categories, famDrones, 0.5)
title("Are you familiar with drones?")
ylim([0, 10])

subplot(2, 1, 2);
bar(yes_no_Categories, famSimGames, 0.5)
title("Are you familiar with simulators and/or 3D games?")
ylim([0, 10])

figure;
subplot(2, 1, 1);
bar(EGO_EXO_Categories, interfacePreference, 0.5)
title("In your opinion, what was the most useful approach to complete the task?")
ylim([0, 10])

subplot(2, 1, 2);
bar(yes_no_Categories, tooMuchDataEXO, 0.5)
title({"Do you think the information provided to you"; "by the EXO interface was too much?"})
ylim([0, 10])

% Normal probability plots
% SSQ
figure;
subplot(2, 2, 1);
normplot(EGO_SSQ_Scores(:, 1))
title("Normal Probability Plot, EGO SSQ total scores")

subplot(2, 2, 2);
normplot(EGO_SSQ_Scores(:, 2))
title("Normal Probability Plot, EGO SSQ nausea scores")

subplot(2, 2, 3);
normplot(EGO_SSQ_Scores(:, 3))
title("Normal Probability Plot, EGO SSQ oculomotor scores")

subplot(2, 2, 4);
normplot(EGO_SSQ_Scores(:, end))
title("Normal Probability Plot, EGO SSQ disorientation scores")


figure;
subplot(2, 2, 1);
normplot(EXO_SSQ_Scores(:, 1))
title("Normal Probability Plot, EXO SSQ total scores")

subplot(2, 2, 2);
normplot(EXO_SSQ_Scores(:, 2))
title("Normal Probability Plot, EXO SSQ nausea scores")

subplot(2, 2, 3);
normplot(EXO_SSQ_Scores(:, 3))
title("Normal Probability Plot, EXO SSQ oculomotor scores")

subplot(2, 2, 4);
normplot(EXO_SSQ_Scores(:, end))
title("Normal Probability Plot, EXO SSQ disorientation scores")

% SUS
figure;
normplot(EGO_SUS_Scores)
title("Normal Probability Plot, EGO SUS total scores")


figure;
normplot(EXO_SUS_Scores)
title("Normal Probability Plot, EXO SUS total scores")

% SART
figure;
subplot(2, 2, 1);
normplot(EGO_SART_Scores(:, 1))
title("Normal Probability Plot, EGO SART total scores")

subplot(2, 2, 2);
normplot(EGO_SART_Scores(:, 2))
title("Normal Probability Plot, EGO SART understanding scores")

subplot(2, 2, 3);
normplot(EGO_SART_Scores(:, 3))
title("Normal Probability Plot, EGO SART demand scores")

subplot(2, 2, 4);
normplot(EGO_SART_Scores(:, end))
title("Normal Probability Plot, EGO SART supply scores")


figure;
subplot(2, 2, 1);
normplot(EXO_SART_Scores(:, 1))
title("Normal Probability Plot, EXO SART total scores")

subplot(2, 2, 2);
normplot(EXO_SART_Scores(:, 2))
title("Normal Probability Plot, EXO SART understanding scores")

subplot(2, 2, 3);
normplot(EXO_SART_Scores(:, 3))
title("Normal Probability Plot, EXO SART demand scores")

subplot(2, 2, 4);
normplot(EXO_SART_Scores(:, end))
title("Normal Probability Plot, EXO SART supply scores")

% Scores distribution
% SSQ
figure;
subplot(2, 2, 1);
histogram(EGO_SSQ_Scores(:, 1), boundariesSSQ_Total)
title("EGO SSQ total score distribution [0, 235.62]")
ylim([0, 10])

subplot(2, 2, 2);
histogram(EGO_SSQ_Scores(:, 2), boundariesSSQ_Nausea)
title("EGO SSQ nausea score distribution [0, 200.34]")
ylim([0, 10])

subplot(2, 2, 3);
histogram(EGO_SSQ_Scores(:, 3), boundariesSSQ_Oculomotor)
title("EGO SSQ oculomotor score distribution [0, 159.18]")
ylim([0, 10])

subplot(2, 2, 4);
histogram(EGO_SSQ_Scores(:, end), boundariesSSQ_Disorientation)
title("EGO SSQ disorientation score distribution [0, 292.32]")
ylim([0, 10])


figure;
subplot(2, 2, 1);
histogram(EXO_SSQ_Scores(:, 1), boundariesSSQ_Total)
title("EXO SSQ total score distribution [0, 235.62]")
ylim([0, 10])

subplot(2, 2, 2);
histogram(EXO_SSQ_Scores(:, 2), boundariesSSQ_Nausea)
title("EXO SSQ nausea score distribution [0, 200.34]")
ylim([0, 10])

subplot(2, 2, 3);
histogram(EXO_SSQ_Scores(:, 3), boundariesSSQ_Oculomotor)
title("EXO SSQ oculomotor score distribution [0, 159.18]")
ylim([0, 10])

subplot(2, 2, 4);
histogram(EXO_SSQ_Scores(:, end), boundariesSSQ_Disorientation)
title("EXO SSQ disorientation score distribution [0, 292.32]")
ylim([0, 10])

% SUS
figure;
subplot(2, 1, 1);
histogram(EGO_SUS_Scores, boundariesSUS_Total)
title("EGO SUS total score distribution [0, 100]")
ylim([0, 10])

subplot(2, 1, 2);
histogram(EXO_SUS_Scores, boundariesSUS_Total)
title("EXO SUS total score distribution [0, 100]")
ylim([0, 10])

% SART
figure;
subplot(2, 2, 1);
histogram(EGO_SART_Scores(:, 1), boundariesSART_Total)
title("EGO SART total score distribution [-15, 39]")
ylim([0, 10])

subplot(2, 2, 2);
histogram(EGO_SART_Scores(:, 2), boundariesSART_Understanding)
title("EGO SART understanding score distribution [2, 14]")
ylim([0, 10])

subplot(2, 2, 3);
histogram(EGO_SART_Scores(:, 3), boundariesSART_Demand)
title("EGO SART demand score distribution [3, 21]")
ylim([0, 10])

subplot(2, 2, 4);
histogram(EGO_SART_Scores(:, end), boundariesSART_Supply)
title("EGO SART supply score distribution [4, 28]")
ylim([0, 10])


figure;
subplot(2, 2, 1);
histogram(EXO_SART_Scores(:, 1), boundariesSART_Total)
title("EXO SART total score distribution [-15, 39]")
ylim([0, 10])

subplot(2, 2, 2);
histogram(EXO_SART_Scores(:, 2), boundariesSART_Understanding)
title("EXO SART understanding score distribution [2, 14]")
ylim([0, 10])

subplot(2, 2, 3);
histogram(EXO_SART_Scores(:, 3), boundariesSART_Demand)
title("EXO SART demand score distribution [3, 21]")
ylim([0, 10])

subplot(2, 2, 4);
histogram(EXO_SART_Scores(:, end), boundariesSART_Supply)
title("EXO SART supply score distribution [4, 28]")
ylim([0, 10])

clear yes_no_Categories EGO_EXO_Categories;

%--------------------------------------------------------------------------