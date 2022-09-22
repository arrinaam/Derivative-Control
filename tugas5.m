%deklarasi variabel
s = tf('s')
T = 1
Kp = 1
Kd = 1
num = 1
den = [T T/16 1]
sys = tf(num,den)

%fungsi sistem kontrol dan mencari nilai feedback dengan mengalikan fungsi
%kontrol dengan nilai plant
sys_A = tf([Kd Kp],[1])
final_A  = feedback(sys*sys_A,1)

sys_B = tf([3 Kp],[1])
final_B  = feedback(sys*sys_B,1)

sys_C = tf([5 Kp],[1])
final_C  = feedback(sys*sys_C,1)

sys_D = tf([7 Kp],[1])
final_D  = feedback(sys*sys_D,1)

sys_E = tf([9 Kp],[1])
final_E  = feedback(sys*sys_E,1)

%step response
figure(1)
hold all
step(final_A/s)
step(final_B/s)
step(final_C/s)
step(final_D/s)
step(final_E/s)
legend('Step Kd 1','Step Kd 2', 'Step Kd 3', 'Step Kd 4', 'Step Kd 5')

%impulse response
figure(2)
hold all
impulse(final_A)
impulse(final_B)
impulse(final_C)
impulse(final_D)
impulse(final_E)
legend('Impulse Kd 1','Impulse Kd 2', 'Impulse Kd 3', 'Impulse Kd 4', 'Impulse Kd 5')

%ramp impulse
figure(3)
hold all
step(final_A/s*s)
step(final_B/s*s)
step(final_C/s*s)
step(final_D/s*s)
step(final_E/s*s)
legend('Ramp Kd 1','Ramp Kd 2', 'Ramp Kd 3', 'Ramp Kd 4', 'Ramp Kd 5')

%membandingkan nilai risetime, overshoot, settling time, dan steady set
%error
stepinfo(final_A)
stepinfo(final_B)
stepinfo(final_C)
stepinfo(final_D)
stepinfo(final_E)

[y,u] = step(final_A);
SS_A = abs(1-y(end))

[y1,u1] = step(final_B);
SS_B = abs(1-y1(end))

[y2,u2] = step(final_C);
SS_C = abs(1-y2(end))

[y3,u3] = step(final_D);
SS_D = abs(1-y3(end))

[y4,u4] = step(final_E);
SS_E = abs(1-y4(end))