who	%shows variables in current scope
whos	%variables with details
clear x	%clear variable x from memory

% if a = [1.00000   15.00000    2.00000    0.50000]
% then element wise operation 
a < 3 % will return
ans =
  1  0  1  1
  
magic(3)  % creting some matrix
rand(3)   % creting some matrix
eye(9)    % zeros with 1 diagonal
flipud(eye(9))

%----------- plotting data -----------
t = [0 : 0.01 : 0.98]   % data generation
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);
plot(t, y1);
hold on;
plot(t, y2, 'r');
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('my plot');
cd /Users/dafi/workspace/octave-playground; print -dpng 'myPlot.png';
close;

% subplots
figure(1); plot(t, y1);
figure(2); plot(t, y2);
subplot(1,2,1);
plot(t, y1);
subplot(1,2,2);
plot(t, y2);
axis([0.5 1 -1 1]);

% visualisation tricks
A = magic(5);
imagesc(A);
imagesc(A), colorbar, colormap gray;

% command chaining
a=1, b=2, c=3

%------ statements and functions ------
[a, b] = squareAndCubeThisNumber(3)


X = [ 1 1; 1 2; 1 3]
y = [ 1; 2; 3]
j = costFunctionJ(X, y, theta)
