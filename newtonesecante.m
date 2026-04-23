% Função e derivada
funcao = @(x) x^2 + 2*x - 2;
derivada = @(x) 2*x + 2;

% Parâmetros
tolerancia = 1e-4;
max_iteracoes = 100;

%% -------- SECANTE --------
x0 = 0;
x1 = 1;

erro = 1;
iteracao = 0;

while erro > tolerancia && iteracao < max_iteracoes
    
    % Fórmula da secante
    x_novo = x1 - funcao(x1) * (x1 - x0) / (funcao(x1) - funcao(x0));
    
    % Cálculo do erro
    erro = abs(x_novo - x1);
    
    % Atualiza valores
    x0 = x1;
    x1 = x_novo;
    
    iteracao = iteracao + 1;
end

raiz_secante = x1;

%% -------- NEWTON --------
x_atual = 1;

erro = 1;
iteracao = 0;

while erro > tolerancia && iteracao < max_iteracoes
    
    % Fórmula de Newton
    x_proximo = x_atual - funcao(x_atual) / derivada(x_atual);
    
    % Erro
    erro = abs(x_proximo - x_atual);
    
    % Atualiza
    x_atual = x_proximo;
    
    iteracao = iteracao + 1;
end

raiz_newton = x_atual;

% Resultado
printf('\n=== Secante e Newton ===\n');
printf('Raiz (Secante): %.6f\n', raiz_secante);
printf('Raiz (Newton):  %.6f\n', raiz_newton);
