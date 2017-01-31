%% Generate a KPGM matrix 
%% The final answer Pn is a 2^n x 2^n matrix with entries of 
%% either 1 or zero
%%

addpath('/Users/nicoleeikmeier/Documents/MATLAB/multisets/code/util')
%n = the number of Kronecker products, P = initial matrix
n = 12;
P = [.99, .5;.5, .2];
P = reshape(P, 4,1);

%Initialize solution Pn, reshapeinto a 4x4x4x...x4 data set
Pn = zeros(2^n,2^n);
a = 4*ones(1,n);
Pn = reshape(Pn, a);

%M is a matrix, where each row contains a unique 'combination 
%with replacement'
b = [1;2;3;4];
M = new_nchoosekr(b,n);
[c,d] = size(M);

for i = 1:c
    w = M(i,:)';
    
    C = [unique(w),histc(w(:),unique(w))];
    [t,~] = size(C);
    numofperms = factorial(n);
    for j = 1:t
       numofperms = numofperms/factorial(C(j,2)); 
    end
    
    
    %generate the unique probability from row i
    prob = 1;
    for j = 1:d
        prob = prob*P(w(j));
    end
    
    gap = randgeo(prob)+1;
    l = gap;
    while l < numofperms
        r = RecursiveUnrankPermutation(w,l);
        Pn(r(1),r(2),r(3),r(4),r(5),r(6),r(7),r(8),r(9),r(10),r(11),r(12)) = 1;
        l = l + gap;
    end
    
end
Pn = reshape(Pn,2^n,2^n);


