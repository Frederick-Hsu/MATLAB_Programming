clear
clc

AR = [1, 3
      2, 4];
AI = [5, 7
      6, 8];
A = AR - AI *1i

A_real = real(A);
A_imag = imag(A);

Am1 = zeros(2, 2);
Aa1 = zeros(2, 2);

for row = 1:2
    for col = 1:2
        Am1(row, col) = abs(A(row, col));
        Aa1(row, col) = angle(A(row, col)) * 180/pi;
    end
end

Am1
Aa1

A_mod = abs(A)
A_ang = angle(A)*180/pi

