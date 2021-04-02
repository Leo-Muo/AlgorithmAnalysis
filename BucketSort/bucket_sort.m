function Array = bucket_sort(Array,len)
      if len >= 0
         
          %Creating the empty buckets
          for i =1:len
              B=zeros(repmat(i,1));
          end
          
          j=1;
          
          %Add elements into the buckets
          for i =1:len
              bindex = floor(Array(i)*10);
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
          
          %Get the sorted array
          for i=1:size(A,1)
              for j=1:length(A)
                  if A(i,j)~=0
                      index=index+1;
                    B(index) = A(i,j);
                  end
              end
              
          end
            
          Array = B;
      end
end