function [rho,u,v,T,p,e,Et] = cons2prim(U,R,cv)
%rho
rho=squeeze(U(1,:,:));
%rho*u
rhou=squeeze(U(2,:,:));
%rho*v
rhov=squeeze(U(3,:,:));
%Et
Et=squeeze(U(4,:,:));

%u
        u=rhou./rho;
%v
        v=rhov./rho;
%e
        e=Et./rho-0.5*(u.^2+v.^2);
%Temp
        T=e/cv;
%pressure
        p=rho*R.*T;


end