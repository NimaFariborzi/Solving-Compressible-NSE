function E=solvingEfwd(rho,u,v,k,mu,p,Et,T,dx,dy)

[nx,ny]=size(rho);

%build an if statement for when solving predictor step or corrector step
%future fix for now get it right

%storage
E=zeros(4,nx,ny);

%solve for Tau
%since we are in predictor, x needs to be backward, and y is central

        Txx=2*mu.*(ddxf_bwd(u,dx)-1/3*(ddxf_bwd(u,dx)+ddyf_central(v,dy)));
        %Tyy=2*mu(i,j)*(ddy_central(v,dy)-1/3*(ddx_bwd(u,dx)+ddy_central(v,dy)));
        Txy=mu.*(ddyf_central(u,dy)+ddxf_bwd(v,dx));


%solve for qx, will have to be backward
q=-k.*ddxf_bwd(T,dx);

%solving E

        E(1,1:end,1:end)=rho.*u;
        E(2,1:end,1:end)=rho.*u.^2+p-Txx;
        E(3,1:end,1:end)=rho.*u.*v-Txy;
        E(4,1:end,1:end)=(Et+p).*u-u.*Txx-v.*Txy+q;

end