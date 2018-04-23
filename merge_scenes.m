function merge_scenes(frames, plot)
% Merge scenes in consecutive order
% INPUTS:
%   

    if ~exist('plot', 'var')
        plot = true;
    end
    
    
    for i=1:length(frames) - 1
        source = frames{i} ;
        target = frames{i+1} ;
%         [R, t] = icp(source, target, ) ;
        sample = randperm(size(source,2), 5000);
        [R, t] = icp(source, target(:, sample));
        
        
        % Translate source using R, t
        source_t = R * source  + mean(t,2) ;

%         figure
%         fscatter3(source(1,:),source(2,:),source(3,:), 1:size(source', 1))

        if plot
            figure
            fscatter3(source_t(1,:),source_t(2,:),source_t(3,:))

            fscatter3(target(1,:),target(2,:),target(3,:))
        end
end 