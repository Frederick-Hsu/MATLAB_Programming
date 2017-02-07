% Program name  : High_Dimension_Matrix.m
% Description   : Demonstrate the high dimension of matrices
% Creator       : Frederick Hsu
% Creation date : Tue.  31 Jan. 2017
% Copyright(C)  2017    All rights reserved.
%


clear
clc

A = reshape(1:24, [1, 3, 4, 1, 2])      % Create a 5-dimension matrix
Size_A = size(A)                        % The dimension degree of A

%%
% Squeeze the high-dimension matrices, delete the dimension whoes degree is
% 1, namely 1th, 4th dimension. Then generate a 3-dimension (3*4*2)
% matrices.
%

BA = squeeze(A)

%%
% Remove the precursor singleton dimension
[Am, m] = shiftdim(A)

%%
% Shift and remove the singleton dimension in the right end
A3 = shiftdim(A, 3)

Am(:, :, :, 1) = [];    % Empty matrix only shrinks the array, but the dimension degree does not change.
Am
Size_Am = size(Am)

%%
% Dimension re-permute for high dimension matrices.
HDm = reshape(1:24, [3, 4, 2])
DimOrder = [3, 2, 1];
HDm_permute = permute(HDm, DimOrder)