function dfdx = ddx3_bwd(f,dx)
    
    % determine field size
    [~,nx,ny]     = size(f);
    f1=squeeze(f(1,:,:));
    f2=squeeze(f(2,:,:));
    f3=squeeze(f(3,:,:));
    f4=squeeze(f(4,:,:));

    % allocate return field
    dfdx1=zeros(nx,ny);
    dfdx2=zeros(nx,ny);
    dfdx3=zeros(nx,ny);
    dfdx4=zeros(nx,ny);

    % backward difference
    for i=2:nx
        for j=1:ny
            dfdx1(i,j) = (f1(i,j)-f1(i-1,j))/dx;
            dfdx2(i,j) = (f2(i,j)-f2(i-1,j))/dx;
            dfdx3(i,j) = (f3(i,j)-f3(i-1,j))/dx;
            dfdx4(i,j) = (f4(i,j)-f4(i-1,j))/dx;
        end
    end

    % forward difference for first point
    i = 1;
    for j=1:ny
        dfdx1(i,j) = (f1(i+1,j)-f1(i,j))/dx;
        dfdx2(i,j) = (f2(i+1,j)-f2(i,j))/dx;
        dfdx3(i,j) = (f3(i+1,j)-f3(i,j))/dx;
        dfdx4(i,j) = (f4(i+1,j)-f4(i,j))/dx;
    end
    
    dfdx=cat(3,dfdx1,dfdx2,dfdx3,dfdx4);
    dfdx=permute(dfdx,[3,1,2]);
    %     % assuming periodicity  (left boudary)
    %     i = 1;
    %     for j=1:ny
    %         dfdx(i,j) = (f(i,j)-f(end,j))/dx;
    %     end
end