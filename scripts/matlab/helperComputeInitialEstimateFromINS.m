function initTform = helperComputeInitialEstimateFromINS(initTform,insData)

% If no INS readings are available, return
if isempty(insData)
    return;
end

% The INS readings are provided with X pointing to the front, Y to the left
% and Z up. Translation below accounts for transformation into the lidar
% frame.
insToLidarOffset = [0 -0.79 -1.73]; % See DATAFORMAT.txt
Tnow = [-insData.Y(end) insData.X(end) insData.Z(end)].' + insToLidarOffset';
Tbef = [-insData.Y(1)   insData.X(1)   insData.Z(1)].'   + insToLidarOffset';

% Since the vehicle is expected to move along the ground, changes in roll 
% and pitch are minimal. Ignore changes in roll and pitch, use heading only.
Rnow = rotmat(quaternion([insData.Heading(end) 0 0],'euler','ZYX','point'),'point');
Rbef = rotmat(quaternion([insData.Heading(1)   0 0],'euler','ZYX','point'),'point');

T = [Rbef Tbef; 0 0 0 1] \ [Rnow Tnow; 0 0 0 1];

initTform = rigidtform3d(T);
end