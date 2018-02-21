    N = input('What value of N would you like');
    
    h = 1/N;
    l = input('What value of K would you like');

    alpha = [];
    g = [];
    c = ones(N,1);
    b = ones(N,1);
    a = -(2 + l * l * h*h)*ones(N,1);
    u = ones(N,1);
    f = h^2 .* ones(N,1);
    

    fprintf("Which case do you want to solve?\n");
    fprintf("1: u(x=0) = Uo, u(x=L) = 0\n");
    fprintf("2: du/dx(x=0) = v, u(x=L)=0\n");
    prompt = 'Choose 1 or 2';
    selection = input(prompt);
    
    
    if selection ==1
        f(1) = h^2 - 1;
        g(1) = f(1);
        c(N,1) = 0;
        b(1) = 0;
        alpha(1) = -(2 + l * l * h*h);
        y=((sinh(k-k*x) + sinh(k*x))/sinh(k)-1)*(1/k^2) + (sinh(k-k*x))/sinh(k);
    elseif selection ==2
        f(1) = h^2 + 2*h;
        g(1) = f(1);
        c(1,1) = 2;
        c(N,1) = 0;
        b(1) = 0;
        alpha(1) = -(2 + l * l * h*h);
        y=(((cosh(10*x))/cosh(10))-1)*(1/10^2) - (1/10)*(sinh(10-10*x))/cosh(10);
    end
  
    for i  = 2:N
        alpha(i) = a(i) - ( b(i) / alpha(i-1) )*c(i-1);
        g(i) = f(i) - (b(i)/alpha(i-1))*g(i-1);
    end
    
    u(N) = f(N) /alpha(N);
    
    for k = 1:(N-1)
        u(N-k) = (g(N-k) - c(N-k)*u(N-k+1)) / alpha(N-k);
    end
  
    
    x = 0:h:1-h;
    plot(x,u);
    
    %order of accuracy%
    
    


