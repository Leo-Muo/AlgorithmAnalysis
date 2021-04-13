% This script plots mean sorting times from text files
clear; clc; close all; 
x1 = load('Results_M.txt');
x2 = load('Results_Q.txt');
x3 = load('Results_B.txt');
n=[500 1000 2000 4000 8000 16000 32000]; % number of elements
figure(3)
yyaxis left;
plot(n,x2,'o-','LineWidth',2); grid;
xlabel('Number of elements'); 
ylabel('QuickSort Time,s');
xticks(0:8000:32000);
xticklabels({'0','8000','16000','24000','32000'});
yyaxis right
plot(n,x1,'s-','LineWidth',2);hold on;
plot(n,x3,'d-','LineWidth',2);hold on;

ylabel('MergeSort & BucketSort Time,s');

title('Comparison of sorting methods. Experimental calculations');
legend('QuickSort','MergeSort','BucketSort','location','northwest');