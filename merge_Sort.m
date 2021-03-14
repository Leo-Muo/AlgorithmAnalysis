 %Divide the array into two subarrays, sort them and merge them
function Array = merge_Sort(Array,left,right)
    if left < right
        
        % m is the point where the array is divided into two subarrays
         m = floor((left + right) / 2);
        
         Array = merge_Sort(Array,left,m);
         Array = merge_Sort(Array,m + 1,right);
            
        Array =  merge(Array, left, m, right);
    end
         
end