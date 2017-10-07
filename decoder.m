function out = decoder(arr, def)
    len = length(def);                  % number of iter needed to decode
    out = ones(len,1);
    for newIter = 1:len
        headRow = length(arr);   % sets top most node
        input = char(def(newIter));     % selects first dictionary term
        inLen = length(input);          % gets length of dictionary term
        for ii = 1:inLen
            if str2double(input(ii)) == 0      % loops to find child
                nextRow = arr(headRow,3);
            else
                nextRow = arr(headRow,4);
            end
            headRow = nextRow;
        end
        out(newIter) = arr(headRow,1);
    end
end