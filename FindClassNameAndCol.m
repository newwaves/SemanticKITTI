function [ClassName, Col] = FindClassNameAndCol(ClassID)
%
kitti_color_map = [0,0,0;0,0,255;245,150,100;245,230,100;250,80,100;150,60,30;255,0,0;180,30,80;255,0,0;30,30,255;200,40,255;90,30,150;255,0,255;255,150,255;75,0,75;75,0,175;0,200,255;50,120,255;0,150,255;170,255,150;0,175,0;0,60,135;80,240,150;150,240,255;0,0,255;255,255,50;245,150,100;255,0,0;200,40,255;30,30,255;90,30,150;250,80,100;180,30,80;255,0,0];
vcol = kitti_color_map ./ 255;
%
class_names = { 'unlabeled';... % 0
  'outlier';...         % 1 : "outlier"
  'car';...             % 10: "car"
  'bicycle';...         % 11: "bicycle"
  'bus';...             % 13: "bus"
  'motorcycle';...      % 15: "motorcycle"
  'on-rails';...        % 16: "on-rails"
  'truck';...           % 18: "truck"
  'other-vehicle';...   % 20: "other-vehicle"
  'person';...          % 30: "person"
  'bicyclist';...       % 31: "bicyclist"
  'motorcyclist';...    % 32: "motorcyclist"
  'road';...            % 40: "road"
  'parking';...         % 44: "parking"
  'sidewalk';...        % 48: "sidewalk"
  'other-ground';...    % 49: "other-ground"
  'building';...        % 50: "building"
  'fence';...           % 51: "fence"
  'other-structure';... % 52: "other-structure"
  'lane-marking';...    % 60: "lane-marking"
  'vegetation';...      % 70: "vegetation"
  'trunk';...           % 71: "trunk"
  'terrain';...         % 72: "terrain"
  'pole';...            % 80: "pole"
  'traffic-sign';...    % 81: "traffic-sign"
  'other-object';...    % 99: "other-object"
  'moving-car';...      % 252: "moving-car"
  'moving-bicyclist';...    % 253: "moving-bicyclist"
  'moving-person';...       % 254: "moving-person"
  'moving-motorcyclist';... % 255: "moving-motorcyclist"
  'moving-on-rails';...     % 256: "moving-on-rails"
  'moving-bus';...          % 257: "moving-bus"
  'moving-truck';...        % 258: "moving-truck"
  'moving-other-vehicle';...% 259: "moving-other-vehicle"
};
vlab = [0;1;10;11;13;15;16;18;20;30;31;32;40;44;48;49;50;51;52;60;70;71;72;80;81;99;252;256;253;254;255;257;258;259]; % KITTI
%
idx = (vlab == ClassID);
Col = vcol(idx, :);
ClassName = class_names{idx};
end

%%
