load('swcfilenames.mat')
load('feature2_struct.mat')

[ data, attr_name ] = struct2array( array );
arffwrite('feature_vector', [data, typenum(:,1)], attr_name, typename{1})