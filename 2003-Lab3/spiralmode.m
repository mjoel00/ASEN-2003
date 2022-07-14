function [B] = spiralmode(x_ac_v, x_cg, gamma, C_L, b)

b = 0.8;
gamma = 2;
C_L = 0.0793;
x_ac_v = [];
x_cg = [];

B = ((x_ac_v-x_cg)/b)*(gamma/C_L);


end