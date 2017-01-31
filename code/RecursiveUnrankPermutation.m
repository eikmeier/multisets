function [p] = RecursiveUnrankPermutation(s,k)
% RECURSIVEUNRANKPERMUTATION takes in a multiset s (as a column vector) 
% and an index k (as an integer) and determines the permutation, p, at the index k
% The first permutation is at index 0
% Permutations are ordered in lexicographical order
%
% If k is out of the range of correct values for a permutation, this
% program will not catch it


if isempty(s)
    p = [];

else
    
%Create the matrix B = [element, number(element)], and counting helper
%`rep'
B = [unique(s),histc(s(:),unique(s))];
[m,~] = size(B);
rep = 1;
for j = 1:m
   rep = rep*factorial(B(j,2)); 
end


%Determine next correct term in permutation, next
i = 0;
rightend = 0;
leftend = 0;
temp = 0;
while(rightend <= k)
    i = i+1;
    leftend = leftend + temp;
    temp = (B(i,2)*factorial(length(s)-1))/rep; 
    rightend = rightend + temp; 
end
next = B(i,1);


%recurse on the set s with the used term removed
toremove = find(s == next);
s(toremove(1)) = [];

p = [next;RecursiveUnrankPermutation(s,k-leftend)];

end
end


