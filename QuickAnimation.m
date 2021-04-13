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
title('Quick Sort. Initial Set','FontWeight','B');
subplot(212); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14);% Step
axis([0 nn+1 0 max(x)+1]); % limits of the axes
n=length(x);

%% ------------------------------------------------------------------------
x = quick_sort(x,1,n,nn);

function Array = quick_sort(Array,first,last,nn)
    if first < last
        [pPivot,Array] = partitionQS(Array,first, last,nn); % Partitioning the Array
        Array = quick_sort(Array,first,pPivot-1,nn); % Sorting the left side of the pivot 
        Array = quick_sort(Array,pPivot+1,last,nn); % Sorting the right side of the pivot 
    end     
end

%Fuction to partition the arrays
function [pPivot,Array] = partitionQS(Array,first,last,nn)
    fPointer = first+1;
    pivotQS = Array(first);
    
    for sPointer = first+1:last 
        if Array(sPointer) < pivotQS
            Array = swapArrayele(Array,fPointer,sPointer);
            subplot(212);
            plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
            hold on;
            plot(sPointer,Array(sPointer),'o','MarkerFaceColor','r','MarkerSize',14);
            hold off;
            axis([0 nn+1 0 max(Array)+1]);
            title('Quick Sort. Step by Step','FontWeight','B');
            input(' Press <Enter>');
            figure(1);
            fprintf('%5d',Array);
            
            
            fPointer = fPointer+1;
            
        end
        
    end
   Array = swapArrayele(Array,first,fPointer-1);
    subplot(212);
            plot(Array,'ro','MarkerFaceColor','b','MarkerSize',14);
            hold on;
            plot(fPointer-1,Array(fPointer-1),'o','MarkerFaceColor','r','MarkerSize',14);
            hold off;
            axis([0 nn+1 0 max(Array)+1]);
            title('Quick Sort. Step by Step','FontWeight','B');
            input(' Press <Enter>');
            figure(1);
            fprintf('%5d',Array);
   pPivot = fPointer-1;
end

%function to swap array elements
function Array = swapArrayele(Array,num1,num2)
    temp = Array(num2);
    Array(num2) = Array(num1);
    Array(num1) = temp;
end
