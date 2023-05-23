function dfdx=ddxf_central(f,dx)

    dfdx=zeros(size(f));
    dfdx(2:end-1,:)=(f(3:end,:)-f(1:end-2,:))/(2*dx);
    %BC
    dfdx(end,:) = (-3*f(end,:)+4*f(end-1,:)-f(end-2,:))/(2*dx);
    dfdx(1,:) = (-3*f(1,:)+4*f(2,:)-f(3,:))/(2*dx);

end