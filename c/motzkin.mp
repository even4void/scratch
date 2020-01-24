def cos(expr x) = cosd(x*180/pi) enddef;
def sin(expr x) = sind(x*180/pi) enddef;
pi = 3.141592653689793238462643;
u = 100;
pair p[];
inc = 180/5;
start = 270;

p0 = (1,-19);
p1 = (20.02113,-5.18034);
p2 = (12.75571,17.18034);
p3 = (-10.75571,17.18034);
p4 = (-18.02113,-5.18034);

% for i=0 upto 5:
%     ang = start + inc * i;
%     rads = ang * pi/180;
%     x = u * cos(rads);
%     y = u * sin(rads);
%     p[i] = (x,y);
% endfor;

beginfig(1);
draw p0..p1..p2..p3..p4..cycle withcolor (.7,.7.,7);
for i=0 upto 4:
  draw p[i] withpen pencircle scaled 3 withcolor (.7,.7.,7); 
endfor;
% pickup pencircle scaled 1pt;
draw p0--p1;
endfig;

beginfig(2);
draw p0..p1..p2..p3..p4..cycle withcolor (.7,.7.,7);
for i=0 upto 4:
  draw p[i] withpen pencircle scaled 3 withcolor (.7,.7.,7); 
endfor;
draw p0--p1;
draw p2--p3;
endfig;

beginfig(3);
draw p0..p1..p2..p3..p4..cycle withcolor (.7,.7.,7);
for i=0 upto 4:
  draw p[i] withpen pencircle scaled 3 withcolor (.7,.7.,7); 
endfor;
draw p1--p2;
draw p3--p4;
endfig;

beginfig(4);
draw p0..p1..p2..p3..p4..cycle withcolor (.7,.7.,7);
for i=0 upto 4:
  draw p[i] withpen pencircle scaled 3 withcolor (.7,.7.,7); 
endfor;
draw p1--p3;
endfig;
end;
