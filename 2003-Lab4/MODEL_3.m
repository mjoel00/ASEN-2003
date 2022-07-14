function [omega] = MODEL_3(g,beta,theta,r,R,mc,ms,m,k,M)
mtot = mc + ms + m;

omega = sqrt(((2*mtot*g*r*theta*sind(beta))-2*M) / ((mtot*r^2) + (mc*k^2)+(m*R^2));
end