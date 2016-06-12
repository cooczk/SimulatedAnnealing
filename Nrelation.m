function Ncol= Nrelation(R,stock)

%showing the relationship between RP and optimum minRisk= RPrelation(R,stock)
RP=input('input your expected rate of return:');
k = input('input the number of step:');

Ncol=zeros(30,1);

for N=1:30    
[~,riskValue]=optimization(N,k,R,stock,RP);
Ncol(N,:)=riskValue;
end

j=1:30;
figure(3) 
plot(j,Ncol)
xlabel('the number of stocks in a porfolio')
ylabel('riskValue')

end


