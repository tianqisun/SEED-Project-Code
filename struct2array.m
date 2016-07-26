function [ arr, col_name ] = struct2array( struct_arr )
%STRUCT2ARRAY convert array struct variables of feature into 2D array
    
cell_arr = arrayfun(@struct2vec, struct_arr, 'UniformOutput', false);
arr = vertcat(cell_arr{:});

col_name = getColName(struct_arr(1));

if length(col_name) ~= size(arr,2)
    error('Number of columns doesnt match')
end

function vec = struct2vec( struct_var )
    cell_vec = cellfun(@(x)reshape(full(x),1,numel(x)), struct2cell(struct_var), 'UniformOutput', false);
    vec = [cell_vec{:}];
end    

function col_name = getColName(struct_var)
    fname = fieldnames(struct_var);
    col_name = {};
    for i = 1:length(fname)
        num = numel(struct_var.(fname{i}));
        len = length(struct_var.(fname{i}));
        
        if num == 1,
            col_name = [col_name fname{i}];
        elseif num == len
            id = cell(1,num);
            for j = 1:num
                id{j} = sprintf('_%d', j);
            end
            col_name = [col_name strcat(fname{i}, id)];
        else
            id = cell(1,num);
            for j = 1:num
                [r, c] = ind2sub(size(struct_var.(fname{i})), j);
                id{j} = sprintf('_r%dc%d', r, c);
            end
            col_name = [col_name strcat(fname{i}, id)];
        end
    end
end

end

