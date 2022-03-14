function [totalScore] = ComputeSUSScore(questionnaireData)
% Compute the total score of the System Usability Scale questionnaire.

    % Compute the total score
    normalValues = logical([1, 0, 1, 0, 1, 0, 1, 0, 1, 0]);
    invertedValues = logical([0, 1, 0, 1, 0, 1, 0, 1, 0, 1]);
    
    firstScore = sum(questionnaireData(normalValues) - 1);
    invertedScore = ones(1, 5) * 5;
    secondScore = sum(invertedScore - questionnaireData(invertedValues));
    
    totalScore = (firstScore + secondScore) * 2.5;
    
end