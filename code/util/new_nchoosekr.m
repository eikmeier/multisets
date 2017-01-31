
function y = new_nchoosekr(v,n)
%v is a row vector of elements
%n is a number
%NEW_NCHOOSEKR returns all permuations of length n with replacement
% example: if v = [1,2,3,3], n = 2, 
% y = 
%1 1
%1 2
%1 3
%2 2
%2 3
%3 3

    m = length(v);
    X = cell(1, n);
    [X{:}] = ndgrid(v);
    X = X(end : -1 : 1);
    y = cat(n+1, X{:});
    y = reshape(y, [m^n, n]);
    y=unique(sort(y,2),'rows'); 