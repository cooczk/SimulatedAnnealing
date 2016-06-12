function [name,riskValue]=optimization(N,k,R,stock,RP)
%for finding optimum risk Value [name,riskValue]=optimization(N,k,R,stock,RP)

%to check if important input arguemnts have been defined,in order to call the function
%individually!
if ~exist('N','var')
    N=input('input the number of stocks in a portfolio:');
end
if ~exist('k','var')
    k = input('input the number of step:');
end
if ~exist('RP','var')
    RP=input('input your expected rate of return:');
end
%to check if important input arguemnts have been defined,in order to call the function
%individually!
[riskValue,X,address]=risk(N,RP,R);
riskVM=zeros(k+1,1);%initilize riskValue
riskVM(1,:)=riskValue;
for i=1:k
    [riskValue1,X1,address1]=risk(N,RP,R);
if riskValue>riskValue1 

    X=X1;
    address=address1;
    riskValue=riskValue1;
else
    Q=rand;
    if exp(riskValue1-riskValue)/(N-1)<Q
    X=X1;
    address=address1;
    riskValue=riskValue1;
 
    end
end
  riskVM(i+1,:)=riskValue1;
end
%return the step that has found the optimization!(handling the errors)
solurow=find(riskVM==min(riskVM));
if solurow==k+1
    disp('not enough steps,try again>_<')
end
%return the step that has found the optimization!
%find the name of the stock by address,and present the weight!
C=num2cell(X');
name(:,1)=stock(address);
name(:,2)=C;
%find the name of the stock by address,and present the weight!
j=1:k+1;
plot(j,riskVM(j,:),'blue',solurow,riskVM(solurow),'redo');
xlabel('steps')
ylabel('riskValue')

end
