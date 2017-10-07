function H = entropy(prob)
    if nargin<1             %checks number of arguments
       error('Need more arguments')
    end
    N=sum(sum(prob));		
    if ((N>0) && (min(prob(:))>=0))
       S=nonzeros(prob);            %finds non zero elements
       H=log2(N)-sum(S.*log2(S))/N; %equates entropy
    else
       H=0;
    end
return
    