function [ output_args ] = plotGauss( x, y, out, gridsize )
    zz = reshape(out, gridsize, gridsize);
    subplot(1, 2, 1), mesh(x,y,zz);
    subplot(1, 2, 2), mesh(x, y, exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
end

