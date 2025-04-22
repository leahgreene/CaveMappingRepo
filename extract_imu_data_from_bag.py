# extract_imu_data_from_bag.py

import rospy
import rosbag
import csv
from sensor_msgs.msg import Imu

# Callback function to save IMU data to CSV
def imu_callback(msg, csv_writer):
    timestamp = msg.header.stamp.to_sec()  # Timestamp in seconds
    orientation = msg.orientation  # Quaternion (x, y, z, w)
    angular_velocity = msg.angular_velocity  # (x, y, z)
    linear_acceleration = msg.linear_acceleration  # (x, y, z)

    # Write the data to CSV file
    csv_writer.writerow([
        timestamp,
        orientation.x, orientation.y, orientation.z, orientation.w,
        angular_velocity.x, angular_velocity.y, angular_velocity.z,
        linear_acceleration.x, linear_acceleration.y, linear_acceleration.z
    ])

def main():
    # Initialize the ROS node
    rospy.init_node('imu_data_extractor', anonymous=True)

    # Open the CSV file to write the IMU data
    with open('/home/leah/imu_data.csv', mode='w') as file:
        csv_writer = csv.writer(file)
        # Write header
        csv_writer.writerow(['Timestamp', 'Orientation_x', 'Orientation_y', 'Orientation_z', 'Orientation_w',
                             'Angular_velocity_x', 'Angular_velocity_y', 'Angular_velocity_z',
                             'Linear_acceleration_x', 'Linear_acceleration_y', 'Linear_acceleration_z'])

        # Open the rosbag file
        with rosbag.Bag('/home/leah/Downloads/walking_dataset.bag', 'r') as bag:
            # Iterate over messages in the IMU topic
            for topic, msg, t in bag.read_messages(topics=['/imu_raw', '/imu_correct']):
                imu_callback(msg, csv_writer)

        rospy.loginfo("IMU data extraction complete. Data saved to imu_data.csv")

if __name__ == '__main__':
    main()
