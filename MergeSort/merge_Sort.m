 %Divide the array into two subarrays, sort them and merge them
function Array = merge_Sort(Array,len)
    if len > 1
        
        % m is the point where the array is divided into two subarrays
         m = floor(len / 2);
        
         L = zeros(1,m); %left copy of the array
         R = zeros(1,len-m); %right copy of the array
         
         for i = 1:m
            L(i) = Array(i);
         end
         for j = m+1:len
            R((j)-m) = Array(j);
        end
         
         
         L = merge_Sort(L,m);
         R = merge_Sort(R,len-m);
            
        Array =  mergee(Array, L,R, m, len-m);
    end
         
end