clear; close all; clc;

f = @(x) cos(x); 

% Intervalo e parâmetros
a = 0;
b = pi/2;
n_trapezios = 10;

% Tamanho da base de cada trapézio
h = (b-a)/n_trapezios;

% Criação do vetor de pontos 
ponto = [a : h : b];

somatorio_pontos_interno = 0;

% Somando apenas os pontos internos
for i = 2:n_trapezios 
    x_atual = ponto(i);
    somatorio_pontos_interno = somatorio_pontos_interno + f(x_atual);
end

% Aplicando a fórmula completa do método do trapézio
area_total = (h/2) * (f(a) + 2 * somatorio_pontos_interno + f(b));

fprintf('A área calculada é: %f\n', area_total);



% Exemplo de uma tabela com 11 pontos (gerando 10 trapézios):
X = [0.00, 0.16, 0.31, 0.47, 0.63, 0.79, 0.94, 1.10, 1.26, 1.41, 1.57];
Y = [1.00, 0.99, 0.95, 0.89, 0.81, 0.71, 0.59, 0.45, 0.31, 0.16, 0.00];

% O número de trapézios é sempre a quantidade de pontos menos 1
n_trapezios = length(X) - 1;

% O tamanho do passo (h) é a distância entre dois pontos consecutivos
h = X(2) - X(1); 

somatorio_pontos_interno = 0;

% Somando apenas os pontos internos
for i = 2:n_trapezios 
    y_atual = Y(i);
    somatorio_pontos_interno = somatorio_pontos_interno + y_atual;
end

% Aplicando a fórmula do trapézio usando o primeiro elemento, o último e a soma dos internos
area_total = (h/2) * (Y(1) + 2 * somatorio_pontos_interno + Y(end));

fprintf('A área calculada a partir da tabela é: %f\n', area_total);
