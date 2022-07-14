clear 
clc
close all

data = readtable('group78_data');
data = table2array(data);

r = 75;
d = 155;
L = 260;
omega = (pi.*data(:,5))./180;
theta = (pi.*data(:,3))./180;

vmod = LCSMODEL(r,d,L,theta,omega);