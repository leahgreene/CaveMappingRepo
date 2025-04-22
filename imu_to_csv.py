#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Imu
import csv

# Define the callback function for the IMU topic
def imu_callback(msg):
    # Open the CSV file in append mode
    with open('home/leah/Downloads/python/imu_data.csv', mode='a') as file:
        writer = csv.writer(file)
        
        # Write data to CSV: timestamp, orientation, angular_velocity, linear_acceleration
        writer.writerow([
            msg.header.stamp.to_sec(),  # timestamp in seconds
            msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w,  # quaternion orientation
            msg.angular_velocity.x, msg.angular_velocity.y, msg.angular_velocity.z,  # angular velocity
            msg.linear_acceleration.x, msg.linear_acceleration.y, msg.linear_acceleration.z  # linear acceleration
        ])

# Initialize the ROS node
rospy.init_node('imu_to_csv', anonymous=True)

# Open the CSV file and write the header (only once)
with open('/home/leah/Downloads/python/imu_data.csv', mode='w') as file:
    writer = csv.writer(file)
    writer.writerow([
        'timestamp', 'orientation_x', 'orientation_y', 'orientation_z', 'orientation_w',
        'angular_velocity_x', 'angular_velocity_y', 'angular_velocity_z',
        'linear_acceleration_x', 'linear_acceleration_y', 'linear_acceleration_z'
    ])

# Subscribe to the /imu/data topic
rospy.Subscriber('/imu/data', Imu, imu_callback)

# Keep the node running to continue receiving messages
rospy.spin()

