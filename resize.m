srcpath = '/Users/marcWong/Desktop/lab/1/';
resultpath = '/Users/marcWong/Desktop/lab/2/';

list = dir([resultpath '*.png']);
for i = 1:length(list)
    imgre = imread([resultpath list(i).name]);
    imgre = imresize(imgre,[1920 1080]);
    img = imread([srcpath strcat(strrep(list(i).name,'.png',''),'.jpg')]);
    subplot(1,2,1);
    imshow(img);
    subplot(1,2,2);
    imshow(imgre);
    pause(1/10000);
end