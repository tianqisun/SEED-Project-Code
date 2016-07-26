function [ avgLength ] = avgFragLength(A)
Degree = degree(A);
avgLength = Length(A)/(sum(Degree~=2) -1);
end
