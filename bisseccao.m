% Definição da função
funcao = @(x) x^8 - 2;

% Intervalo inicial
a = 1;
b = 1.1;

% Parâmetros
tolerancia = 0.1;
max_iteracoes = 100;

% Cálculo inicial do ponto médio
ponto_medio = (a + b) / 2;

iteracao = 0;

% Loop principal
while abs(funcao(ponto_medio)) > tolerancia && iteracao < max_iteracoes
    
    % Verifica em qual subintervalo está a raiz
    if funcao(a) * funcao(ponto_medio) < 0
        b = ponto_medio; % raiz está entre a e ponto_medio
    else
        a = ponto_medio; % raiz está entre ponto_medio e b
    end
    
    % Recalcula o ponto médio
    ponto_medio = (a + b) / 2;
    
    iteracao = iteracao + 1;
end

% Resultado
printf('\n=== Bisseção ===\n');
printf('Raiz aproximada: %.6f\n', ponto_medio);
printf('Iterações: %d\n', iteracao);
