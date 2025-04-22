%%
baseDownloadURL = 'https://www.mrt.kit.edu/z/publ/download/velodyneslam/data/scenario1.zip';
dataFolder = fullfile('C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\MATLAB\tempdir\kit_velodyneslam_data_scenario1',filesep);
options = weboptions('Timeout',Inf);

zipFileName  = dataFolder + "scenario1.zip";

% Get the full file path to the PNG files in the scenario1 folder
pointCloudFilePattern = fullfile(dataFolder,'scenario1','scan*.png');
numExpectedFiles = 2513;

folderExists = exist(dataFolder,'dir');
if ~folderExists
    % Create a folder in a temporary directory to save the downloaded zip
    % file
    mkdir(dataFolder);
    
    disp('Downloading scenario1.zip (153 MB) ...')
    websave(zipFileName,baseDownloadURL,options);
    
    % Unzip downloaded file
    unzip(zipFileName,dataFolder);

elseif folderExists && numel(dir(pointCloudFilePattern)) < numExpectedFiles
    % Redownload the data if it got reduced in the temporary directory
    disp('Downloading scenario1.zip (153 MB) ...') 
    websave(zipFileName,baseDownloadURL,options);
    
    % Unzip downloaded file
    unzip(zipFileName,dataFolder)    
end
%%
datasetTable = helperReadDataset(dataFolder,pointCloudFilePattern);
%%
pointCloudTable = datasetTable(:,1);
insDataTable = datasetTable(:,2:end);
%%
ptCloud = helperReadPointCloudFromFile(pointCloudTable.PointCloudFileName{1});
disp(ptCloud)
%%
disp(insDataTable(1,:))
%%
% Specify limits of the player
xlimits = [-45 45]; % meters
ylimits = [-45 45];
zlimits = [-10 20];

% Create a streaming point cloud display object
lidarPlayer = pcplayer(xlimits,ylimits,zlimits);

% Customize player axes labels
xlabel(lidarPlayer.Axes,'X (m)')
ylabel(lidarPlayer.Axes,'Y (m)')
zlabel(lidarPlayer.Axes,'Z (m)')

title(lidarPlayer.Axes,'Lidar Sensor Data')

% Skip evey other frame since this is a long sequence
skipFrames = 2;
numFrames = height(pointCloudTable);
for n = 1:skipFrames:numFrames

    % Read a point cloud
    fileName = pointCloudTable.PointCloudFileName{n};
    ptCloud = helperReadPointCloudFromFile(fileName);

    % Visualize point cloud
    view(lidarPlayer,ptCloud);

    pause(0.01)
end
%%
hide(lidarPlayer)

% Set random seed to ensure reproducibility
rng(0);

% Create an empty view set
vSet = pcviewset;

% Initialize point cloud processing parameters
downsamplePercent = 0.1;
regGridSize = 3;

% Initialize transformations
absTform = rigidtform3d;  % Absolute transformation to reference frame
relTform = rigidtform3d;  % Relative transformation between successive scans

viewId = 1;
skipFrames = 5;
numFrames = height(pointCloudTable);
displayRate = 100;  % Update display every 100 frames
for n = 1:skipFrames:numFrames
    
    % Read point cloud
    fileName = pointCloudTable.PointCloudFileName{n};
    ptCloudOrig = helperReadPointCloudFromFile(fileName);
    
    % Process point cloud
    %   - Segment and remove ground plane
    %   - Segment and remove ego vehicle
    ptCloud = helperProcessPointCloud(ptCloudOrig);
    
    % Downsample the processed point cloud
    ptCloud = pcdownsample(ptCloud,"random",downsamplePercent);
    
    firstFrame = (n==1);
    if firstFrame
        % Add first point cloud scan as a view to the view set
        vSet = addView(vSet,viewId,absTform,"PointCloud",ptCloudOrig);
        
        viewId = viewId + 1;
        ptCloudPrev = ptCloud;
        continue;
    end
    
    % Use INS to estimate an initial transformation for registration
    initTform = helperComputeInitialEstimateFromINS(relTform, ...
        insDataTable(n-skipFrames:n,:));
    
    % Compute rigid transformation that registers current point cloud with
    % previous point cloud
    relTform = pcregisterndt(ptCloud,ptCloudPrev,regGridSize, ...
        "InitialTransform",initTform);
    
    % Update absolute transformation to reference frame (first point cloud)
    absTform = rigidtform3d(absTform.A * relTform.A);
    
    % Add current point cloud scan as a view to the view set
    vSet = addView(vSet,viewId,absTform,"PointCloud",ptCloudOrig);
    
    % Add a connection from the previous view to the current view, representing
    % the relative transformation between them
    vSet = addConnection(vSet,viewId-1,viewId,relTform);
    
    viewId = viewId + 1;

    if mod(viewId,displayRate) == 0
        plot(vSet)
        drawnow
    end
        
    ptCloudPrev = ptCloud;
    initTform = relTform;
end

title('View Set Display')

% Display the first few views and connections
head(vSet.Views)
head(vSet.Connections)
ptClouds = vSet.Views.PointCloud;
absPoses = vSet.Views.AbsolutePose;
mapGridSize = 0.2;
ptCloudMap = pcalign(ptClouds,absPoses,mapGridSize);
figure
pcshow(ptCloudMap);
hold on
plot(vSet)
title('Point Cloud Map','Color','w')