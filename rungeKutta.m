clear all; clc;

% Configurações da Questão 5 - Prova 2
n = 4;                 % Número de iterações
h = 1/n;               % Passo (0.25)
x = 0;                 % x inicial
y = 1;                 % y inicial (condição inicial)

% Definição da EDO da prova
f = @(x, y) -exp(y) + (x + 1).^2; 

% Loop de cálculo do Runge-Kutta de 4ª Ordem
for i = 1:n
    K1 = f(x, y);
    K2 = f(x + h/2, y + h*K1/2);
    K3 = f(x + h/2, y + h*K2/2);
    K4 = f(x + h, y + h*K3);
    
    % Atualização do valor de y e x
    y = y + h*(K1 + 2*K2 + 2*K3 + K4)/6;
    x = x + h;
    
    % Imprime o resultado numérico de cada iteração
    fprintf('Iteração %d | x = %.2f | y = %.6f\n', i, x, y);
end
