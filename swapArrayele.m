function Array = swapArrayele(Array,num1,num2)
    
    temp = Array(num2);
    Array(num2) = Array(num1);
    Array(num1) = temp;

end