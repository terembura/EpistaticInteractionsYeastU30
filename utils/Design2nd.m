function [I, J, diagn] = Design2nd(X)
%
% Design the second order matrix 
%
n = size(X,1);
p = size(X,2);

nzall    = 0;
colcount = 0;
%paired_vec={'AT','TA','CG','GC'};
for i = 1:p
    for j = i+1:p
        K     = find(X(:,i).*X(:,j));
        
        nzcount = length(K);


        if nzcount
            colcount = colcount + 1;

            diagn(1, colcount) = i;
            diagn(2, colcount) = j;
            
            
            I(nzall+1:nzall + nzcount) = K(:);  
            J(nzall+1:nzall + nzcount) = colcount;         
            
            nzall = nzall + nzcount;
        end
    end
end
