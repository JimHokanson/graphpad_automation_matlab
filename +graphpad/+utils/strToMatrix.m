function output = strToMatrix(str)
%
%   output = graphpad.utils.strToMatrix(str)

output = sl.str.split(str,'row_split',true,'d','\t');

end