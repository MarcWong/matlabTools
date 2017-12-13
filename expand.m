function out =  expand(img_in,thres)
    if length(size(img_in)) == 3
        img_in = rgb2gray(img_in);
    end
    [m n] = size(img_in);
    out = zeros([m n]);

    for i = 2:m-1
        for j = 2:n-1
            if img_in(i,j)>thres
                out(i-1,j-1)=255;
                out(i,j-1)=255;
                out(i+1,j-1)=255;
                out(i-1,j)=255;
                out(i,j)=255;
                out(i+1,j)=255;
                out(i-1,j+1)=255;
                out(i,j+1)=255;
                out(i+1,j+1)=255;
            end
        end
    end
end