function out = dictionary(arr, n)
    def = {'empty'};            %set dictionary
    for r = 1:n
       reset = r;               %sets reset to row value
       par = arr(r,2);          % finds parent
       prev = [];               %sets previous string as empty
       while par ~= -1
           [~,col] = find(arr(par,[3,4])==r);   %finds column to match row
           if col == 1                          % creates brach value
               last = num2str(0);
           else
               last = num2str(1);
           end
           dictIn = strcat(last, prev);     %updates dictionary string 
           prev = last;                     % sets previous string
           r=par;
           par = arr(par,2);
       end
       r = reset;
       def(r) = {dictIn};
    end
    out = def;
end