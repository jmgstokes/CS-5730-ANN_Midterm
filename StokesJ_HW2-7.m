%Stokes, Jeff
%CS 5730 - Artificial Neural Networks
%Assignment 2-7

clc;
clear all;

fp = fopen('HW2-7.dat','w');
fprintf(fp,'Instance, y_0\n');


for k=1:100
    h_0 = [0 0 0 0]'; %initialize nodes for hidden layer 0 4x1
    h_1 = [0 0 0 0]'; %initialize nodes for hidden layer 1 4x1
    h_2 = [0 0 0 0]'; %initialize nodes for hidden layer 2 4x1

    y = [1]';%initalize number of output nodes 2x1
    x = [1 0 1]';%input nodes 3x1

    W_i_0 = randn(size(h_0,1),size(x,1));%input weights 3x4
    W_i_1 = randn(size(h_1,1),size(h_0,1));%input weights 4x4
    W_i_2 = randn(size(h_2,1),size(h_1,1));%input weights 4x4
    W_h = randn(size(y,1),size(h_2,1));%hidden weights 4x2

    h_0 = W_i_0*x;% hidden output w/out activation 4x1
    u_0 = activation_f(h_0);%hidden output 0 after activation 4x1

    h_1 = W_i_1*u_0;% hidden output w/out activation 4x1
    u_1 = activation_f(h_1);%hidden output 1 after activation 4x1    
    
    h_2 = W_i_2*u_1;% hidden output w/out activation 4x1
    u_2 = activation_f(h_2);%hidden output 1 after activation 4x1    

    u_y  = W_h*u_2;%output at y before activation 2x1
    y  = activation_f(u_y);%output after activation 2x1
    y_out(:,:,k) = y;
    
    fprintf(fp,'%d %d\n',k,y_out(:,:,k)');
    
end

fclose(fp);