srcpath = '/Users/marcWong/Desktop/lab/nonMaximumSupression/gt/';
newpath = '/Users/marcWong/Desktop/lab/nonMaximumSupression/gt_expand/';
list = dir([srcpath '*.png']);
for k = 1:length(list)
    imggt = imread([srcpath list(k).name]);
    imggt = rgb2gray(imggt);
    %imgcanny = edge(imggt,'canny');
    [m n] = size(imggt);
    e = zeros([m n]);

    for i = 2:m-1
        for j = 2:n-1
            if imggt(i,j)>115
                e(i-1,j-1)=255;
                e(i,j-1)=255;
                e(i+1,j-1)=255;
                e(i-1,j)=255;
                e(i,j)=255;
                e(i+1,j)=255;
                e(i-1,j+1)=255;
                e(i,j+1)=255;
                e(i+1,j+1)=255;
            end
        end
    end
    %imagesc(e);
    imwrite(uint8(e),[newpath list(k).name]);
end