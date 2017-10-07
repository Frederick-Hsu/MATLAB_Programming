% File name : MATLAB_LaTex_Editing_and_Displaying.m
% Description : Reserach how to edit and display the complex math formula in LaTex publish format.
% Creator : Frederick Hsu
% Creation date : Fri.  06 Oct. 2017
% Copyright(C) 2017 All rights reserved.

h = text;
set(h, 'Interpreter', 'latex');
set(h, 'string', '$$ \sum_{i=1}^{1} x_{i} = \int_{0}^{1}f(x)dx $$', 'position', [0.5, 0.5], 'FontSize', 15);

xlabel({'$ \int_0^x\!\int_0^y dF(u, v) $'}, 'Interpreter', 'latex');

text(0.2, 0.2, 'sin({\omega}t + {\beta})');

%%
% Convert the MATLAB computation result to the LaTex format

syms a b c
s = a/b + c;
latex(s)


%%
% Display the complex math equation on the figure.

% Dual integral
text('Interpreter', 'latex', 'string', '$$ \int_0^x\!\int_0^y dF(u, v) $$', 'Position', [0.2, 0.8], 'FontSize', 25);

% Schrodinger equation
text('Interpreter', 'latex', 'string', ...
    '$ - \frac{\hbar^{2}}{2m} \frac{\partial ^ {2} \Psi(x)}{\partial x^{2}} = E \Psi(x) $', ...
    'Position', [0.5, 0.2],...
    'FontSize', 25);


%%
% Display the matrix on the figure
A = [1, 2, 3;
     4, 5, 6;
     7, 8, 9];
Aout_latex = sprintf('$$ %s $$', latex(sym(A)))
text('Interpreter', 'latex', 'string', Aout_latex, 'position', [0.7, 0.7], 'FontSize', 16);

B = [1; 
     2; 
     3];

outLatex = sprintf('$$ %s^{T}{%s} $$', latex(sym(A)), latex(sym(B)))
text('Interpreter', 'latex', 'string', outLatex, 'position', [0.2, 0.3], 'FontSize', 16);
