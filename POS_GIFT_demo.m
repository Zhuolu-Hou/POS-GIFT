%----------------------------POS-GIFT------------------------

clc;clear;close all;
warning('off')
path1 = '.\Data\pair13-1.png';
path2 = '.\Data\pair13-2.png';

%% Parameter

scale = 4;
Log_Gabor_s = 4;
Log_Gabor_o = 6;
max_point_number = 5000;
is_Rotation = 3;
k = 20;

%% Input Image Pair

image1 = imread(path1);
image2 = imread(path2);

%% Feature Detect and Match

[DescriptorForImage1,DescriptorForImage2,eo_gauss1,eo_gauss2] = MultiScale_DetectAndComputer(image1 ...
    ,image2,scale,Log_Gabor_s,Log_Gabor_o,max_point_number,is_Rotation);

%% Feature Matching

[cleanedPoints1,cleanedPoints2] = MultiScale_match(DescriptorForImage1,DescriptorForImage2, ...
    eo_gauss1,eo_gauss2,k);

%% Show Match Reault

figure;showMatchedFeatures(image1,image2,cleanedPoints1,cleanedPoints2,"montage");
