%% Given a set s of numbers 1-m, including all number between 1 and 
%% m, and numbers may repeat (so its a multiset). In this code s will be 
%% a column vector
%% Given an index k, this code can determine the permutation ,p, at that index
%% The first permutation is at index 0
%% Permutations are ordered in lexicographical order


%Pick a muliset s, and an index k
s = [3;2;2;1];
k = 9;


%Check to make sure k is within the correct range
a = unique(s);
B = [a,histc(s(:),a)];
[m,n] = size(B);
rep = 1;
for j = 1:m
   rep = rep*factorial(B(j,2)); 
end
maxiterations = factorial(length(s))/rep;
if k>=maxiterations
   display('Error: the value of k you have chosen is not valid')
end


%initialize solution, p
p = zeros(length(s),1);

leftend = 0;
rightend = 0;


r = 1;
while(length(s)>0)  % we will determine the solution one elment at a time, 
                    % until all terms from s are used
rightend = leftend;
    
% make a matrix B: [(element) (number of occurences)]
a = unique(s);
B = [a,histc(s(:),a)];
[m,n] = size(B);

% construct the number 'rep' which is used to count the number of
% permutations of a multiset. (Divide by rep)
rep = 1;
for j = 1:m
   rep = rep*factorial(B(j,2)); 
end

%Determine next correct term
i = 0;
while(rightend <= k)
    leftend = rightend;
    i = i+1;
    rightend = rightend + (B(i,2)*factorial(length(s)-1))/rep;    
end

%fill in the next correct term
if i == 0
    p(r) = B(1,1);
else
  p(r) = B(i,1);
end

%remove the used term from the set s
for t = 1:length(s)
    if s(t) == p(r);
        s(t) = [];
        break
    end
end

r = r+1;
end

p

