%----------------------------POS-GIFT------------------------
% 
% The provided code is a demonstration by Hou Zhuolu published in "Information Fusion." 
% If it proves helpful to you, please cite it as follows: Z. Hou, Y. Liu, L. Zhang, POS-GIFT: A geometric 
% and intensity-invariant feature transformation for multimodal images, Information Fusion, 102 (2024) 102027.
% 
% Details: In order to reduce time, some adjustments have been made, such as using cross matching instead
% of the original multiple use of brute force matching + FSC in multi-scale matching...
%

%%  ********1. Parameter Setting***************
clc;clear;close all;warning('off');
isScale = 1;         % Set to 1 for scale invariance; otherwise, set to 0.
isRotation = 1;      % Set to 0 for no rotation invariance; otherwise, set to 1 for rotation invariance.otherwise, set to 2 for fast rotation invariance,
isUniform = 1;       % Require uniformly distributed keypoints, set to 1; otherwise, set to 0.
isFastMatch = 0;     % FastMatch can speed up the runtime but may compromise GIFT algorithm performance. Requirment: image1: high-resolution ;image2: low-resolution

pathForImage1 = ['.\Data\pair',num2str(1),'-1.png'];
pathForImage2 = ['.\Data\pair',num2str(1),'-2.png'];

%%  ***************2. Input Image***************

image1 = imread(pathForImage1);
image2 = imread(pathForImage2);

% Resize the image to 0~500
image1 = imresize(image1, min(500/max([size(image1),size(image2)]), 1));
image2 = imresize(image2, min(500/max([size(image1),size(image2)]), 1));

%%  *******************3. Match****************

[cleanedPoints1,cleanedPoints2] = POS_GIFT(image1,image2,isUniform,isScale,isRotation,isFastMatch);

%%  ******************4. Result*****************
figure;showMatchedFeatures(image1,image2,cleanedPoints1,cleanedPoints2,"montage");