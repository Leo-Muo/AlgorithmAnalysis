function Array = quickSort(Array,first,last)
    if first < last
        [pPivot,Array] = partitionQS(Array,first, last); % Partitioning the Array
        Array = quickSort(Array,first,pPivot-1); % Sorting the left side of the pivot 
        Array = quickSort(Array,pPivot+1,last); % Sorting the right side of the pivot 
    end
         
end