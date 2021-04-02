function [pPivot,Array] = partitionQS(Array,first,last)
    fPointer = first+1;
    pivotQS = Array(first);
    for sPointer = first+1:last
        
        if Array(sPointer) < pivotQS
            Array = swapArrayele(Array,fPointer,sPointer);
            fPointer = fPointer+1;
        end
        
    end
   Array = swapArrayele(Array,first,fPointer-1);
   pPivot = fPointer-1;
end