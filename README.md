# Mars tech test

A tech test to model the controlling of a robot on Mars, in Ruby.

### Approach
To get a sense of the solution space, I started by sketching out the various components that were mentioned in the brief: a planet that had a grid, a robot and a control system. Based on that I designed a solution based on four classes: Planet, Grid, Robot and MissionControl.

I used the examples provided in the brief to structure my feature test - where each test was based on one 'mission'. With the feature test set up, it was simply a matter of following a TDD approach with unit tests to flesh out the remaining functionality.

In order to remain open for additional instructions to the robot, I choose to use the ```send``` method, as a way to act on the various types of instructions the robot would receive. 

The main challenge was figuring out how and which object was responsible for leaving and capturing the 'robot-trace'.

### Testing
RSpec is the testing framework.
- clone this repo
- go into the root of the folder
- run ```rspec```


### Code example
```
mars = Planet.new("5 3", Grid)
mission_control = MissionControl.new(mars, Robot)

robot = mission_control.launch_robot(mars,'3 2 N')
mission_control.send('FRRFLLFFRRFLL')
mission_control.request_status(robot2)
--> "3 3 N LOST"

robot2 = mission_control.launch_robot(mars,'0 3 W')
mission_control.send('LLFFFLFLFL')
mission_control.request_status(robot2)
--> "2 3 S"
```
