img_path = './validation/';
img_num = 10;
img_dir = dir([img_path,'*.jpg']);
%load('validation_gt.mat'); % ground truth

normlized_dist = zeros(img_num,1);

for i = 1:img_num
    
    img = imread([img_path,img_dir(i).name]);  
    img = img + 50;
    I2=imsharpen(img);
    I3=rgb2gray(I2);
    %BW = im2bw(I3);
    B=imgaussfilt(I3,1);
    BW = im2bw(B);
    [centers,radii]=imfindcircles(BW,[10,50],'ObjectPolarity','Dark','sensitivity',0.85);
    close all;
    f = figure;
    imshow(BW);
    viscircles(centers,radii,'color','b');
    hold on;
end 