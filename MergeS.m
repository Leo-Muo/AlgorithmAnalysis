%- Irena MIKUCKIENË (2021) BubbleSortLoopF [Source code]. 
clear; clc; close all;
% This script sorts the array "x" in ascending order
% using the merge sort algorithm

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
    x = mSort(x);
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

dlmwrite('Results_M.txt',mean(tim));% write to file
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
title('Merge sort. Experimental calculations');

% The complexity of Merge sort algorithm:
% Best case, Average & Worst cases - O(n*log n)
figure(2) % plotting theoretical complexity
plot(n,n.*log(n),'bd-','LineWidth',2.5);
xticks(0:8000:32000);
xticklabels({'0','8000','16000','24000','32000'});
legend('Average & Worst cases, O(n*log n)','Location','northwest');
grid; set(gca,'FontWeight','Bold');
xlabel('Number of elements'); ylabel('Number of operations');
title('Merge sort. Theoretical calculations');

%% ------------------------------------------------------------------------
%initial merge sort call function
function Array = mSort(Array)
    len = length(Array);
    Array = merge_Sort(Array,len);
end

%Function to split the Array into two
function Array = merge_Sort(Array,len)
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
         
         L = merge_Sort(L,m);
         R = merge_Sort(R,len-m);
            
        Array =  merge(Array, L,R, m, len-m);
    end
         
end

%Fuction to merge the arrays
function Array = merge(Array, L, R, left, right)
    
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

