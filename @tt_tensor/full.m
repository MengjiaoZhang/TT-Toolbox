function [a] = full(tt, sizes)
%[A]=FULL(TT)
%Converts TT-tensor to the full tensor

d=tt.d; n=tt.n; ps=tt.ps; core=tt.core; r=tt.r;
a=1;
for i=1:d
  cr=core(ps(i):ps(i+1)-1);
  cr=reshape(cr,[r(i),n(i)*r(i+1)]);
  a=reshape(a,[numel(a)/r(i),r(i)]);
  a=a*cr;
end
if ( r(1) ~= 1 )
  a=reshape(a,[r(1),n',r(d+1)]);
else
  a=reshape(a,[n',r(d+1)]);    
end

if (nargin>1)&&(~isempty(sizes))
    a = reshape(a, sizes);
end;

return;
