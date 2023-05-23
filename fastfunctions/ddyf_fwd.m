function dfdy=ddyf_fwd(f,dy)

    dfdy = zeros(size(f));
    dfdy(:,1:end-1) = (f(:,2:end) - f(:,1:end-1))/dy;
    dfdy(:,end) = (f(:,end) - f(:,end-1))/dy;

end