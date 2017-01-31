%% This code takes a 'permutation' p (as a column vector) and determines its' 
%% index in lexicographical order
%%
%% Handles multisets correctly
%% Note that the first index is '0'
%% Note that this code assumes that p is a permutation involving numbers 
%% 1 - m, where every number between 1 and m is included

%define a 'permutation' p
p = [2;2;1;2;1];

% if the permutation is lenth 0 or 1, done
if (length(p) == 1 | length(p) == 0)
    index = 0;


else 

index = 0;
l = length(p);
for i = 1:l
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
    
    j = 1;
    while(j < p(1))
        index = index + (B(j,2)*factorial(length(p)-1))/rep;
        j = j+1;
    end
    
           
    if any(p(2:end) == p(1))
        %do nothing
    else                               %we must reduce the values of the permuation
        for j = 2:length(p)            %unless the first element is repeated
            if p(j) > p(1)
            p(j) = p(j)-1;
            end
        end
    end
    p(1) = [];   %do the process again after dropping the first element
end


index

       
end
