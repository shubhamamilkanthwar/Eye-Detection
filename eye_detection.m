% Please edit this function only, and submit this Matlab file in a zip file
% along with your PDF report

function [left_x, right_x, left_y, right_y] = eye_detection(img)
% INPUT: RGB image
% OUTPUT: x and y coordinates of left and right eye.
% Please rewrite this function, and submit this file in Canvas (in a zip file with the report). 
%img_num=10;
%for i = 1:img_num
%img = imread([img_path,img_dir(i).name]);
    img = img + 05;
    img=imsharpen(img,'radius',.5,'amount',.4);
    img=imadjust(img,[0.43,0.7]);
    I=rgb2gray(img);
    I2=imgaussfilt(I,0.2);
    %I=rgb2gray(img);
    points = detectBRISKFeatures(I2);
    %f = figure;
    %imshow(I); 
    %hold on;
    s=points.selectStrongest(03);
    %plot(s);
    s.Location;
    left_x = (s.Location(1,1));
    left_y = (s.Location(1,2));
    right_x =(s.Location(2,1));
    right_y =(s.Location(2,2));
    %s.Location(3,1);
    %s.Location(3,2);

%end