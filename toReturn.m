function [ R ] = toReturn( M )
%orgnize the data in the closedprice ,and calculate the data as the data
%for return [ R ]=toReturn( M )
R=zeros(22,30);

for i=1:22
    R(i,:)=(M(i,:)-M(i+1,:))/M(i+1,:);
end
end
