%% RandomPermutation is used to generate a Random Permutation of a multiset.
%% We start with an arbitrary permutation, then 
%% exchanges the ith element with a radomly selected element from the first
%% i elements

%Start with a random permutation

B =[1,2; 2,2; 3,1 ]; %decide the cardinality of each number
S = sum(B,1);
s = S(2);
p = zeros(s,1); %initialize arbitrary permutation
for i = 1:s %construct an arbitray permutation
    [m,n] = size(B);
    x = randi(m);
    p(i) = B(x,1);
    if B(x,2) == 1;
        B(x,:) = [];
    else
        B(x,2) = B(x,2)-1;
    end
end
p
    

%For each term, randomly switch it with a previous term
for i = 1:length(p)
    x = randi(i);
    t = p(i);
    p(i) = p(x);
    p(x) = t;
end
p
    
    
