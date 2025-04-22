#!/usr/bin/env python

import rospy
import pandas as pd
from sensor_msgs.msg import Imu
from std_msgs.msg import Header
from tf.transformations import quaternion_from_euler
import math

def publish_imu(csv_file):
    df = pd.read_csv(csv_file, delim_whitespace=True)

    pub = rospy.Publisher('/imu/data', Imu, queue_size=100)
    rospy.init_node('csv_imu_publisher', anonymous=True)

    rate = rospy.Rate(100)  # Adjust based on your sampling rate

    for _, row in df.iterrows():
        imu_msg = Imu()
        imu_msg.header = Header()
        imu_msg.header.stamp = rospy.Time.from_sec(float(row["GPS"]))
        imu_msg.header.frame_id = "imu_link"

        roll = math.radians(row["Roll"])
        pitch = math.radians(row["Pitch"])
        yaw = math.radians(row["Yaw"])

        q = quaternion_from_euler(roll, pitch, yaw)
        imu_msg.orientation.x = q[0]
        imu_msg.orientation.y = q[1]
        imu_msg.orientation.z = q[2]
        imu_msg.orientation.w = q[3]

        pub.publish(imu_msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        csv_path = rospy.get_param("~csv_file", "/path/to/your/ins.csv")
        publish_imu(csv_path)
    except rospy.ROSInterruptException:
        pass
