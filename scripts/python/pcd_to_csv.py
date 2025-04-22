import rospy
import csv
from sensor_msgs.msg import Imu

# Callback function to process IMU data
def imu_callback(data):
    with open('/path/to/imu_data.csv', mode='a') as file:
        writer = csv.writer(file)
        # Write IMU timestamp and orientation, angular velocity, and linear acceleration
        writer.writerow([data.header.stamp.to_sec(), data.orientation.x, data.orientation.y, data.orientation.z, data.orientation.w,
                         data.angular_velocity.x, data.angular_velocity.y, data.angular_velocity.z,
                         data.linear_acceleration.x, data.linear_acceleration.y, data.linear_acceleration.z])

# Initialize the ROS node
rospy.init_node('imu_data_extractor')

# Subscribe to the IMU topic
rospy.Subscriber('/imu/data', Imu, imu_callback)

# Keep the script running to receive and process IMU data
rospy.spin()