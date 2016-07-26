function arffwrite(fname, data, attr_name, class_name)
% fname This is file name without extension
%data is m x n where m are the instances and n-1 are the features. The last
%column is the class as integer

% remove space in class name
class_name = cellfun(@(x)strrep(x,' ',''), class_name, 'UniformOutput', false); 

sss=size(data,2)-1;
filename1=strcat(fname,'.arff');
out1 = fopen (filename1, 'w+');
aa1=strcat('@relation',{' '},fname,'-weka.filters.unsupervised.attribute.NumericToNominal-Rlast');
fprintf (out1, '%s\n', char(aa1));

if sss ~= length(attr_name),
    error('number of attributes doesnt match');
end
for jj=1:sss
    fprintf (out1, '@attribute %s numeric\n', attr_name{jj});
end
n_classes=max(unique(data(:,end)));
txt1=strcat('@attribute',{' '},'Type',{' {'});

if n_classes ~= length(class_name),
    error('number of classes doesnt match');
end
for ii=1:n_classes
    txt1=strcat(txt1,class_name{ii},{','});    
end
txt1=strcat(txt1,{'}'});

fprintf (out1, '%s\n\n',char(txt1));
fprintf (out1,'@data\n');

for i = 1:size(data,1),
    fprintf (out1, '%f,', data(i,1:sss));
    fprintf (out1, '%s\n', class_name{data(i,end)});
end
fclose(out1);
% dlmwrite (filename1, data, '-append' );