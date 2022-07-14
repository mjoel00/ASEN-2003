function [vmod] = LCSMODEL(r, d, L, theta, omega)

beta = asin((d-(r.*sin(theta)))/L);

vmod = -omega.*r.*((tan(beta).*cos(theta))-sin(theta));

end
