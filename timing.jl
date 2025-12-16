m=10000;
for i=1:5;
  A=rand(m,m);B=rand(m,1);
  t=time();A\B;
  println(time()-t)
end;
