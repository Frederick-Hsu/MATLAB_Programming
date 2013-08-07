Complex_A = -8;

root_A = Complex_A^(1/3)

% (-8)^(1/3)��ȫ������?��

% ��?��һ?��?ʽ p(r) = r^3 - a
p = [1, 0, 0, -Complex_A];  % p�Ƕ�?ʽp(r)��ϵ?����

R = roots(p)    % ���?ʽ�ĸ�

% ��?ƽ����??��?�����ķֲ�
MR = abs(R(1));     % ?��?����ģ
t = 0:pi/20:2*pi;   % ?��??����0��2*pi?��һ????
x = MR * sin(t);
y = MR * cos(t);
plot(x, y, 'b:')    % ?��һ?��??R��?
grid on

hold on
plot(R(2), '.', 'MarkerSize', 30, 'Color', 'r')     % ?��һ���޵ĸ�
plot(R([1, 3]), 'o', 'MarkerSize', 15, 'Color', 'b')    % ?����??��
axis([-3, 3, -3, 3])
axis square
hold off