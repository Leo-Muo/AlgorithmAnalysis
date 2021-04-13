%- Irena MIKUCKIENË (2021) BubbleSortLoopF [Source code]. 
clear; clc; close all;
% This script sorts the array "x" in ascending order
% using the Bucket sort algorithm

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
    x = bSort(x);
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

dlmwrite('Results_B.txt',mean(tim)); % write to file
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
title('Bucket sort. Experimental calculations');

% The complexity of Bucket sort algorithm:
% Best case, Average - O(n + k) & Worst cases - O(n²)
figure(2) % plotting theoretical complexity
plot(n,n+10,'LineWidth',2.5);
xticks(0:8000:32000);
xticklabels({'0','8000','16000','24000','32000'});
legend('Average case, O(n+k)','Location','northwest');
grid; set(gca,'FontWeight','Bold');
xlabel('Number of elements'); ylabel('Number of operations');
title('Bucket sort. Theoretical calculations');

%% ------------------------------------------------------------------------
%initial bucket sort call function
function Array = bSort(Array)
    len = length(Array);
    Array = bucket_Sort(Array,len);
end

%Function to place elements into a bucket and sort each bucket
function Array = bucket_Sort(Array,len)
    if len >= 0
         
          %Creating the empty buckets
          for i =1:10
              B=zeros(repmat(i,1));
          end
          
          j=1;
          
          %Add elements into the buckets
          for i =1:len
              %bindex = floor(Array(i)*10);
              % Create a sample number
                theNumber = Array(i);
                theString = sprintf('%g', theNumber);
                theString(theString == '0') = [];
                theString(theString == '.') = [];
                bindex = str2double(theString(1));
              if B(bindex,j) == 0
                B(bindex,j) = Array(i);
              else
                j =j+1;
                B(bindex,j) = Array(i);
              end
          end
          
          %Removing the zeros from the matrix
          B = B(any(B,2),:);
          B = B(:,any(B,1));
          
          %Sort the elements of each bucket
          for i =1:size(B,1)
              A(i,:) = sort(B(i,:));
          end
          
          B=zeros(1,len);
          index =0;
          [row,col] = size(A);
          
           %Get the sorted array
          for i=1:row
              for j=1:col
                  if A(i,j)~=0
                      index=index+1;
                    B(index) = A(i,j);
                  end
              end
          end
            
          Array = B;
      end
         
end


