FROM osrf/ros:noetic-desktop-full

ENV TURTLEBOT3_MODEL=burger

WORKDIR /ros

ADD ./src /ros/src

RUN /bin/bash -c "apt update &&\
                  apt install -y vim git-all net-tools iputils-ping htop &&\
                  source /opt/ros/noetic/setup.bash &&\
                  rosdep install --from-paths src --ignore-src -r -y &&\
                  catkin_make -DCMAKE_BUILD_TYPE=Release -j4 &&\
                  echo 'source devel/setup.bash' >> ~/.bashrc &&\
                  source ~/.bashrc"

CMD /bin/bash



