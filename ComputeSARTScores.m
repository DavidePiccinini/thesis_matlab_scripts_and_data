function [totalScore, understandingScore, demandScore, supplyScore] = ComputeSARTScores(questionnaireData)
% Compute the total score of the Situational Awareness Rating Technique 
% questionnaire and the score of its sub-scales.

    % Compute the sub-scales scores
    demandScore = sum(questionnaireData(1:3));
    
    supplyScore = sum(questionnaireData(4:7));
    
    understandingScore = sum(questionnaireData(8:end));
    
    % Compute the total score
    totalScore = understandingScore - (demandScore - supplyScore);
    
end