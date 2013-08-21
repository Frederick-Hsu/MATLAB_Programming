% 复数矩阵的计算

AR = [1, 3;
      2, 4];
 
AI = [5, 7;
      6, 8];

A = AR - AI*i

A_real = real(A)
A_image = imag(A)

% 求复数数组中各元素的模和幅角 －－－ 循环法
for m = 1:2
    for n = 1:2
        Am1(m, n) = abs(A(m, n));
        Aa1(m, n) = angle(A(m, n)) * 180 / pi;
    end
end

Am1
Aa1

% 求复数数组中各元素的模和幅角 －－－ 直接法
Am2 = abs(A)
Aa2 = angle(A) * 180 / pi
Am2
Aa2