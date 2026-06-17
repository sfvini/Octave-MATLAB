clear; close all; clc;

% POLINÔMIO DE GRAU 2 

% Dados exatos da Questão 3 (Prova 2)
x = [-0.950, -0.650, -0.350, -0.050, 0.250, 0.550, 0.850, 1.150, 1.450];
y = [-2.5693, -2.0106, -1.6086, -1.4191, -1.3293, -1.3273, -1.4820, -1.8511, -2.3839];
x_alvo = 0.3;

n = length(x);

% Montagem manual do sistema 3x3 para o grau 2
A = [sum(x.^4) sum(x.^3) sum(x.^2);
     sum(x.^3) sum(x.^2) sum(x);
     sum(x.^2) sum(x)    n];

B = [sum(x.^2 .* y); sum(x .* y); sum(y)];

K = A \ B;
a = K(1); b = K(2); c = K(3);

% Cálculo no ponto solicitado
y_alvo = a*(x_alvo^2) + b*x_alvo + c;

% Saída de resultados no Console
fprintf('Valor aproximado para x = %.1f é: %.6f\n\n', x_alvo, y_alvo);

% Gráfico
dominio = min(x):0.01:max(x);
imagem = a*(dominio.^2) + b*dominio + c;
plot(x, y, 'r*', dominio, imagem, 'b-', x_alvo, y_alvo, 'go', 'MarkerSize', 8);




% POLINÔMIO UNIVERSAL 

x = [-0.950, -0.650, -0.350, -0.050, 0.250, 0.550, 0.850, 1.150, 1.450];
y = [-2.5693, -2.0106, -1.6086, -1.4191, -1.3293, -1.3273, -1.4820, -1.8511, -2.3839];
x_alvo = 0.3;

grau = 1; % <--- Mude aqui: 1 para Reta, 2 para Parábola, 3 para Cúbica.

n = length(x);
A = zeros(grau + 1, grau + 1);
B = zeros(grau + 1, 1);

% Loops para montar as somas dinamicamente
for l = 1:(grau + 1)
    for c = 1:(grau + 1)
        potencia = (grau + 1 - l) + (grau + 1 - c);
        A(l, c) = sum(x.^potencia);
    end
    potencia_b = grau + 1 - l;
    B(l) = sum((x.^potencia_b) .* y);
end

K = A \ B; % Coeficientes retornados em ordem decrescente de potência
y_alvo = polyval(K, x_alvo); % Função nativa que avalia o polinômio K no ponto

fprintf('Valor aproximado para x = %.1f é: %.6f\n\n', x_alvo, y_alvo);
dominio = min(x):0.01:max(x);
imagem = polyval(K, dominio);
plot(x, y, 'r*', dominio, imagem, 'b-', x_alvo, y_alvo, 'go', 'MarkerSize', 8);


% EXPONENCIAL

% ATENÇÃO: Modelos exponenciais purificados exigem que todos os Y sejam POSITIVOS!

% Dados fictícios condizentes com um crescimento exponencial
x = [1.0, 2.0, 3.0, 4.0, 5.0];
y = [2.5, 7.3, 22.1, 60.2, 178.0]; 
x_alvo = 2.5;

n = length(x);
z = log(y); 

% Monta o sistema 2x2 clássico da Reta (Grau 1) usando 'z'
A = [sum(x.^2) sum(x); 
     sum(x)    n];
B = [sum(x.*z); sum(z)];

K = A \ B;
b_expoente = K(1);         
a_coeficiente = exp(K(2)); % 

y_alvo = a_coeficiente * exp(b_expoente * x_alvo);

fprintf('Valor aproximado para x = %.1f é: %.6f\n\n', x_alvo, y_alvo);

dominio = min(x):0.01:max(x);
imagem = a_coeficiente * exp(b_expoente * dominio);
plot(x, y, 'r*', dominio, imagem, 'b-', x_alvo, y_alvo, 'go', 'MarkerSize', 8);
