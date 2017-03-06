% Calculation on the struct's field

clear;
clc;

rng(0, 'v5uniform');    % To reproduce the computation result

% Store the day-lowest-temperatures in row_1 of struct T's all fields
T.M1(1, :) = 3 * rand(1, 31) + 3;
T.M2(1, :) = rand(1, 28) - 0.5;
T.M3(1, :) = 4 * rand(1, 31) + 4;

% Store the day-highest-temperature in row_2 of struct T's all fields
T.M1(2, :) = 3 * rand(1, 31) + 6;
T.M2(2, :) = 3 * rand(1, 28) - 0.5;
T.M3(2, :) = 9 * rand(1, 31) + 5;

S.M1 = 'January';
S.M2 = 'February';
S.M3 = 'March';

% =========================================================================

% Perform the calculation on struct 'T'
At = structfun(@(x)mean(mean(x)), T)
class(At)

% Perform the calculation on struct 'S'
As = structfun(@(x)x(1:3), S, 'UniformOutput', 0)
class(As)

disp(['Monthly average temperature', blanks(3), As.M1, blanks(3), As.M2, blanks(3), As.M3])
disp([blanks(12), mat2str(At', 3)])

% =========================================================================

T(2).M2 = 5 * rand(3, 28) + 60;     % Daily humidity in Feb. 3 times one day, to generate the struct
B28 = arrayfun(@(x)mean(x.M2), T, 'UniformOutput', false)
class(B28)

B2 = arrayfun(@(x)mean(mean(x.M2)), T, 'UniformOutput', false)