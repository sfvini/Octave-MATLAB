A = [10 2 1; 1 5 1; 2 3 10];
b = [7; -8; 6];

n = length(b);

% Normalização da matriz
for i = 1:n
    b(i) = b(i) / A(i,i);
    A(i,:) = A(i,:) / A(i,i);
    A(i,i) = 0;
end

% Chute inicial
x_atual = zeros(n,1);

% Parâmetros
tolerancia = 1e-2;
max_iteracoes = 100;

erro = 1;
iteracao = 0;

while erro > tolerancia && iteracao < max_iteracoes
    
    % Calcula nova aproximação
    x_proximo = b - A * x_atual;
    
    % Erro (norma infinito)
    erro = max(abs(x_proximo - x_atual));
    
    % Atualiza
    x_atual = x_proximo;
    
    iteracao = iteracao + 1;
end

% Resultado
printf('\n=== Jacobi ===\n');
disp('Solução:');
disp(x_atual);
