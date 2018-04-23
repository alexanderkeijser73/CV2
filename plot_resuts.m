function plot_resuts(R, t, source, target)
    new_source = R * source  + t;

%     figure
%     fscatter3(source(1,:),source(2,:),source(3,:), 0:1:6399, 10, 'red')%     close all
    
    figure
    fscatter3(new_source(1,:),new_source(2,:),new_source(3,:), 0:1:6399, 10, 'red')%     close all
    fscatter3(target(1,:),target(2,:),target(3,:), 0:1:6399, 20, 'blue')%     close all

end