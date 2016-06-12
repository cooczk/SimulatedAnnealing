function name = krelation(R,stock)
%showing the relationship between k and optimum name = krelation(R,stock)
L=input('input a loop time for finding a relationship between steps and optimum of risk value:');
N=input('input the number of stocks in a portfolio:');
RP=input('input your expected rate of return:');
kj=input('input a number of steps you want to observe the performance:');%easier to test

mk=zeros(L,kj);

for i=1:L
    for k=1:kj
[~,riskValue]=optimization(N,k,R,stock,RP);
    mk(L,k)=riskValue;%for saving the minimum risk value in the L loop under k loop 
    end
    [name,~]=optimization(N,k,R,stock,RP);
end

avgKValue=mean(mk);

ki=1:kj;
figure(3)
plot(ki,avgKValue(ki))
xlabel('the number of steps')
ylabel('the average risk value of various steps')

