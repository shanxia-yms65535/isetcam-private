% sample script to assemble a pbrt test scene for object and camera motion.
%
% Feb, 2021
%
% We load the "bare" Cornell box, and then (in theory) add the Stanford
% bunny and the MCC chart (and AF target?) so that we have a full test
% scene.
%

%%
ieInit();
filmResolution = 256;
numRays = 64;
sceneLuminance = 100;
ourCamera = cpBurstCamera();
sensor = sensorFromFile('ar0132atSensorRGB');
ourCamera.cmodules(1) = cpCModule('sensor', sensor);

%% scene with no lens file (yet)
simpleScene = cpScene('pbrt', 'scenePath', 'CornellBoxReference', ...
    'sceneName', 'CornellBoxReference', ...
    'resolution', [filmResolution filmResolution], ...
    'numRays', numRays, ...
    'sceneLuminance', sceneLuminance);

ourCamera.cmodules(1).sensor = ...
    sensorSet(ourCamera.cmodules(1).sensor, ...
    'size', [filmResolution, filmResolution]);

% Look at the original scene by showing our camera and then clicking
% "Preview" to get a rendering.
cpCameraWindow(ourCamera, simpleScene);

% Add the Stanford bunny to the scene
thisR = simpleScene.thisR;
bunny = load('bunny.mat');
thisR.set('asset',1, 'add', bunny.assetTree.Node{1});
%thisR.assets.show;
thisR.set('material', 'add', bunny.matList{1});
piWrite(thisR);


%{ 
% Take a look if we want
scene = piRender(thisR);
sceneWindow(scene);
%}

% TODO Next:
% Add MCC
% Add AF chart if there is an asset for it
% Give the resulting scene to our camera & try again.

%%
