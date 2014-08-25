require_relative "toy_robot"
require_relative "table_top"
require_relative "command_processor"

table=TableTop.new(5,5)
robot=ToyRobot.new(table)

processor=CommandProcessor.new(robot,"input.txt")
processor.simulate

