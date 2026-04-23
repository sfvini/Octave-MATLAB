% Define a matriz de coeficientes (A) e o vetor de termos independentes (B)
A = [2 -3 1; 4 -6 -1; 1 2 1];
B = [-5; -7; 4];

% Cria a matriz aumentada [A | B]
M = [A B];

% Obtém número de linhas (l) e colunas (c) da matriz A
[l, c] = size(A);


% ================= ELIMINAÇÃO DE GAUSS =================
% Objetivo: transformar a matriz em triangular superior
for j = 1:c-1 % percorre colunas (pivôs)

    % Escolhe o maior valor em módulo da coluna atual (pivoteamento parcial)
    maior = max(abs(M(j:end,j)));

    % Encontra a linha onde está esse maior valor
    LinhaPermuta = j-1 + find(abs(M(j:end,j)) == maior, 1);

    % Se necessário, troca a linha atual pela linha do maior pivô
    if LinhaPermuta ~= j
        aux = M(j,:);
        M(j,:) = M(LinhaPermuta,:);
        M(LinhaPermuta,:) = aux;
    end

    % Zera os elementos abaixo do pivô
    for i = j+1:l % percorre linhas abaixo do pivô

        % Calcula o fator multiplicador
        a = M(i,j)/M(j,j);

        % Aplica operação de linha:
        % Li = Li - a * Lj
        M(i,:) = M(i,:) - a * M(j,:);
    end
end

% ================= NORMALIZAÇÃO =================
% Divide cada linha pelo elemento da diagonal principal
% para deixar os pivôs iguais a 1
for i = 1:l
    M(i,:) = M(i,:) / M(i,i);
end

% ================= SUBSTITUIÇÃO RETROATIVA =================
% Resolve o sistema de baixo para cima
for i = l-1:-1:1
    s = 0;

    % Soma dos termos já conhecidos
    for j = l:-1:i+1
        s = s + M(j,c+1) * M(i,j);
    end

    % Atualiza o valor da variável atual
    M(i,c+1) = M(i,c+1) - s;
end

% ================= RESULTADO =================
% A solução está na última coluna da matriz
solucao = M(:,c+1);

disp('Solução final:')
disp(solucao)
