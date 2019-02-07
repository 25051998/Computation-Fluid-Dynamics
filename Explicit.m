%Declaration
l=10;           %Length  
nG=10;          %Number of Grid Points
a=0.05;         %Value of constant(alpha)
x=l/nG;         %Space interval value
t=10;           %Time interval duration
nT=100;         %Number of Time Intervals
BC1=50;         %Boundary Condition No. 1
BC2=100;        %Boundary Condition No. 2
atTemp=50
%(BC1+BC2)/2;      %Atmospheric Temperature

%The initial temp. at all points to be Atmospheric Temp.
T=ones(nT,nG)*atTemp;  

%Modelling Boudary Conditions     
T(:,1)=BC1;          
T(:,nG)=BC2;

%Calculation
k =(a*t)/(x^2);  %The constant term

for  z = 1:nT-1
    
        for y = 2:(nG-1)
            T(z+1,y) = T(z,y) + k*T(z,y-1)-2*k*T(z,y)+k*T(z,y+1)
        end
    plot(T(z,:));
    pause(0.1)
    hold off
end