function merge_scenes(frames, merging_method, step_size, n_points, plot)
% Merge scenes in consecutive order
% INPUTS:
%   
C = [] ;


% x = points(1,:)';
% y = points(2,:)';
% z = points(3,:)';

% fscatter3(x, y, z, C');

    if nargin ==2
        n_points = 10 ;
        step_size = 1;
        plot = true;
    end

    if nargin ==3
        step_size = 1;
        plot = true;
    end
    
    if nargin ==4
        plot = true;
    end
    
%     i = 1;
%     N = length(frames) ;
    N = n_points ;
    merged = 0;
    
    for i = 1:N
        if merging_method == 1
            
            
            % Instantiate source and target set
            source = frames{i} ;
            target = frames{i + step_size} ;
            
    %             [R, t] = icp(source, target) ;
            sample_s = randperm(size(source,2), 1000);
            sample_t = randperm(size(target,2), 1000);
            sample_source = source(:, sample_s) ;
            sample_target = target(:, sample_t) ;
            
            [R, t] = icp(sample_source, sample_target);

            % Translate points using R, t
            if i == 1
                merged = target ;
            else
                % Shift previous points
                merged = R * merged + t ;
            end

            newpoints = R * source + t ;
            merged = [merged, newpoints] ;
            C = [C ones(1, size(source, 2)) * i] ;
            
        
        elseif merging_method == 2
           
            
            % Instantiate source and target set
            source = frames{i} ;
            target = frames{i + step_size} ;
            
    %             [R, t] = icp(source, target) ;
            sample_s = randperm(size(source,2), 1000);
            sample_t = randperm(size(target,2), 1000);
            sample_source = source(:, sample_s) ;
            sample_target = target(:, sample_t) ;
            
            

            % Translate points using R, t
            if i == 1
                merged = source ;
            end
    
            sample_m = randperm(size(merged,2), 1000);
            [R, t] = icp(merged(:, sample_m), sample_target);
            
            newpoints = R * source + t ;
            merged = [merged, newpoints] ;
            C = [C ones(1, size(source, 2)) * i] ;           
        

        
        else
            disp("MERGING METHOD NOT RECOGNIZED\n")
        end
%         i = i + 1 ;
    end
        
    if plot
        figure
        C(1, 1) = N;
        fscatter39(merged(1,:),merged(2,:),merged(3,:), C')%     close all
    end
        
end 