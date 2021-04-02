function Array = merge(Array, L, R, left, right)
    
    % Maintain current index of sub-arrays and main array
    i = 1;
    j = 1;
    k = 1;
    

    %Until we reach either end of either L or M, pick larger among
    %elements L and M and place them in the correct position at A[p..r]
    
    while i <= left && j <= right
        
        if L(i) <= R(j)
            Array(k) =  L(i);
            i = i+1;
        else
            Array(k) =  R(j);
            j = j+1;
        end
        k = k+1;
    end
    
    %When we run out of elements in either L or R
    %pick up the remaining elements and put in Array
    
    
    while i <= left
        Array(k) =  L(i);
        i = i+1;
        k = k+1;
    end
    
    while j <= right
        Array(k) =  R(j);
        j = j+1;
        k = k+1;
    end
 
end