%% Read point cloud data from pcap file

% Download a ZIP file containing a Hesai packet capture (PCAP) file and then unzip the file.
pcapFileName = "C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\System\LiDAR recordings\outside2.pcap";

% Create a hesaiFileReader object.
hesaiReader = hesaiFileReader(pcapFileName,"PandarXT32");

% Define X-, Y-, and Z-axes limits for pcplayer, in meters.
xlimits = [-60 60];
ylimits = [-60 60];
zlimits = [-20 20];

% Create a point cloud player.
player = pcplayer(xlimits,ylimits,zlimits);

% Set labels for the pcplayer axes.
xlabel(player.Axes,"X (m)");
ylabel(player.Axes,"Y (m)");
zlabel(player.Axes,"Z (m)");

% Specify the CurrentTime of the Hesai file reader so that it starts reading from 0.3 seconds after the start time.
hesaiReader.CurrentTime = hesaiReader.StartTime + seconds(0.3);

% Display the stream of point clouds from CurrentTime to the final point cloud.
while(hasFrame(hesaiReader) && player.isOpen())
    ptCloud = readFrame(hesaiReader);
    view(player,ptCloud(1)); 
end