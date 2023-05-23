function dfdx=ddx3f_fwd(f,dx)

    dfdx = zeros(size(f));
    dfdx(:,1:end-1,:) = (f(:,2:end,:) - f(:,1:end-1,:))/dx;
    dfdx(:,end,:) = (f(:,end,:) - f(:,end-1,:))/dx;

end