% Sistema de equações
F = @(x,y) [x^2 + x*y^2 - 2; x*y - 3*x*y^3 + 4];

% Jacobiana
J = @(x,y) [2*x + y^2, 2*x*y;
            y - 3*y^3, x - 9*x*y^2];

% Chute inicial
X_atual = [1; 0];

% Parâmetros
tolerancia = 0.1;
max_iteracoes = 100;

erro = 1;
iteracao = 0;

while erro > tolerancia && iteracao < max_iteracoes
    
    x = X_atual(1);
    y = X_atual(2);
    
    % Calcula próximo vetor
    X_proximo = X_atual - inv(J(x,y)) * F(x,y);
    
    % Erro (norma 1)
    erro = sum(abs(X_proximo - X_atual));
    
    % Atualiza
    X_atual = X_proximo;
    
    iteracao = iteracao + 1;
end

% Resultado
printf('\n=== Newton (Sistema) ===\n');
disp('Solução:');
disp(X_atual);
