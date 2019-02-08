clear; clc; close all;

img_path = './validation/';
img_num = 10;
img_dir = dir([img_path,'*.jpg']);
load('validation_gt.mat'); % ground truth

normlized_dist = zeros(img_num,1);

for i = 1:img_num
    
    img = imread([img_path,img_dir(i).name]);
    [left_x, right_x, left_y, right_y] = eye_detection(img);
  
    %img = img + 50;
    %I2=imsharpen(img);
    %I3=rgb2gray(I2);
    %BW = im2bw(I3);
    %B=imgaussfilt(I3,1);
    
    %BW = im2bw(B);
    %J = imcomplement(B);
    %BW = imfill(J,'holes');
    %[~, threshold] = edge(I3, 'sobel');
    %fudgeFactor = .5;
    %BW = edge(BW,'sobel', threshold * fudgeFactor);
    %I3 = bwareaopen(I3,10);
    %se = strel('disk',2);
    %I3 = imclose(I3,se);
    
    %B =edge3(I3,'approxcanny',0.3);
    %[centers,radii,metric]=imfindcircles(BW,[10,50],'ObjectPolarity','bright','sensitivity',0.85);
    
    close all;
    f = figure;
    imshow(img);
    %centers5 = centers(1:5,:); 
    %radii5 = radii(1:5);
    %metric5 = metric(1:2);
    %viscircles(centers,radii,'color','b');
    hold on;
    plot([left_x, right_x], [left_y, right_y],'r*');
    saveas(f,['output_',img_dir(i).name]);
    
    [h,w,~] = size(img);
    left_dist = sqrt( (x(i,1)-left_x).^2 + (y(i,1)-left_y).^2);
    right_dist = sqrt( (x(i,2)-right_x).^2 + (y(i,2)-right_y).^2);
    normlized_dist(i) = (left_dist + right_dist) / sqrt(h^2+w^2);
        
end

display('distance between groud truth:')
display(normlized_dist)