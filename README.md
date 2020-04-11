# Admittance - Control (Human - Quadcopter)
This project analyzes the suitability of applying an Admittance Control strategy for the interaction between a Human and a Quadcopter. This strategy allows users to define a desired behaviour to the robot when interaction happens. <br />

The forces applied to the system are estimated from the position and orientation information coming from the vehicles sensors, inputed to the Admittance Controller, that will respectively modify the reference trajectory to accommodate this force. This trajectory is then tracked by an underlying Position and Attitude Controller that is built with a Backstepping approach for the specific case of near-hover conditions.  <br />

The strategy used is followed by simulations that show the method is applicable for such task. <br/>

![Block Diagram](images/Full_Scheme.png)
![Regulation Problem](images/Reg.jpg)
![Trajectory Tracking](images/Traj_Track.jpg)
![Applied Force Without Stiffness](images/Force_NoStiff.jpg)
![Applied Force With Stiffness](images/Force_Stiff.jpg)
![Applied Force and Trajectory Tracking With Stiffness](images/Force_Traj_Stiff.jpg)
