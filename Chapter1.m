%Oumaima Lamaakel - 2017
%Chapter 1: Introduction, concept of stress
%% 
%Problem 1: A solid steel rod consisting of n cylindrical elements welded together is subjected to vertical loading. 
%Take input from user
n=input('enter the number of elements:');
%Take input for the load on the i_th element
%Calculate the cross-sectional area
fprintf('-------------------')
for i=1:1:n
	fprintf('\nEnter force on element %d in [N] = ', i)
    %KIPS> fprintf('\nEnter force on element %d in [kips] = ', i)
	F(i)=input('');
	fprintf('Enter diameter for the element %d [mm] = ', i)
    %INCHES> fprintf('Enter diameter for the element %d [in] = ', i)
	d(i)=input('');
	Area(i)=(pi*((d(i))^2))/4;
end

%Calculate and print results
fprintf('\n-------------------\n')
fprintf('Element\t\tStress(MPa)\n')
%fprintf('Element\t\tStress(Ksi)\n')
fprintf('-------------------\n')
for i=1:1:n
	if 1==1
		Load(i)=F(i);
	else
		Load(i)=F(i)+Load(i-1);
	end

	Stress(i)=Load(i)/Area(i);
	fprintf('%2.0f\t\t% 2.2f\n', i, Stress(i))
end

%% 
%Problem 2:
%Take input from the user.
d_pin=input('The starting diameter of the pin in [mm] =');
P=input('Force applied on member ABC at A in [N] = ');
t_ABC=input('Thickness of the horizontal member ABC in [mm] : ');
w_ABC=input('Width of the horizontal member ABC in [mm] : ');
t_BD=input('Thickness of the link in [mm] : ');
w_BD=input('Width of the link in [mm] : ');
AB=input('Distance between applied force and link at B in [mm] : ');
BC=input('Distance between links at B and C in [mm] : ');
fprintf('\nAll Stress calculations in MPa.\n');
fprintf('\n---------------------------')
fprintf(' d\tsigme_BD   sigma_CE  Tau_B    Tau_C    bearing_stress_B    brearing_stress_C\n');
printf('\n---------------------------')

for i=1:21:n
	 if i==1
		d_pin(i)=d_pin;
	else
		d_pin(i)=d_pin(i-1)+ 1:
end

	AC = AB+BC;
	F_bd=(P*AC)/(2*BC);
	F_ce=(P*AB)/(2*BC);
	A_bd=t_BD*(w_BD-d_pin(i));
	A_ce=t_BD*w_BD;
	A_pin=(pi*((d_pin(i))^2)/4; %calculate pin cross-sectional area.
	sigma_bd=F_bd/A_bd;
	sigma_ce=-(F_ce/A_ce);
	Tau_b=F_bd/A_pin;
	Tau_c=F_ce/A_pin;
	bearing_stress_B=2*(F_bd/((d_pin(i))*t_ABC));
	bearing_stress_C=2*(F_ce/((d_pin(i))*t_ABC));
	Tau_ac=2*(F_bd/(t_ABC*w_ABC));
	%Calculate and print results
	fprintf('%2.1f\t%3.2f\t   %2.2f    %3.2f\t%5.2f\t  %3.2f\t\t  %2.2f\t\n', ... d_pin(i), sigma_bd, sigma_ce, Tau_b, Tau_c, bearing_stress_B, bearing_stress_C);
end
%fprintf(['\nSince, Tau_AC=%3.2f MPa, (that is, <90 MPa), and from above \n',...'results, permessible value of diameter of pin is 22mm.\n'], Tau_ac);

%%
%Problem 3:
%Take input from user.
d=input('Diameter of Pin in [in]: ');
F=input('Force applied in [lbf]: ');
w=input('Width of the member in [in]: ');
t=input('thickness of the member in [in]: ');
F_ab=2*F*sin(45*pi/180)/sin(75*pi/180);
F_bc=2*F*sin(60*pi/180)/sin(75*pi/180);
fprintf('d\tsig_AB\t  sig_BC\tTau_A\t  Tau_C\t  sig_brg_A\t  sig_brg_C\t  sig_brg_A\n');
fprintf('[in]\t[psi]\t  [psi]\t[psi]\t  [psi]\t [psi]\t\t  [psi]\t\t [psi]\n');
fprintf('---------------------------------------------------------------------------------');
for i=1:21
    if i==1
        d(i)=d;
    else 
        d(i)=d(i-1)+0.05;
    end
    A_ab=(w-d(i))*t;
    A_bc=w*t;
    A_pin=pi*d(i)^/4;
    sigma_ab=F_ab/A_ab;
    sigma_bc=-(F_bc/A_bc);
    Tau_A=F_ab/(2*A_pin);
    Tau_C=F_bc/(2*A_pin);
    sigma_bearing_a=F_ab/(d(i)*t);
    sigma_bearing_c=F_bc/(d(i)*t);
    sigma_bearing_b=F_bc/(2*d(i)*t);
    %print the results
    fprintf('%2.2f\t%5.2f     %5.2f\t%8.2f   %8.2f\t   %8.2f\t   %8.2f\t%8.2f\n', d(i), sigma_ab, sigma_bc, Tau_A, Tau_C, sigma_bearing_a, sigma_bearing_c, sigma_bearing_b);
end

%%
% Problem 4:
%Take input from user
P=input('Force applied on the member in [kip]: ');
F_ult=input('Ultimate load of the cable in [kips]: ');
fprintf('\t\t\t\tValues of Factor of Safety\n')
fprintf('--------------------------------')
fprintf('\t\t\t\tBETA\n');
fprintf('--------------------------------')

ind=0;
for i=atand(0:0.1:1)
    val=i.*(pi/180);
    ind=ind+1;
    alpha(ind,1)=val;
end

%calculate factor of safety for different angles.

for j=1:1:ind
    for k=1:1:ind
        beta(1,k)=alpha(K,1);
        F(j,k)=P*(((15*sin(alpha(j,1)))+(30*cos(alpha(j,1))))/((15*cos(beta(1,k)))+(12*sin(beta(1,k)))));
        FS(j,k)=F_ult/F(j,k);
    end
end

%print values
for j=1:1:ind+1
    for k=1:1:ind+1
        if j==1 && k==1
            fprintf('ALPHA');
        elseif j==1 && k>1
            fprintf('\n%4.2f', beta(j,k-1)*180/pi);
        elseif j>1 && k==1
            fprintf('\n%4.2f\t', alpha(j-1,k)*180/pi);
        elseif j>1 && k>1
            fprintf('%4.3f\t', FS(j-1,k-1));
        else
        end
    end
end
%%
% Problem 5:

%% 
% Problem 6:








