function Array = merge(Array, left, m, right)
    
    num1 = m - left + 1;
    num2 = right - m;
    
    L = zeros(1,num1); %left copy of the array
    R = zeros(1,num2); %right copy of the array
    
    for i = 1:num1
        L(i) = Array(i);
    end
    for j = 1:num2
        R(j) = Array(m + j);
    end
    
    % Maintain current index of sub-arrays and main array
    i = 1;
    j = 1;
    k = 1;
    

    %Until we reach either end of either L or M, pick larger among
    %elements L and M and place them in the correct position at A[p..r]
    
    while i < num1 && j < num2
        
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
    
    
    while i < num1
        Array(k) =  L(i);
        i = i+1;
        k = k+1;
    end
    
    while j < num2
        Array(k) =  R(j);
        j = j+1;
        k = k+1;
    end
 
end