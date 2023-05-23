function Ebar=solvingEbwd(rho,u,v,k,mu,p,Et,T,dx,dy)

[nx,ny]=size(rho);

%build an if statement for when solving predictor step or corrector step
%future fix for now get it right

%storage
Ebar=zeros(4,nx,ny);

%solve for Tau
%since we are in corrector, x needs to be forward, and y is central

        Txx=2*mu.*(ddxf_fwd(u,dx)-1/3*(ddxf_fwd(u,dx)+ddyf_central(v,dy)));
        %Tyy=2*mu(i,j)*(ddy_central(v,dy)-1/3*(ddx_bwd(u,dx)+ddy_central(v,dy)));
        Txy=mu.*(ddyf_central(u,dy)+ddxf_fwd(v,dx));


%solve for qx, will have to be fowward
q=-k.*ddxf_fwd(T,dx);

%solving E

        Ebar(1,1:end,1:end)=rho.*u;
        Ebar(2,1:end,1:end)=rho.*u.^2+p-Txx;
        Ebar(3,1:end,1:end)=rho.*u.*v-Txy;
        Ebar(4,1:end,1:end)=(Et+p).*u-u.*Txx-v.*Txy+q;

end