function [ C ] = mergestruct( A, B )
%MERGESTRUCT merge two struct arrays, keep fields with same name in B

if length(A) ~= length(B)
    error('Length of struct arrays are not the same')
end

arr = arrayfun(@(x)mergesinglestruct(A(x),B(x)), 1:length(A), 'UniformOutput', false);
C = [arr{:}];

function C = mergesinglestruct(A, B)
    C = A;
    for f = fieldnames(B)'
        C.(f{1}) = B.(f{1});
    end
end
end

