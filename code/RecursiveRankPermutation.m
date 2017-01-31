function [index] = RecursiveRankPermutation(p)
% RECURSIVERANKPERMUTATION takes a permutation p (as a column vector) 
% and determines its' index in lexicographical order
%
% Handles multisets correctly
% Note that the first index is '0'


% if the permutation is lenth 0 or 1, done
if (length(p) == 1 || length(p) == 0)
    index = 0;
    
else
    countprevious = 0;
    % make a matrix B: [(element) (number of occurences)], and counting
    % helper `rep'
    B = [unique(p),histc(p(:),unique(p))];    
    [m,~] = size(B);
    rep = 1;
    for j = 1:m
        rep = rep*factorial(B(j,2)); 
    end
    
    j = 1;
    while(B(j,1) < p(1))
        countprevious = countprevious + (B(j,2)*factorial(length(p)-1))/rep;
        j = j+1;
    end
    
    %Recurse on the permutation p with the first element removed
    p(1) = [];
    index = countprevious + RecursiveRankPermutation(p);
end
    
end
    