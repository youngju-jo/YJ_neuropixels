function result_ndangle = ndangle(ndv1, ndv2)

result_ndangle = acosd(dot(ndv1/norm(ndv1), ndv2/norm(ndv2)));