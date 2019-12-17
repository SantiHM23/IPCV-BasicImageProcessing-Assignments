function plot_cube(data)
    patch(isocaps(data,.5),'FaceColor','interp','EdgeColor','none');
    p1 = patch(isosurface(data,.5), 'FaceColor',[.99 .7 0],'EdgeColor','none');

    isonormals(data,p1);
    view(3); 
    axis tight
    xlim([1 100]);
    ylim([1 100]);
    zlim([1 100]);

    camlight left
    colormap('gray');
    lighting gouraud
end