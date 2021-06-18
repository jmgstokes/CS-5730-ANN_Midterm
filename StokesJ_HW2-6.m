%Stokes, Jeff
%CS 5730 - Artificial Neural Networks
%Assignment 2-6

clc;
clear all;

fp = fopen('HW2-6.dat','w');
fprintf(fp,'Instance, y_0, y_1, y_2\n');

for k=1:100
    h_0 = [0 0 0 0 0]'; %initialize nodes for hidden layer 0 5x1
    h_1 = [0 0 0 0 0 0 0]'; %initialize nodes for hidden layer 1 7x1

    y = [0 1 0]';%initalize number of output nodes 3x1
    x = [1 0 1 1]';%input nodes 4x1

    W_i0 = randn(size(h_0,1),size(x,1));%input weights 3x5
    W_i1 = randn(size(h_1,1),size(h_0,1));%input weights 5x7
    W_h = randn(size(y,1),size(h_1,1));%hidden weights 7x3

    h_0 = W_i0*x;% hidden output w/out activation 5x1
    u_0 = activation_f(h_0);%hidden output 0 after activation 5x1

    h_1 = W_i1*u_0;% hidden output w/out activation 7x1
    u_1 = activation_f(h_1);%hidden output 1 after activation 7x1
    
    u_y  = W_h*u_1;%output at y before activation 3x1
    y  = activation_f(u_y);%output after activation 3x1
    y_out(:,:,k) = y;
    fprintf(fp,'%d %d %d %d\n',k,y_out(:,:,k)');
    
end
fclose(fp);
