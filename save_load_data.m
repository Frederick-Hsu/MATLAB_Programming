% Program name  : save_load_data.m
% Description   : Demonstrate how to save and load data.
% Creator       : Frederick Hsu
% Creation date : Thu.  26 Jan. 20017
% Copyright(C)  2017    All rights reserved.

clear
clc

% Check the presence of folder 'data'
if exist('data', 'dir')
    rmdir('data', 's')
    mkdir('data')
else
    mkdir('data')    % Create a directory
end

% Execute an MATLAB script to output variables
Attenuation_oscillating_curve

save data/my_data t y   % Save the variables t and y generated in previous step into the my_data.mat file.

ls -al data/    % Display the .mat file


% Read out the .mat to check whether variable had been saved successfully.

clear   % Clean off all existed variable in the workspace
load data/my_data y
% Display the variable y
y