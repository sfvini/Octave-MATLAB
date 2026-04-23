% Função de iteração (phi)
phi = @(x) exp(x) / 4;

% Chute inicial
x_atual = 0.5;

% Parâmetros
tolerancia = 1e-4;
max_iteracoes = 100;

erro = 1;
iteracao = 0;

% Loop principal
while erro > tolerancia && iteracao < max_iteracoes
    
    % Calcula o próximo valor
    x_proximo = phi(x_atual);
    
    % Calcula o erro (diferença entre iterações)
    erro = abs(x_proximo - x_atual);
    
    % Atualiza o valor atual
    x_atual = x_proximo;
    
    iteracao = iteracao + 1;
end

% Resultado
printf('\n=== Ponto Fixo ===\n');
printf('Raiz aproximada: %.6f\n', x_atual);
printf('Iterações: %d\n', iteracao);
