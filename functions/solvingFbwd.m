function Fbar=solvingFbwd(rho,u,v,k,mu,p,Et,T,dx,dy)

[nx,ny]=size(rho);

%build an if statement for when solving predictor step or corrector step
%future fix for now get it right

%storage
Fbar=zeros(4,nx,ny);

%solve for Tau
%since we are in corrector, x needs to be central, and y is fwd

        %Txx=2*mu(i,j)*(ddx_bwd(u,dx)-1/3*(ddx_bwd(u,dx)+ddy_central(v,dy)));
        Tyy=2*mu.*(ddyf_fwd(v,dy)-1/3*(ddxf_central(u,dx)+ddyf_fwd(v,dy)));
        Txy=mu.*(ddyf_fwd(u,dy)+ddxf_central(v,dx));


%solve for qy, will have to be foward
q=-k.*ddyf_fwd(T,dy);

%solving F

        Fbar(1,1:end,1:end)=rho.*v;
        Fbar(2,1:end,1:end)=rho.*u.*v-Txy;
        Fbar(3,1:end,1:end)=rho.*v.^2+p-Tyy;
        Fbar(4,1:end,1:end)=(Et+p).*v-v.*Tyy-u.*Txy+q;

end