function [fup, fdown, fleft, fright, ffor, fback] = forces(g)

 
[x y z t_end] = coaster(g);

[v Tx Ty Tz] = speed(g);

Nx = diff(Tx);
Ny = diff(Ty);
Nz = diff(Tz);

dsdt = sqrt(diff(x)^2 + diff(y)^2 + diff(z)^2);

Kx = Nx / dsdt;
Ky = Ny / dsdt;
Kz = Nz / dsdt;

end