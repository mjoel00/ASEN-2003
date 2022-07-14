function [omega] = MODEL_2(g,beta,theta,r,mc,ms,k,M)
mtot = mc + ms;

omega = sqrt(((2*mtot*g*r*theta*sind(beta))-(2*M*theta) / ((mtot*r^2) + (mc*k^2)));


end