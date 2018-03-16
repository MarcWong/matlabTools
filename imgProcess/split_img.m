fid = fopen('split.txt');
filepath='/Users/marcWong/Dataset/hed-newdataset/';
%filepath='/Users/marcWong/Dataset/seg-newdataset/';
width = 512;
while ~feof(fid)
    file_name = fgetl(fid);
    
    ab = imread([filepath file_name '.png']);
    x = ab(:,1:width,:);
    imwrite(x,[filepath file_name '.jpg']);
    x = ab(:,width+1:width*2,:);
    imwrite(x,[filepath file_name '-gt.png']);
    x = ab(:,width*2+1:width*3,:);
    imwrite(x,[filepath file_name '-out1.png']);
    x = ab(:,width*3+1:width*4,:);
    imwrite(x,[filepath file_name '-out2.png']);
    x = ab(:,width*4+1:width*5,:);
    imwrite(x,[filepath file_name '-out3.png']);
    x = ab(:,width*5+1:width*6,:);
    imwrite(x,[filepath file_name '-out4.png']);
    x = ab(:,width*6+1:width*7,:);
    imwrite(x,[filepath file_name '-out5.png']);
    x = ab(:,width*7+1:width*8,:);
    imwrite(x,[filepath file_name '-fuse.png']);
    
    %{
    ab = imread([filepath file_name '.png']);
    x = ab(:,width+1:width*2,:);
    x = rgb2gray(x);
    x = logical(x);
    x = uint8(x).*255;
    imwrite(x,[filepath file_name '-seg_gt.png']);
    x = ab(:,width*2+1:width*3,:);
    x = rgb2gray(x);
    x = logical(x);
    x = uint8(x).*255;
    imwrite(x,[filepath file_name '-seg.png']);
    %}
end