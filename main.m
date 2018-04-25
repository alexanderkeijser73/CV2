% close all;clc;clear
% 
% load('source.mat');
% load('target.mat');
% %%
% % ICP for all data points
% [R, t] = icp(source,target);
% new_source = R * source + t ;
% plot_resuts(R, mean(t, 2), source, target)
% %%
% 
% %ICP for sample of target data points 
% sample = randperm(size(target,2), 3000);
% [R, t] = icp(source, target(:, sample));
% plot_resuts(R, t, source, target)
% 
% %%
% 
% %ICP for sample of source data points 
% sample = randperm(size(source,2), 2000);
% [R, t] = icp(source(:, sample), target);
% plot_resuts(R, mean(t, 2), source, target);
% 
% 
% %%
% %ICP for sample of source and target data points 
% sample = randperm(size(source,2), 5000);
% [R, t] = icp(source(:, sample), target(:, sample));
% plot_resuts(R, t, source, target);
% 
% %%
% %ICP Sample on every iteration
% [R, t] = icp(source, target, "sample");
% plot_resuts(R, mean(t, 2), source, target);
% 
% %%
% %ICP sample from informative regions
% [R, t] = icp(source, target, "info");
% plot_resuts(R, mean(t, 2), source, target);

%% TASK 3
% clc;
% data_cell = read_data("Data/data") ;
%%
clc;
merge_scenes(data_cell, 2, 4, 20) ;

