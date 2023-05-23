function [u,v,p,T]=BCcheck(u,v,p,T,P0,T0,u0)

% [nx,ny]=size(u);

        %inflow
        p(1,2:end)=P0;
        T(1,2:end)=T0;
        v(1,2:end)=0;
        u(1,2:end)=u0;
        %far-field
        u(2:end,end)=u0;
        p(2:end,end)=P0;
        v(2:end,end)=0;
        T(2:end,end)=T0;
        %wall
        u(1:end,1)=0;
        v(1:end,1)=0;
        p(2:end,1)=2*p(2:end,2)-p(2:end,3);
        T(1:end,1)=T0;
        %outflow and its 2:end so wall boundary covers it
        u(end,2:end)=2*u(end-1,2:end)-u(end-2,2:end);
        v(end,2:end)=2*v(end-1,2:end)-v(end-2,2:end);
        T(end,2:end)=2*T(end-1,2:end)-T(end-2,2:end);
        p(end,2:end)=2*p(end-1,2:end)-p(end-2,2:end);
        %leading edge
        u(1,1)=0;
        v(1,1)=0;
        p(1,1)=P0;
        T(1,1)=T0;

end