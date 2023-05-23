function dfdx=ddx3f_bwd(f,dx)

    dfdx = zeros(size(f));
    dfdx(:,2:end,:) = (f(:,2:end,:) - f(:,1:end-1,:))/dx;
    dfdx(:,1,:) = (f(:,2,:) - f(:,1,:))/dx;

end