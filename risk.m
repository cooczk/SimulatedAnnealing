function [riskValue,X,address] = risk(N,RP,R)
%the main function to calculate the risk of a portfolio
a=abs(rand(1,N));
X=a/sum(a);
Y=X';
%weightMatrix!
W=zeros(N);
for i=1:N
for j=1:N

    W(i,j)=X(:,i)*Y(j,:);
end
end
%weightMatrix!

%pick N securities from R randomly
address=randperm(size(R,2),N);
SR=R(:,address);
%pick N securities from R randomly

avgSR=mean(SR);
rpMatrix=ones(1,length(X))*RP;
RR=zeros(length(X));%matrix of (expected return subtract effictive return)
RR(1,:)=rpMatrix-X.*avgSR;
covM=cov(SR);%statement end
riskMatrix=W.*covM+RR.^2;
riskValue=mean(mean(riskMatrix));

end


