function minRisk= RPrelation(R,stock)

%showing the relationship between RP and optimum minRisk= RPrelation(R,stock)

k = input('input the number of step:');

minRisk=zeros(30,101);
for N=1:30
    i=0;
  for RP=0:0.01:1
i=i+1;
[~,riskValue]=optimization(N,k,R,stock,RP);
minRisk(N,i)=riskValue;
  end
end  

figure(2)
[X,Y]=ndgrid(1:30,0:0.01:1);
surface(X,Y,minRisk);
view(3)
xlabel('the number of stocks in a portfolio')
ylabel('the expected rate of return')
zlabel('risk value')