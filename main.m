function [minRisk,name]= main(R,stock)
%to call all those functions [minRisk,name]= main(R,stock ) developed by
%Ke.Zhuang email:cocozk93@icloud.com


minRisk= RPrelation(R,stock);
Ncol= Nrelation(R,stock);   
name = krelation(R,stock);


end

