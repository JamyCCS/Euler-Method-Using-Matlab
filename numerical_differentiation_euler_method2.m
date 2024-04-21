
newMath = true;
while newMath
    clc; 
    clearvars; 
    close all;

    %input the dy/dx
    equation_str = input('\ndy/dx= ', 's');
    f = str2func(['@(x,y) ', equation_str]);

    % Input parameters
    a = input('\nEnter the lower limit '); % Lower limit
    b = input('\nEnter the upper limit '); % Upper limit

    h = input('\nEnter the step size . \nSmaller the  size means more accuracy \nbut more computation is needed '); % step size

    % Calculation of division number
    N = (b - a) / h + 1;
    fprintf("\n%.0f divison will be made", N);



    x0=a;
    fprintf("\ninitial value of x, x_0 = %.3f",x0)
    y0=input(sprintf("\ninitial value of y_0 , y(%.3f) = ",x0)); %used sprintf instead of fprintf because 
                                                              % The sprintf function also formats data, but instead of writing to an output stream, 
                                                              % it returns the formatted text as a MATLAB string variable
    yi_1=y0; %y_n-1 =y0 for initial
    xi_1=x0; %x_n-1=x0 for initial
    xval(1)=x0;
    yval(1)=y0;
    fprintf("\n\n-----------------------\n\n");
    %Euler Method
    for i = 1:N-1
        
        slope = f(xi_1,yi_1);
        yi=yi_1+h*slope;
        xi_1= xi_1 + h;
        yi_1 = yi;
        xval(i+1)=xi_1;
        yval(i+1)=yi_1;
    end
    

    xval=xval';
    yval=yval';
    T1=table(xval,yval);
    fprintf("Euler Method\n");
    disp(T1);
    
   

    
    fprintf("\n\n-----------------------\n\n");


    %improved Euler Method
    yi_1=y0; %y_n-1 =y0 for initial
    xi_1=x0; %x_n-1=x0 for initial
    xval(1)=x0;
    yval(1)=y0;

    for i=1:N-1
        xi=xi_1 + h;
        yi=yi_1+h*(f(xi_1,yi_1));
        yi=yi_1 + (h/2)* (f(xi_1,yi_1)+f(xi,yi));
        xi_1=xi;
        yi_1=yi;
        xval(i+1)=xi_1;
        yval(i+1)=yi_1;
    end
    
    
    T1=table(xval,yval);
    fprintf("Improved Euler Method\n");
    disp(T1);

    fprintf("\n\n-----------------------\n\n");

    %modifed Euler Method
    yi_1=y0; %y_n-1 =y0 for initial
    xi_1=x0; %x_n-1=x0 for initial
    xval(1)=x0;
    yval(1)=y0;
    for i=1:N-1
        x=xi_1+h/2;
        y=yi_1+(h/2)*(f(xi_1,yi_1));
        yi=yi_1+h*f(x,y);
        xi=xi_1 + h;
        xi_1=xi;
        yi_1=yi;
        xval(i+1)=xi_1;
        yval(i+1)=yi_1;
    end
    
   
    T1=table(xval,yval);
    fprintf("Modified Euler Method\n");
    disp(T1);
        
    newMath= logical(input("Do another math? 1 for yes 0 for no \n"));
   
end