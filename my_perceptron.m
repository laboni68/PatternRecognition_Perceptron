function w = my_perceptron(w,learn_rate,train)
  
  train_size=size(train);
  count_error=[];
  time=[];
  count=0;
  
  
  for k=1:500
    time=[time k];
    sum =0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:train_size(1)
     
    %insert your code within this for loop and record the number of
    %missclassified examples on count variable  
        a = train(i,1:2);
        class = train(i,3);
        %disp(a);
        a= [a 1];
        a = a';
        result= w'*a;
        %disp(class);
        if result > 0
            if class == 1
              delta = 1;
              count=count+1;
            else
                continue;
            end
        end
        if result < 0
            if class == 2
                delta = -1;
                count=count+1;
            else
                continue;
            end
        end
        %disp(delta);
        a= a*delta;
        %disp(a);
        sum = sum + a;
        %disp(a);
        %disp(sum);
    end
    
    sum = sum * learn_rate ;
    %disp(sum);
    w = w - sum;
    %disp(w);
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
  
   
    count_error=[count_error count];
    if count==0
      break;
    end
    count=0; 
  end
  
  plot(time,count_error)
   
end