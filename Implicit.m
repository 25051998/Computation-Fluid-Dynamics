%initailization
l=10;                            %Length 
nG=10;                           %Number of Grid Points 
a=0.05;                          %Value of constant(alpha)
x=l/nG;                          %Space interval value
t=10;                            %Time interval duration 
nT=100;                          %Number of Time Intervals 
BC1=50;                          %Boundary Condition No. 1
BC2=100;                         %Boundary Condition No. 2

%Modelling Boudary Conditions 
T=ones(nG,1)*BC1;
T(nG)=BC2;

%Calculation
k=a*t/(x^2);    %The constant term
%creating the coefficient matrix CoefM
CoefM=zeros(nG-2,nG-2);

%declaring it as tridiagonal matrix with resp. values
for i=1:nG-2
    for j=1:nG-2
       
        if(j==i)
          CoefM(i,j)=(1+2*k);
        end
        
        if j==(i+1) ||  j==(i-1)
          CoefM(i,j)=-k;
        end
        
    end
end

kM=T(2:nG-1);                       %defining constant matrix having the independant terms
kM(1)=T(2)+k*T(1);                  %updating the first and the last term constant matrix
kM(nG-2)=T(nG-1)+k*T(nG);
X=linspace(0,l,nG);                 %defining the x axis for plotting
for time=1:nT
    SolMat= CoefM\kM;               %solving matrix 
    kM=SolMat;                      %Preparing constant matrix for next iteration
    kM(1)=SolMat(1)+k*T(1);         %changing the first and the last value of constant matrix  
    kM(nG-2)=SolMat(nG-2)+k*T(nG);  %changing the first and the last value of constant matrix
    T(2:nG-1)=SolMat;               %updating the Temperature profile
    
    pause(0.5)                     %plotting the curve
    plot(X,T)
    hold off
end






    
    
    
    