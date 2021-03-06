x1 = 1;
x2 = 1;
x3 = 1;
x4 = 1;

erro = 10^-4;
%coeficientes = load(input('informe o nome do arquivo da matriz de coeficientes\n'))
coeficientes = load('/Users/juliocvidal/Documents/MATLAB/mat1.mat');

%constantes = load(input('informe o nome do arquivo do vetor de constantes\n'))
constantes = load('/Users/juliocvidal/Documents/MATLAB/constantes.mat');

a = coeficientes.mat;
c = constantes.const;
solucao = 0;
tamanho = 0;

%if ( abs(a(1,1)) < (abs(a(1,2)) + abs(a(1,3)) + abs(a(1,4)) )), break, end  
%if ( abs(a(2,2)) < (abs(a(2,1)) + abs(a(2,3)) + abs(a(2,4)) )), break, end   
%if ( abs(a(3,3)) < (abs(a(3,1)) + abs(a(3,2)) + abs(a(3,4)) )), break, end   
%if ( abs(a(4,4)) < (abs(a(4,1)) + abs(a(4,2)) + abs(a(4,3)) )), break, end   

 while(true)
     
    solucao = 1;
    tamanho = max(size(x1));
    
    novox1 = (c(1) - a(1,2).*x2(tamanho) - a(1,3).*x3(tamanho) - a(1,4).*x4(tamanho))/a(1,1);
    novox2 = (c(2) - a(2,1).*x1(tamanho) - a(2,3).*x3(tamanho) - a(2,4).*x4(tamanho))/a(2,2);
    novox3 = (c(3) - a(3,1).*x1(tamanho) - a(3,2).*x2(tamanho) - a(3,4).*x4(tamanho))/a(3,3);
    novox4 = (c(4) - a(4,1).*x1(tamanho) - a(4,2).*x2(tamanho) - a(4,3).*x3(tamanho))/a(4,4);
    
    if( (abs(abs(novox1) - abs(x1(tamanho))) < erro) & (abs(abs(novox2) - abs(x2(tamanho))) < erro) & (abs(abs(novox3) - abs(x3(tamanho))) < erro) & (abs(abs(novox4) - abs(x4(tamanho))) < erro))
        break;
    end
    
    x1(tamanho+1) = novox1;
    x2(tamanho+1) = novox2;
    x3(tamanho+1) = novox3;
    x4(tamanho+1) = novox4;
 end
 
 
 if (solucao)
    plot (x1, x2, x3, x4);
    
    disp('solucoes encontradas');
    
    fprintf('x1: %f x2: %f x3: %f x4: %f tamanho: %d', x1(tamanho), x2(tamanho), x3(tamanho), x4(tamanho), tamanho);
    
 else
     disp('impossivel resolver esse sistema por esse metodo');
 end