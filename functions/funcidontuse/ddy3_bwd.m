function dfdy = ddy3_bwd(f,dy)

    % determine field size
    [~,nx,ny]     = size(f);
    f1=squeeze(f(1,:,:));
    f2=squeeze(f(2,:,:));
    f3=squeeze(f(3,:,:));
    f4=squeeze(f(4,:,:));

    % allocate return field
    dfdy1=zeros(nx,ny);
    dfdy2=zeros(nx,ny);
    dfdy3=zeros(nx,ny);
    dfdy4=zeros(nx,ny);

    % backward difference
    for i=1:nx
        for j=2:ny
            dfdy1(i,j) = (f1(i,j)-f1(i,j-1))/dy;
            dfdy2(i,j) = (f2(i,j)-f2(i,j-1))/dy;
            dfdy3(i,j) = (f3(i,j)-f3(i,j-1))/dy;
            dfdy4(i,j) = (f4(i,j)-f4(i,j-1))/dy;
        end
    end

    % forward difference for first point
    j = 1;
    for i=1:nx
        dfdy1(i,j) = (f1(i,j+1)-f1(i,j))/dy;
        dfdy2(i,j) = (f2(i,j+1)-f2(i,j))/dy;
        dfdy3(i,j) = (f3(i,j+1)-f3(i,j))/dy;
        dfdy4(i,j) = (f4(i,j+1)-f4(i,j))/dy;
    end
    
    dfdy=cat(3,dfdy1,dfdy2,dfdy3,dfdy4);
    dfdy=permute(dfdy,[3,1,2]);

end