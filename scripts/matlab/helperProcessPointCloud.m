function ptCloud = helperProcessPointCloud(ptCloudIn,method)
%helperProcessPointCloud Process pointCloud to remove ground and ego vehicle
%   ptCloud = helperProcessPointCloud(ptCloudIn,method) processes 
%   ptCloudIn by removing the ground plane and the ego vehicle.
%   method can be "planefit" or "rangefloodfill".
%
%   See also pcfitplane, pointCloud/findPointsInCylinder.

arguments
    ptCloudIn (1,1) pointCloud
    method          string      {mustBeMember(method,["planefit","rangefloodfill"])} = "rangefloodfill"
end

isOrganized = ~ismatrix(ptCloudIn.Location);

if (method=="rangefloodfill" && isOrganized) 
    % Segment ground using floodfill on range image
    groundFixedIdx = segmentGroundFromLidarData(ptCloudIn, ...
        "ElevationAngleDelta",11);
else
    % Segment ground as the dominant plane with reference normal
    % vector pointing in positive z-direction
    maxDistance = 0.4;
    maxAngularDistance = 5;
    referenceVector= [0 0 1];

    [~,groundFixedIdx] = pcfitplane(ptCloudIn,maxDistance, ...
        referenceVector,maxAngularDistance);
end

if isOrganized
    groundFixed = false(size(ptCloudIn.Location,1),size(ptCloudIn.Location,2));
else
    groundFixed = false(ptCloudIn.Count,1);
end
groundFixed(groundFixedIdx) = true;

% Segment ego vehicle as points within a cylindrical region of the sensor
sensorLocation = [0 0 0];
egoRadius = 3.5;
egoFixed = findPointsInCylinder(ptCloudIn,egoRadius,"Center",sensorLocation);

% Retain subset of point cloud without ground and ego vehicle
if isOrganized
    indices = ~groundFixed & ~egoFixed;
else
    indices = find(~groundFixed & ~egoFixed);
end

ptCloud = select(ptCloudIn,indices);
end