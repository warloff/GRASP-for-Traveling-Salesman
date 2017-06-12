function total_dist = CalcDistance(Cities) 
% Authors:
% William Arloff <william.arloff@valpo.edu>
% Ryan Taylor <ryan.taylor@valpo.edu>

% Calculates the distance of the traveling salesman cities

[initsize,~] = size(Cities);

p = 1:initsize;


x = Cities(p,1);
x = [x;x(1)];
y = Cities(p,2);
y = [y;y(1)];
total1 = sqrt(diff(x).^2 + diff(y).^2);
total_dist = sum(total1);

