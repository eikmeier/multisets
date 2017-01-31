function [tot] = countprevious(p)
%% COUNTPREVIOUS takes in a column vector p, ( a 'permutation' )
%% Returns tot, a number, the minimum number of permutations that 
%% must have come before based solely on the first element, assuming 
%% the ordering is lexicographic
%%
%% This fuction handles multisets correctly
%% 
%% ex: p = [3;2;2;1] returns 9
%% The idea is this: for p above, count how many permutations started with 1
%% and 2. Then p is has at least that index

% make a matrix B: [(element) (number of occurences)]
a = unique(p);
B = [a,histc(p(:),a)]; 

% construct the number 'rep' which is used to count the number of
% permutations of a multiset. (Divide by rep)
[m,~] = size(B);
rep = 1;
for j = 1:m
    rep = rep*factorial(B(j,2)); 
end


%count how many permutations must have come before
i = 1;
tot = 0;
while(i<p(1))
    tot = tot + (B(i,2)*factorial(length(p)-1))/rep; 
    i = i+1;
end
end
    
    