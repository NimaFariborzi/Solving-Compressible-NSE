function dfdy=ddyf_central(f,dy)

    dfdy=zeros(size(f));
    dfdy(:,2:end-1)=(f(:,3:end)-f(:,1:end-2))/(2*dy);
    %BC
    dfdy(:,end) = (-3*f(:,end)+4*f(:,end-1)-f(:,end-2))/(2*dy);
    dfdy(:,1) = (-3*f(:,1)+4*f(:,2)-f(:,3))/(2*dy);

end