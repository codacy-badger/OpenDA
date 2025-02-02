% x = statevector_pack(s,var1, var2, ...)
%
% Pack the different variables var1, var2, ... into the vector x.
% Only sea grid points are retained.
%
% Input:
%   s: structure generated by statevector_init.
%   var1, var2,...: variables to pack (with the same shape as the corresponding masks).
%
% Output:
%   x: vector of the packed elements. The size of this vector is the number of elements of all masks equal to 1.
%
% Notes:
% If var1, var2, ... have an additional trailing dimension, then this dimension is assumed 
% to represent the different ensemble members. In this case x is a matrix and its last dimension
% is the number of ensemble members.

% Author: Alexander Barth, 2009 <a.barth@ulg.ac.be>
% License: GPL 2 or later

function x = statevector_pack(varargin)

s = varargin{1};

if isvector(varargin{2}) && isvector(s.mask{1})
    % handle odd case when varargin{1} is a vector of size n x 1 and
    % s.mask{1} is 1 x n    
    k = 1;
else
    k = size(varargin{2},my_ndims(s.mask{1})+1);
end

x = zeros(s.n,k);

for i=1:s.nvar
  tmp = reshape(varargin{i+1},s.numels_all(i),k);
  
  ind = find(s.mask{i}==1);
  
  x(s.ind(i)+1:s.ind(i+1),:) = tmp(ind,:);
end


function d = my_ndims(v)
  if isvector(v)
    d = 1;
  else
    d = ndims(v);
  end
  

  




% Copyright (C) 2009 Alexander Barth <a.barth@ulg.ac.be>
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; If not, see <http://www.gnu.org/licenses/>.


% LocalWords:  statevector init GPL
