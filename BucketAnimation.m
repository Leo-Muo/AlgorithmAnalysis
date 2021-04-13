% This script sorts the array "x" in ascending order using the Bubble Sort
close all; clear; clc;


nn=9; % number of the elements
prompt = 'Press D for Descending Sorted initial set or any key for Random[]\n';
init = input(prompt, 's');

if init == 'D'
    x=0.9:-0.1:0.1; % descending sorted initial set
    fprintf('Descending Sorted Initial Set\n');
else
    x = randi(nn,nn,1);% random initial set
    x=x./10;
    fprintf('Random Initial Set\n');
end

fprintf(' %.1f',x);

%animation
f1=figure(1);
set(f1,'Position',[700, 200, 560, 420]);
subplot(2,2,1); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14); % Initial
axis([0 nn+1 0 max(x)+1]); % limits of the axes
title('Quick Sort. Initial Set','FontWeight','B');

subplot(2,2,2); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14);% Step
axis([0 nn+1 0 max(x)+1]); % limits of the axes=

subplot(2,2,3); 
plot(x,'ro','MarkerFaceColor','b','MarkerSize',14);% Step
axis([0 nn+1 0 max(x)+1]); % limits of the axes
n=length(x);


%% ------------------------------------------------------------------------
x = bucket_Sort(x,n,nn);

%Function to place elements into a bucket and sort each bucket
function Array = bucket_Sort(Array,len,nn)
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
                subplot(2,2,2);
                    plot(B,'ro','MarkerFaceColor','b','MarkerSize',14);
                    hold on;
                    plot(bindex,B(bindex,j),'o','MarkerFaceColor','r','MarkerSize',14);
                    hold off;
                    axis auto;
                    title('Add elements into the buckets Step by Step','FontWeight','B');
                    input(' Press <Enter>');
                    figure(1);
                    fprintf(' %.1f',B);
              else
                j =j+1;
                B(bindex,j) = Array(i);
                plot(B,'ro','MarkerFaceColor','b','MarkerSize',14);
                    hold on;
                     plot(bindex,B(bindex,j),'o','MarkerFaceColor','r','MarkerSize',14);
                    hold off;
                    axis auto;
                    title('Add elements into the buckets Step by Step','FontWeight','B');
                    input(' Press <Enter>');
                    figure(1);
                    fprintf(' %.1f',B);
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
          index =1;
          [row,col] = size(A);
          
           %Get the sorted array
          for i=1:row
              for j=1:col
                  if A(i,j)~=0
                    B(index) = A(i,j);
                    subplot(2,2,3);
                    plot(B,'ro','MarkerFaceColor','b','MarkerSize',14);
                    hold on;
                    plot(index,B(index),'o','MarkerFaceColor','r','MarkerSize',14);
                    hold off;
                    axis([0 nn+1 0 max(B)+1]);
                    title('Get the sorted array Step by Step','FontWeight','B');
                    input(' Press <Enter>');
                    figure(1);
                    fprintf(' %.1f',B);
                    
                    index=index+1;
                  end
              end
          end
            
          Array = B;
     end
         
end
