% reading mask into matlab
mask = readIlastikFile('original_simple_segmentation.h5');
control_mask_image = mask(:,:,1);
figure;
imshow(control_mask_image)

% cleaning up mask

control_notmodified = 'original image control.jpg';
control_notmodified_reader = bfGetReader(control_notmodified);
control_ind = control_notmodified_reader.getIndex(0,0,0)+1;
control_notmodified_original = bfGetPlane(control_notmodified_reader, control_ind);
figure;
imshow(control_notmodified_original)

% smoothing 
rad = 5;
sigma = 3;
fgauss = fspecial('gaussian', rad, sigma);
smoothcontrolimage = imfilter(control_mask_image, fgauss);
imshow(smoothcontrolimage);
fsobel = fspecial('sobel');
sobelimage = imfilter(smoothcontrolimage,fsobel);
imshow(sobelimage);
image_sm = imfilter(control_mask_image,fspecial('gaussian', 4, 2));
image_bg = imopen(image_sm,strel('disk', 15));
imshow(image_bg, []);
image_smoothed_control = imsubtract(image_sm,image_bg);
imshow(image_smoothed_control);

% find threshold
threshold = graythresh(image_smoothed_control);
disp(threshold)

% use threshold to modify image 
control_threshold =  imbinarize(image_smoothed_control, threshold);
imshow(control_threshold)

% make sure there's no holes  
control_no_holes = bwareaopen(control_threshold, 10);
imshow(control_no_holes)

% compare the original and modified images
imshowpair(control_notmodified_original, control_no_holes, 'montage')

% overlay the original and modified images 
overlayed_images = imoverlay(control_notmodified_original(1:341,1:341), control_no_holes, 'magenta');
% figure; 
imshow(overlayed_images)

% count the cells 
cell_count = regionprops(control_no_holes, 'Area');
areas = [cell_count.Area];

number_of_cells = size(areas);
disp(number_of_cells)

%distance between cells


cc = bwconncomp(control_no_holes);
labeled = labelmatrix(cc);
RGB_label = label2rgb(labeled, @copper, 'c', 'shuffle');
imshow(RGB_label,'InitialMagnification','fit')

%select the center of each cell, retaining consistency of which cell is
%which
%start at bottom and work counterclockwise

cell1_2 = bwselect;
% cell1_3 = bwselect;
cell1_4 = bwselect;
cell1_5 = bwselect;
cell1_6 = bwselect;
cell1_7 = bwselect;
cell1_8 = bwselect;
cell1_9 = bwselect;
cell1_10 = bwselect;
% cell2_3 = bwselect;
cell2_4 = bwselect;
cell2_5 = bwselect;
cell2_6 = bwselect;
cell2_7 = bwselect;
cell2_8 = bwselect;
cell2_9 = bwselect;
cell2_10 = bwselect;
% cell3_4 = bwselect;
% cell3_5 = bwselect;
% cell3_6 = bwselect;
% cell3_7 = bwselect;
% cell3_8 = bwselect;
% cell3_9 = bwselect;
% cell3_10 = bwselect;
cell4_5 = bwselect;
cell4_6 = bwselect;
cell4_7 = bwselect;
cell4_8 = bwselect;
cell4_9 = bwselect;
cell4_10 = bwselect;
cell5_6 = bwselect;
cell5_7 = bwselect;
cell5_8 = bwselect;
cell5_9 = bwselect;
cell5_10 = bwselect;
cell6_7 = bwselect;
cell6_8 = bwselect;
cell6_9 = bwselect;
cell6_10 = bwselect;
cell7_8 = bwselect;
cell7_9 = bwselect;
cell7_10 = bwselect;
cell8_9 = bwselect;
cell8_10 = bwselect;
cell9_10 = bwselect;


dist1_2 = find_distance(cell1_2);
% dist1_3 = find_distance(cell1_3);
dist1_4 = find_distance(cell1_4);
dist1_5 = find_distance(cell1_5);
dist1_6 = find_distance(cell1_6);
dist1_7 = find_distance(cell1_7);
dist1_8 = find_distance(cell1_8);
dist1_9 = find_distance(cell1_9);
dist1_10 = find_distance(cell1_10);
% dist2_3 = find_distance(cell2_3);
dist2_4 = find_distance(cell2_4);
dist2_5 = find_distance(cell2_5);
dist2_6 = find_distance(cell2_6);
dist2_7 = find_distance(cell2_7);
dist2_8 = find_distance(cell2_8);
dist2_9 = find_distance(cell2_9);
dist2_10 = find_distance(cell2_10);
% dist3_4 = find_distance(cell3_4);
% dist3_5 = find_distance(cell3_5);
% dist3_6 = find_distance(cell3_6);
% dist3_7 = find_distance(cell3_7);
% dist3_8 = find_distance(cell3_8);
% dist3_9 = find_distance(cell3_9);
% dist3_10 = find_distance(cell3_10);
dist4_5 = find_distance(cell4_5);
dist4_6 = find_distance(cell4_6);
dist4_7 = find_distance(cell4_7);
dist4_8 = find_distance(cell4_8);
dist4_9 = find_distance(cell4_9);
dist4_10 = find_distance(cell4_10);
dist5_6 = find_distance(cell5_6);
dist5_7 = find_distance(cell5_7);
dist5_8 = find_distance(cell5_8);
dist5_9 = find_distance(cell5_9);
dist5_10 = find_distance(cell5_10);
dist6_7 = find_distance(cell6_7);
dist6_8 = find_distance(cell6_8);
dist6_9 = find_distance(cell6_9);
dist6_10 = find_distance(cell6_10);
dist7_8 = find_distance(cell7_8);
dist7_9 = find_distance(cell7_9);
dist7_10 = find_distance(cell7_10);
dist8_9 = find_distance(cell8_9);
dist8_10 = find_distance(cell8_10);
dist9_10 = find_distance(cell9_10);

control_distance_matrix = [dist1_2,dist1_4,dist1_5,dist1_6,dist1_7,dist1_8,dist1_9,dist1_10,dist2_4,dist2_5,dist2_6,dist2_7,dist2_8,dist2_9,dist2_10,dist4_5,dist4_6,dist4_7,dist4_8,dist4_9,dist4_10,dist5_6,dist5_7,dist5_8,dist5_9,dist5_10,dist6_7,dist6_8,dist6_9,dist6_10,dist7_8,dist7_9,dist7_10,dist8_9,dist8_10,dist9_10]
avg_dist_control = mean(control_distance_matrix)
% avg distance = 195.6618
stdev_control= std(control_distance_matrix)
% stdev = 75.7547


%%%%%%%%%%%%%% %treated intracelluler distance copy/pasted from seperate code
% collection_of_areas = vertcat(cell1_distances_matrix, cell2_distances_matrix, cell3_distances_matrix, cell4_distances_matrix, cell5_distances_matrix, cell6_distances_matrix, cell8_distances_matrix, cell9_distances_matrix, cell10_distances_matrix, cell11_distances_matrix, cell12_distances_matrix, cell13_distances_matrix, cell14_distances_matrix, cell15_distances_matrix, cell16_distances_matrix, cell17_distances_matrix, cell18_distances_matrix, cell19_distances_matrix, cell20_distances_matrix, cell21_distances_matrix, cell22_distances_matrix);
%  
% 
average_intercellular_distance = mean(collection_of_areas); 
%     %average value of intercellular distance = 96.7284 
std_intercellular_distance = std(collection_of_areas);
%     %standard deviation = 68.7150      
%     

% plot of ALL values and plot of AVERAGE values and STDEV

hold on 

errorbar(1, avg_dist_control, stdev_control, 'b*', 'MarkerSize', 24)
errorbar(2, average_intercellular_distance, std_intercellular_distance, 'k*', 'MarkerSize', 24)
plot(1, control_distance_matrix', 'b.-',2, collection_of_areas, 'k.-')

legend('Control','anti-CD137 Treated')
ylabel('Average Intercellular Distance')
title('Comparison of Average Intercellular Distances for Control and anti-CD137 Treated CTLs')
xlim([0 3]);

hold off


