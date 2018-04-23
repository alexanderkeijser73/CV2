close all

load('source.mat');
load('target.mat');

% % ICP for all data points
% [R, t] = icp(source,target);
% new_source = R * source  + t ;

% ICP for sample of target data points 
% sample = randperm(size(target,2), 3000);
% [R, t] = icp(source, target(:, sample));
% plot_resuts(R, t, source, target)

% ICP for sample of source data points 
% sample = randperm(size(source,2), 5000);
% [R, t] = icp(source(:, sample), target);
% plot_resuts(R, mean(t, 2), source, target);

% ICP for sample of source and target data points 
% sample = randperm(size(source,2), 5000);
% [R, t] = icp(source(:, sample), target(:, sample));
% plot_resuts(R, mean(t, 2), source, target);

% ICP Sample on every iteration
% [R, t] = icp(source, target, "sample");
% plot_resuts(R, mean(t, 2), source, target);

% ICP sample from informative regions
[R, t] = icp(source, target, "info");
plot_resuts(R, mean(t, 2), source, target);

%
% fname = 'Data/data/0000000000.pcd';
%mask = imread('Data/data/0000000000_depth.png')
% data = readPcd(fname);
% size(mask)
% size(data)
% fscatter3(data(:,1),data(:,2),data(:,3), data(:,4))


