function F=solvingFfwd(rho,u,v,k,mu,p,Et,T,dx,dy)

[nx,ny]=size(rho);

%build an if statement for when solving predictor step or corrector step
%future fix for now get it right

%storage
F=zeros(4,nx,ny);

%solve for Tau
%since we are in predictor, y needs to be backward, and x is central
        %Txx=2*mu(i,j)*(ddx_bwd(u,dx)-1/3*(ddx_bwd(u,dx)+ddy_central(v,dy)));
        Tyy=2*mu.*(ddyf_bwd(v,dy)-1/3*(ddxf_central(u,dx)+ddyf_bwd(v,dy)));
        Txy=mu.*(ddyf_bwd(u,dy)+ddxf_central(v,dx));

%solve for qy, will have to be backward
q=-k.*ddyf_bwd(T,dy);

%solving F

        F(1,1:end,1:end)=rho.*v;
        F(2,1:end,1:end)=rho.*u.*v-Txy;
        F(3,1:end,1:end)=rho.*v.^2+p-Tyy;
        F(4,1:end,1:end)=(Et+p).*v-v.*Tyy-u.*Txy+q;

end