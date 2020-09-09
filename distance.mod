# I defined x and y coordinates for both BSs and DPs in a 1000x1000m area
# The area divided 4 equal pieces and each piece has a BS in the centre (250,250)(250,750)(750,250)(750,750)
# Then random x and y coordinates assigned for each user and pisagor calculation is made for each DP to BS
# The area pieces shows the coverage area of BS and the furthest point between any DP to BS can be 250* 1,414 = 353,55m
# This means if pisagor < 353,55m then serve the DP else do not serve the DP
# Each DP can be only 1 BS's coverage area

# ------------------------- mobility scenario ---------------------
# we will either enhance 1000x1000m area or shrink the coverage area of BS
# lets say we reduce the coverage area to 250m for each BS
# if pisagor > 250m for ALL BSs for a DP, then we will have a look for the nearest served DP
# also we might consider both DPs are mobile DPs


set BS = 1..4; # set of BSs
set DP = 1..5; # set of DPs


param BS_loc_x {bs in BS} >=0;
param BS_loc_y {bs in BS} >=0;

param d_min:=0; 					# min distance between BS and user in meters
param d_max:=1000; 					# max distance between BS and user in meters

param DP_loc_x {dp in DP}:= Uniform(d_min, d_max);
param DP_loc_y {dp in DP}:= Uniform(d_min, d_max);


var pisagor {bs in BS, dp in DP} := sqrt((BS_loc_x[bs]-DP_loc_x[dp])^2 + (BS_loc_y[bs]-DP_loc_y[dp])^2) ;

