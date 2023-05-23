function U = prim2cons(rho,u,v,T,cv)

% determine field size
[nx,ny]=size(rho);

U=zeros(4,nx,ny);

        %rho
        U(1,1:end,1:end)=rho;
        %rhou
        U(2,1:end,1:end)=rho.*u;
        %rhov
        U(3,1:end,1:end)=rho.*v;
        %Et
        U(4,1:end,1:end)=rho.*(cv*T+0.5*(u.^2+v.^2));


end