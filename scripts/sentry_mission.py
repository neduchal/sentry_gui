#!/usr/bin/env python
import time
import datetime
import os.path
import os
import rospy
from sentry_gui.srv import *

class missionCreator():

    def __init__(self):
        rospy.init_node('mission_directory_server')
        print(rospy.get_name() + '/io/root_dir')
        self.root = rospy.get_param(rospy.get_name() + '/io/root_dir', './')
        self.data = rospy.get_param(rospy.get_name() + '/io/data_dir', 'data/')
        # tady vzgenerovat slozku a ulozit
        if not os.path.isdir(self.root):
            os.mkdir(self.root)
        if not os.path.isdir(self.root + self.data):
            os.mkdir(self.root + self.data)
        ts = time.time()
        dt = datetime.datetime.fromtimestamp(ts).strftime("%Y_%m_%d_%H_%M_%S")
        self.mission = self.root + self.data + dt + "/"
        if not os.path.isdir(self.mission):
			os.mkdir(self.mission)
        
        
    def handleRequest(self, req):
        return MissionDirectoryResponse(self.mission)
        
    def run(self):
        s = rospy.Service('mission_directory', MissionDirectory, self.handleRequest)
        rospy.spin()

if __name__ == '__main__':
  m = missionCreator()
  m.run()
  
