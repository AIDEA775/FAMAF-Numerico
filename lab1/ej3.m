overflow = 1;
var = 1;
while isinf(var) == 0
  overflow = var;
  var *= 2;
end

overflow


underflow = 1;
var = 1;
while var ~= 0
  underflow = var;
  var /= 2;
end

underflow
