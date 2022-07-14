%%% Authors: Group 69
%%% Date created: 4/6/2021
%%% Last Modified: 4/6/2021

%% Housekeeping
clc
clear 
close all

%% Data Loading 
data = load('test_1');
    
%% Closed Loop System

    % Constants
    Kptheta = 20;
    Kg = 33.3;
    Km = 0.0401;
    J = 0.002;
    Rm = 19.2;
    Kdtheta = 1;
    Jhub = 0.0005;
    Jload = 0.0015;
    L = 0.45;
    Marm = 0.06;
    Jarm = (Marm*L^2)/3;
    Mtip = 0.05;
    Jm = Mtip*L^2;
    fc = 1.8;
    JL = Jarm + Jm;
    Karm = (2*pi*fc)^2*(JL);
    s = 1;
    
    % Equation 17
    num = (Kptheta * Kg * Km) / (J * Rm);    
    d2 = 1;    
    d1 = ((Kg^2 * Km^2) / (J * Rm) + (Kdtheta * Kg * Km) / (J * Rm));    
    d0 = (Kptheta * Kg * Km) / (J * Rm); 
    den = [d2 d1 d0];
    sysTF = tf(num,den);
    
    % Step Response
    [x,t] = step(sysTF);
    
    % Constants
        
        p1 = -((Kg^2)*(Km^2))/((Jhub)*(Rm));
        q1 = Karm/(L*Jhub);
        r1 = ((Kg)*(Km))/((Jhub)*(Rm));
        p2 = ((Kg^2)*(Km^2)*(L))/((Jhub)*(Rm));
        q2 = -((Karm)*(Jhub+JL))/(JL*Jhub);
        r2 = -((Kg)*(Km)*(L))/((Jhub)*(Rm));
    
    % Equation 26
    num1 = r1*(s^2)+(r2*q1-r1*q2);
    d2_1 = 1;
    d1_1 = -p1*(s^3);
    d0_1 = -q2*(s^2);
    d3_1 = p1*q2-q1*p2;
    den1 = [d2_1 d1_1 d0_1 d3_1];
    sysTF1 = tf(num1,den1);
    
    % Step Response
    [x1,t1] = step(sysTF1);
    
%% Plots

    figure(1)
    plot(t,x);
    xlabel('Time in seconds (s)')
    ylabel('Angle in radians (rad)')
    title('Rigid Arm Dynamics Simulation')
    
    figure(2)
    plot(data(:,1)-20104807.000,data(:,2));
    
    figure(3)
    plot(t,x);
    xlabel('Time in seconds (s)')
    ylabel('Angle in radians (rad)')
    title('Flexible Arm Dynamics Simulation')