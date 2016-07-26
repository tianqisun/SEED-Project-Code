function [ Max ] = highestDegreeBranch( M )
%input: SWC file
%output: returns highest Degree
[Max, ~] = max(full(getDegree(M)));
end

