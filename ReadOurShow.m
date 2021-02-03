%--------------------------------------------------------------------------
% Z.X.Tao @xjtu  2021-01-15
%--------------------------------------------------------------------------

clc;close all;clear all;
SeqIdx = 0;
FixPts = 2.*[-80 -80 -10;-80 -80 10;-80 80 -10;-80 80 10;80 -80 -10;80 -80 10;80 80 -10;80 80 10;];

HdlRoot = 'E:\2021-01-18 SemanticEKF\Record-2020-08-25-16-47-39Vehicle';
Len = length(dir(HdlRoot));

isShow = 1;
if isShow == 1
    HF = figure;hold on;grid on;
    set(gcf,'Position',[0 0 1000 800], 'color','k');
    set(gca,'Position',[0.01 0.01 0.99,0.99], 'color','k');
end

for nFrm = 0 : 1 : Len
    %% Hdl data
    FullName = fullfile( HdlRoot, sprintf('%06d.bin', nFrm) );
    if ~exist( FullName, 'file')
        error('Not exist this file!');
    end
    fid = fopen(FullName,'rb');
    Hdl = fread(fid,[4 inf],'single')';
    fclose(fid);
    %% label data     Property List (.label)
    FullName = fullfile( HdlRoot, 'predictions', sprintf('%06d.label', nFrm) );
    if ~exist( FullName, 'file')
        error('Not exist this file!');
    end
    fid = fopen(FullName, 'rb');
    vLab = fread(fid, [1 inf], 'uint32')';
    fclose(fid);
    
    vA = dec2bin(vLab, 32);
    vAId = bin2dec(vA(:,1 :16)); % Fast
    vALb = bin2dec(vA(:,17:32));
    %%    
    if isShow == 1
        figure(HF);cla;grid on;hold on;
        vClass = unique(vALb);        
        for n = 1 : 1 : numel(vClass)
            ClassID = vClass(n);
            [ClassName, Col] = FindClassNameAndCol(ClassID);
            if strcmp(ClassName, 'road') || strcmp(ClassName, 'parking') || strcmp(ClassName, 'sidewalk')...
                     || strcmp(ClassName, 'other-ground') || strcmp(ClassName, 'building') || strcmp(ClassName, 'fence')...
                     || strcmp(ClassName, 'lane-marking') || strcmp(ClassName, 'trunk') || strcmp(ClassName, 'pole')     
                vIdx = vALb == vClass(n);
                plot3(Hdl(vIdx, 1), Hdl(vIdx, 2), Hdl(vIdx, 3), '.', 'color', Col);
            end
        end
        pcshow(FixPts);
        view(2);
        pause(1);
    end
end
    