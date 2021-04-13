% This script sorts the array "x" in ascending order using the Bubble Sort
close all; clear; clc;


nn=10; % number of the elements
prompt = 'Press D for Descending Sorted initial set or any key for Random[]\n';
init = input(prompt, 's');

if init == 'D'
    x=nn:-1:1; % descending sorted initial set
    fprintf('Descending Sorted Initial Set\n');
else
    x = randi(nn,nn,1);% random initial set
    fprintf('Random Initial Set\n');
end

fprintf('%5d',x);

%animation
f1=figure(1);
set(f1,'Position',[700, 200, 560, 420]);
subplot(211); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14); % Initial
axis([0 nn+1 0 max(x)+1]); % limits of the axes
title('Merge Sort. Initial Set','FontWeight','B');
subplot(212); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14);% Step
axis([0 nn+1 0 max(x)+1]); % limits of the axes
n=length(x);

%% ------------------------------------------------------------------------
x = merge_Sort(x,n,nn);

%Function to split the Array into two
function Array = merge_Sort(Array,len,nn)

    if len > 1
        
        % m is the point where the array is divided into two subarrays
         m = floor(len / 2);
        
         L = zeros(1,m); %left copy of the array
         R = zeros(1,len-m); %right copy of the array
         
         %inserting elements into the Arrays
         for i = 1:m
            L(i) = Array(i);
         end
         for j = m+1:len
            R((j)-m) = Array(j);
         end
         
         L = merge_Sort(L,m,nn);
         R = merge_Sort(R,len-m,nn);
        
            
        Array =  merge(Array, L,R, m, len-m,nn);
    end
         
end

%Fuction to merge the arrays
function Array = merge(Array, L, R, left, right,nn)
    
    % Maintain current index of sub-arrays and main array
    i = 1;
    j = 1;
    k = 1;
    
    %Until we reach either end of either L or R, pick larger among
    %elements L and R and place them in the correct position at A[p..r]
    while i <= left && j <= right
        
        if L(i) <= R(j)
            Array(k) =  L(i);
            i = i+1;
                subplot(212);
                plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
                hold on;
                plot(k,Array(k),'o','MarkerFaceColor','r','MarkerSize',14);
                hold off;
                axis([0 nn+1 0 max(Array)+1]);
                title('Merge Sort. Step by Step','FontWeight','B');
                input(' Press <Enter>');
                figure(1);
                fprintf('%5d',Array);
        else
            Array(k) =  R(j);
            j = j+1;
                subplot(212);
                plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
                hold on;
                plot(k,Array(k),'o','MarkerFaceColor','r','MarkerSize',14);
                hold off;
                axis([0 nn+1 0 max(Array)+1]);
                title('Merge Sort. Step by Step','FontWeight','B');
                input(' Press <Enter>');
                figure(1);
                fprintf('%5d',Array);
        end
        k = k+1;
    end
    
    %When we run out of elements in either L or R
    %pick up the remaining elements and put in Array
    while i <= left
        Array(k) =  L(i);
        i = i+1;
                subplot(212);
                plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
                hold on;
                plot(k,Array(k),'o','MarkerFaceColor','r','MarkerSize',14);
                hold off;
                axis([0 nn+1 0 max(Array)+1]);
                title('Merge Sort. Step by Step','FontWeight','B');
                input(' Press <Enter>');figure(1);
                fprintf('%5d',Array);
        
        k = k+1;
    end
    
    while j <= right
        Array(k) =  R(j);
        j = j+1;
        
                subplot(212);
                plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
                hold on;
                plot(k,Array(k),'o','MarkerFaceColor','r','MarkerSize',14);
                hold off;
                axis([0 nn+1 0 max(Array)+1]);
                title('Merge Sort. Step by Step','FontWeight','B');
                input(' Press <Enter>');figure(1);
                fprintf('%5d',Array);
        
        k = k+1;
    end
 
end


