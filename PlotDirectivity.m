function PlotDirectivity( thita, y, M0, colorname, xlab0, ylab0 )
%%
%This function is designed to plot the figure in polar coordinate, although
%Matlab has the inner function 'polar', it isn't flexible to deal with
%different requirements. Here the function 'PlotDirectivity' can plot
%arbitrary-angle figure and adjust the label size according to the input
%data.
% input variables:
% thita: the radian
% y: the value
% M0: the number for the contour line
% colorname: character variables, for example, 'r','--r','-k'
% xlab: the label of x coordinate
% ylab: the label of y coordinate
% --------------ChengLong----20160925-------FAEL------------------------
% --------------E-mail: Long.Cheng@buaa.edu.cn--------------------------
%%
for i = 1:length(thita)
    x1(i) = y(i) * cos( thita(i) );
    y1(i) = y(i) * sin( thita(i) );
end
%% 
% get the scale line
MaxR = max(y) * 1.1;
afa = linspace(0,max(thita)*180/pi,ceil( max(thita)*180/pi ) ) * pi/ 180.0;
for i = 1:M0
    x2 = MaxR * i / M0 * cos(afa);
    y2 = MaxR * i / M0 * sin(afa);
    if (  i == M0 )
        plot( x2, y2, '-k','linewidth', 2 );
    else
        plot( x2, y2, ':k', 'linewidth', 0.5 );
    end
    hold on;
end
% mark the contour line value for the input data(y)
% original point
text( -MaxR*0.05,-MaxR*0.05,'0.0','fontsize',12, 'fontname','times new roman');
for i = 1: M0
    x2 = MaxR * i / M0 - MaxR*0.05;
    y2 = -MaxR*0.05;
    z = num2str( MaxR * i / M0 );
    if ( length(z) <= 5 )
        text( x2, y2, z, 'fontsize',12, 'fontname','times new roman');
    else
        text( x2, y2, z(1:4), 'fontsize',12, 'fontname','times new roman');
    end
    x0 = MaxR * i / M0;
    y0 = MaxR*0.02;
    x2 = [ x0 x0 ];
    y2 = [ 0 y0 ];
    plot( x2, y2, '-k','linewidth',2 );
end
x2 = [ 0 0 ];
y2 = [ 0 y0 ];
plot( x2, y2, '-k','linewidth',2 );
% label
text( MaxR + 2*y0, 2*y0, xlab0, 'fontsize',14, 'fontname','times new roman');
text( 0, 2*MaxR/3 + 4*y0, ylab0, 'fontsize',14, 'fontname','times new roman');
% 
x2 = [ 0 MaxR ];
y2 = [ 0, 0 ];
plot( x2, y2, '-k', 'linewidth',2 );
x2 = [ 0 0 ];
y2 = [ 0 0 ];
M = floor( 18* max(thita) / (2*pi) );
for i = 1: M
    x2(2) = MaxR * cos( i * max(thita) / M );
    y2(2) = MaxR * sin( i * max(thita) / M );
    plot(x2,y2,':k','linewidth',0.5);
end
%%
% plot the input data
plot(x1,y1,colorname,'linewidth', 2);
axis equal
set(gca,'color','w');
set(gcf,'color','w');
axis off;
% 
end
