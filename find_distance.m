function distance = find_distance(cell)

find_centroids = regionprops(cell(1:341,1:341), 'Centroid');
centroid_locations = [find_centroids.Centroid];
y_coordinates = centroid_locations(:, 2:2:4);
x_coordinates = centroid_locations(:, 1:2:3);
centroid_coordinates = [(x_coordinates)', (y_coordinates)'];
distance = pdist2(centroid_coordinates(1,1:2), centroid_coordinates(2,1:2));
disp(distance)

end
