%- Irena MIKUCKIENË (2021) BubbleSortLoopF [Source code]. 
clear; clc; close all;
% This script sorts the array "x" in ascending order
% using the Quick sort algorithm

%% -----------------------------------------------------------------------
prompt = 'Enter number of experiments to be averaged 4-10[]\n';
ne = input(prompt,'s');% number of experiments to be averaged
ne = str2double(ne);

if ne >= 4 && ne <=10
    nn = ne;
else
    nn = 10;
end
tim = zeros(nn,7);% initial time values matrix
for m =1:nn   % nn experiments loop
    
  for k = 1:7     % 7 sets whose number of elements is doubled in each loop
    x= rand(2^(k-1)*500,1); % 500, 1000, 2000,...,32000 random elements
    tic;                   % start timer
    x = qSort(x);
    tim(m,k) = toc;        % stop timer (time in seconds)
  end
  
end

%% ------------------------------------------------------------------------
% display timer values
disp('-----------------------------------------------------------------------');
fprintf('    n=500    n=1000    n=2000    n=40000   n=8000   n=16000   n=32000\n');
disp('-----------------------------------------------------------------------');
fprintf('%9.6f %9.6f %9.6f %9.6f %9.6f %9.6f %9.6f\n ',tim');
tim(1,:)=[]; % delete first loop iteration results - why?

dlmwrite('Results_Q.txt',mean(tim));% write to file
fprintf('\nMean timer values (experiments from 2nd to last)\n');
fprintf('%9.6f %9.6f %9.6f %9.6f %9.6f %9.6f %9.6f\n ',mean(tim));

%% ------------------------------------------------------------------------
% plotting experimental times
n=[500 1000 2000 4000 8000 16000 32000]; % number of elements

figure(1)
plot(n,mean(tim),'rs-','LineWidth',2.5);
xticks(0:8000:32000);
xticklabels({'0','8000','16000','24000','32000'});
grid; set(gca,'FontWeight','Bold');
xlabel('Number of elements'); ylabel('Time, s');
title('Quick sort. Experimental calculations');

% The complexity of Quick sort algorithm:
% Best case, Average & Worst cases - O(n*log n)
figure(2) % plotting theoretical complexity
plot(n,n.^2,'rs-','LineWidth',2.5);
xticks(0:8000:32000);
xticklabels({'0','8000','16000','24000','32000'});
legend('Worst cases - O(n²)','Location','northwest');
grid; set(gca,'FontWeight','Bold');
xlabel('Number of elements'); ylabel('Number of operations');
title('Quick sort. Theoretical calculations');

%% ------------------------------------------------------------------------
%initial Quick sort call function
function Array = qSort(Array)
    first = 1;
    last = length(Array);
    Array = quick_sort(Array,first,last);
end

%Function to split the Array into two
function Array = quick_sort(Array,first,last)
    if first < last
        [pPivot,Array] = partitionQS(Array,first, last); % Partitioning the Array
        Array = quick_sort(Array,first,pPivot-1); % Sorting the left side of the pivot 
        Array = quick_sort(Array,pPivot+1,last); % Sorting the right side of the pivot 
    end     
end

%Fuction to partition the arrays
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

%function to swap array elements
function Array = swapArrayele(Array,num1,num2)
    temp = Array(num2);
    Array(num2) = Array(num1);
    Array(num1) = temp;
end

