function dfdy=ddyf_bwd(f,dy)

    dfdy = zeros(size(f));
    dfdy(:,2:end) = (f(:,2:end) - f(:,1:end-1))/dy;
    dfdy(:,1) = (f(:,2) - f(:,1))/dy;

end