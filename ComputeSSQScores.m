function [totalScore, nauseaScore, oculomotorScore, disorientationScore] = ComputeSSQScores(questionnaireData)
% Compute the total score of the Simulator Sickness Questionnaire and the
% score of its sub-scales.
    
    % Subtract 1 from the data since we want it in the [0, 3] range.
    questionnaireData = questionnaireData - 1;
    
    % Compute the partial scores of the sub-scales
    nauseaValues = logical([1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1]);
    nausea = sum(questionnaireData(nauseaValues));
    nauseaScore = nausea * 9.54;
    
    oculomotorValues = logical([1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0]);
    oculomotor = sum(questionnaireData(oculomotorValues));
    oculomotorScore = oculomotor * 7.58;
    
    disorientationValues = logical([0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0]);
    disorientation = sum(questionnaireData(disorientationValues));
    disorientationScore = disorientation * 13.92;
    
    % Compute the total score
    totalScore = (nausea + oculomotor + disorientation) * 3.74;

end