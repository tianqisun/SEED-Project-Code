function [swcfiles, typenum, typename] = getfileandtype(dirpath)
%GETFILEANDTYPE read all swc files inside dirpath and return swc filenames
%and its type (cell type)

if nargin < 1,
    dirpath = '/Users/Yo/Desktop/NeuroMorpho Data/';
end

swcfiles = cell(1);
typecell = cell(1);
cur = 1;

% get all filenames and their typenames.
fs1 = dir(dirpath);
for i = 1:length(fs1),
    if fs1(i).name(1) == '.',
    elseif isdir(fullfile(dirpath, fs1(i).name)),
        fs2 = dir(fullfile(dirpath,fs1(i).name));
        for j = 1:length(fs2),
            filename = fullfile(dirpath,fs1(i).name,fs2(j).name);
            if fs2(j).name(1) == '.',
            elseif ~isdir(filename),
                [~,name,ext] = fileparts(filename);
                if strcmpi(ext,'.swc'),
                    token = strsplit(name, '.');
                    if length(token) >= 4,
                        typecell(cur,1:4) = token(1:4);
                    else
                        error('not enough description in filename');
                    end
                    
                    swcfiles{cur} = filename;
                    cur = cur+1;
                end
            else
                error('directory inside directory');
            end
        end
    end
end

% get only drosophila
idx = strcmpi(typecell(:,2), 'Drosophila melanogaster');
swcfiles = swcfiles(idx);
typecell = typecell(idx,:);

% convert typename to typenum
typename = cell(1,4);
typenum = zeros(size(typecell,1),4);
for i = 1:4,
    [typename{i}, ~, typenum(:,i)] = unique(typecell(:,i));
end

end