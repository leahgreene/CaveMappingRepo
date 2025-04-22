#!/usr/bin/env python

import rospy
import pandas as pd
from sensor_msgs.msg import Imu
from std_msgs.msg import Header
from tf.transformations import quaternion_from_euler
import math

def publish_imu(csv_file):
    df = pd.read_csv(csv_file)

    pub = rospy.Publisher('/imu/data', Imu, queue_size=100)
    rospy.init_node('csv_imu_publisher', anonymous=True)

    rate = rospy.Rate(100)  # Hz

    for _, row in df.iterrows():
        imu = Imu()
        imu.header = Header()
        imu.header.stamp = rospy.Time.from_sec(float(row["GPS Time"]))
        imu.header.frame_id = "imu_link"

        # Convert Roll, Pitch, Yaw (degrees) to quaternion
        roll = math.radians(row["Roll"])
        pitch = math.radians(row["Pitch"])
        yaw = math.radians(row["Yaw"])
        q = quaternion_from_euler(roll, pitch, yaw)

        imu.orientation.x = q[0]
        imu.orientation.y = q[1]
        imu.orientation.z = q[2]
        imu.orientation.w = q[3]

        pub.publish(imu)
        rate.sleep()

if __name__ == '__main__':
    try:
        csv_file_path = rospy.get_param("~csv_file", "/home/leah/Downloads/Testing/outside1_converted2.csv")
        publish_imu(csv_file_path)
    except rospy.ROSInterruptException:
        pass
