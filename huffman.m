function [huffTree, N] = huffman(x)
    %x = [2 4 5 3];                              %initialize value
    n = numel(x);                               %find length of values
    N = n;
    arr = [nan(2*n-1,1) (-1)*ones(2*n-1,3)];    %initialize array
    row = nan(1,1);                             %initialize row of values used

    i = n;                      %counter for increment
    j = n;                      %counter for decrement
    k = 1;                      %counter for rows used
    arr(1:n,1) = x';            %initialize work space
    A = arr(:,1);               %seperate weight array (aka values from x)

    for ind = 1:length(arr)-n

    s = sort(A(1:j,1));       %sorts array of inputs
    j = j - 1;                  %decrease j count
    min1 = s(1); min2 = s(2);   %gets 2 min values
    [r1,~] = find(arr(:,1)==min1);  %finds position of first min
    [r2,~] = find(arr(:,1)==min2);  %finds position of second min

    roo = ismember(r1,row);             %checks for previously used nodes
    foo = ismember(r2,row);         
    check1 = find(roo==0,1,'first');    
    check2 = find(foo==0,1,'first');

    r1 = r1(check1);                %sets unused node
    r2 = r2(check2);                %set sunused node

    newParent = min1 + min2;    %obtain new parent
    i = i+1;                    %increase i count
    arr(i,1) = newParent;       %implement new parent
    arr(i,3) = r1;              %left child update
    arr(i,4) = r2;              %right child update
    arr(r1,2) = i;              %min1 parent update
    arr(r2,2) = i;              %min2 parent update

    A = arr(:,1);               %resets A with new values
    row(k) = r1; k=k+1; row(k) = r2; k=k+1; %updates row array
    A(row,:) = [];              % removes used rows
    end
    huffTree = arr;
end