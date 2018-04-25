function data_cell = read_data(subdir)

data_cell = {} ;

for i = 0:99
    filename = sprintf("/%.10d.pcd", i) ;
    pcd = readPcd(strcat(subdir, filename)) ;
    pc = pcd(:, 1:3).' ;
    data_cell{end + 1} = pc(:, pc(3,:) <2);
end