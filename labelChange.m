gtpath = '/Users/marcWong/Dataset/ningbo3539_edge_aug/train/aug_gt/0.0_1_0/';
newpath = '/Users/marcWong/Dataset/gt/';
list = dir([gtpath '*.png']);
for i = 1:length(list)
    imggt = imread([gtpath list(i).name]);
    imggt(:,:,:) = imggt(:,:,:)./255;
    imwrite(imggt,[gtpath list(i).name]);
end