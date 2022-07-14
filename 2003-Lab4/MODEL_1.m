function [omega] = MODEL_1(g,beta,theta,r,mc,ms,k)
mtot = mc + ms; 

omega = sqrt((2*mtot*g*r*theta*sind(beta)) / ((mtot*r^2) + (mc*k^2));

end