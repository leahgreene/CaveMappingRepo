#include <open3d/Open3D.h>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <sstream>
#include <vector>
#include <map>
#include <set>
#include <thread>
#include <chrono>
#include <limits>
#include <algorithm>
#include <cmath>
#include <regex>

namespace fs = std::filesystem;

// Structure to hold LiDAR data points
struct LiDARPoint {
    int FrameIdx;
    double x, y, z;
};

// Custom hash function for Eigen::Vector3d (needed for removing duplicates)
struct EigenVector3dHash {
    size_t operator()(const Eigen::Vector3d& v) const {
        size_t h1 = std::hash<double>{}(v.x());
        size_t h2 = std::hash<double>{}(v.y());
        size_t h3 = std::hash<double>{}(v.z());
        return h1 ^ (h2 << 1) ^ (h3 << 2); // Combine the hash values
    }
};

// Function to get column indices for 'x', 'y', and 'z'
std::tuple<int, int, int> get_column_indices(const std::vector<std::string>& columns) {
    // Find the column indices for x, y, and z
    auto find_column = [&columns](const std::string& name) {
        auto it = std::find(columns.begin(), columns.end(), name);
        return (it != columns.end()) ? std::distance(columns.begin(), it) : -1;
        };

    // Get indices for 'Point_Easting', 'Point_Northing', and 'Point_Height'
    int x_col = find_column("Point_Easting");           // RelPos_X
    int y_col = find_column("Point_Northing");          // RelPos_Y
    int z_col = find_column("Point_Height");            // RelPos_Z

    return std::make_tuple(x_col, y_col, z_col);
}

// Function to load all data from a CSV file
std::vector<LiDARPoint> loadData(const std::string& file_path) {
    std::vector<LiDARPoint> points;
    std::ifstream file(file_path);

    if (!file.is_open()) {
        std::cerr << "Could not open file: " << file_path << std::endl;
        return points;
    }

    // Read the header
    std::string line;
    std::getline(file, line);

    // Parse the header to get column names
    std::stringstream header_stream(line);
    std::vector<std::string> columns;
    std::string column_name;
    while (std::getline(header_stream, column_name, ',')) {
        columns.push_back(column_name);
    }

    // Get column indices for x, y, and z
    auto [x_col, y_col, z_col] = get_column_indices(columns);

    // Check if required columns exist
    if (x_col == -1 || y_col == -1 || z_col == -1) {
        std::cerr << "Error: Missing required columns (Point_Easting, Point_Northing, Point_Height) in file." << std::endl;
        return points;
    }

    // Parse the remaining rows
    while (std::getline(file, line)) {
        std::stringstream ss(line);
        std::vector<std::string> row_values;
        std::string value;

        // Split the line into individual values
        while (std::getline(ss, value, ',')) {
            row_values.push_back(value);
        }

        //// Check if the row contains sufficient data
        //int max_column = std::max(x_col, y_col);        // First compare x_col and y_col
        //max_column = std::max(max_column, z_col);
        //if (static_cast<int>(row_values.size()) <= max_column) {
        //    std::cerr << "Error: Incomplete row data in file." << std::endl;
        //    continue;
        //}

        // Extract FrameIdx, x, y, z values
        LiDARPoint point;
        point.FrameIdx = std::stoi(row_values[0]);  // Assuming FrameIdx is in the first column
        point.x = std::stod(row_values[x_col]);
        point.y = std::stod(row_values[y_col]);
        point.z = std::stod(row_values[z_col]);

        // Add the point to the list
        points.push_back(point);
    }

    return points;
}


// Function to remove duplicate points using unordered_set
std::vector<Eigen::Vector3d> removeDuplicates(const std::vector<Eigen::Vector3d>& points) {
    std::unordered_set<Eigen::Vector3d, EigenVector3dHash> unique_points(points.begin(), points.end());
    return std::vector<Eigen::Vector3d>(unique_points.begin(), unique_points.end());
}

// Function to apply statistical outlier removal
std::shared_ptr<open3d::geometry::PointCloud> removeOutliers(
    const std::shared_ptr<open3d::geometry::PointCloud>& cloud) {
    auto [filtered_cloud, _] = cloud->RemoveStatisticalOutliers(20, 1.0);
    return filtered_cloud;
}

// Function to voxelize a point cloud
std::shared_ptr<open3d::geometry::PointCloud> voxelize(
    const std::shared_ptr<open3d::geometry::PointCloud>& cloud, double voxel_size) {
    return cloud->VoxelDownSample(voxel_size);
}


int main() {
    // Default folder containing frames
    std::string default_folder = "C:\\Users\\User\\Downloads\\temp\\frames2";

    // Ask the user for the folder path containing frame CSV files
    std::string frames_folder;
    std::cout << "Enter folder path containing frames (or press Enter to use the default): ";
    std::getline(std::cin, frames_folder);

    // If the user presses Enter without typing anything, use the default path
    if (frames_folder.empty()) {
        frames_folder = default_folder;
    }

    // Check if folder exists
    if (!fs::exists(frames_folder) || !fs::is_directory(frames_folder)) {
        std::cerr << "Invalid folder path!" << std::endl;
        return -1;
    }

    // Regular expression to extract frame number from filenames like "frame_x.csv"
    std::regex frame_regex("frame_(\\d+)\\.csv");

    // Set up Open3D visualizer
    open3d::visualization::Visualizer vis;
    vis.CreateVisualizerWindow("Point Cloud", 800, 600);

    // Loop through all CSV files in the folder
    for (const auto& entry : fs::directory_iterator(frames_folder)) {
        if (entry.is_regular_file() && entry.path().extension() == ".csv") {

            // Extract the filename
            std::string filename = entry.path().filename().string();

            // Match the filename to the regex
            std::smatch match;
            if (std::regex_match(filename, match, frame_regex)) {
                // Extract the frame number from the filename
                int frame_number = std::stoi(match[1].str());

                // Load data from CSV file (frame)
                std::string file_path = entry.path().string();
                std::vector<LiDARPoint> lidar_points = loadData(file_path);

                // If no points were loaded, skip this frame
                if (lidar_points.empty()) {
                    continue;
                }

                // Remove duplicates
                std::vector<Eigen::Vector3d> unique_points;
                for (const auto& point : lidar_points) {
                    unique_points.emplace_back(point.x, point.y, point.z);
                }

                unique_points = removeDuplicates(unique_points);

                // Create Open3D point cloud and add points
                auto cloud = std::make_shared<open3d::geometry::PointCloud>();
                cloud->points_ = unique_points;

                // Apply outlier removal
                cloud = removeOutliers(cloud);

                // Apply voxelization
                double voxel_size = 0.5;
                auto cloud_voxelized = voxelize(cloud, voxel_size);

                // Plot the filtered and voxelized point cloud
                vis.ClearGeometries();
                vis.AddGeometry(cloud_voxelized);
                vis.PollEvents();
                vis.UpdateRender();

                // Print "Showing frame x"
                std::cout << "Showing frame " << frame_number << " from file: " << filename << std::endl;

                // Sleep for 2 seconds before showing next frame
                std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            }
        }
    }

    // Close the Open3D visualizer window after all frames are shown
    vis.DestroyVisualizerWindow();

    // Indicate that the process is complete
    std::cout << "All frames have been shown and the program is finished." << std::endl;

    //vis.Run(); # Keeps window open
    return 0;
}

