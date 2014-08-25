require File.expand_path(File.dirname(__FILE__) + "/../lib/toy_robot")
require File.expand_path(File.dirname(__FILE__) + "/../lib/table_top")
require 'test/unit'

class TestToyRobot < Test::Unit::TestCase

  def test_Youtpfboundplacement
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    robot.place(0,6,"NORTH")
    assert_equal(-1,robot.x && robot.y,"Robot Placed Out of bounds in X axis" )

  end
  
  def test_Xoutofboundplacement
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    robot.place(6,0,"NORTH")
    assert_equal(-1,robot.x && robot.y,"Robot Placed Out of bounds in Y axis" )

  end
  
  def test_movewithinbounds
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    robot.place(0,2,"NORTH")
    robot.move
    robot.move
    robot.turn("RIGHT")
    robot.move
    robot.turn("LEFT")
    robot.move
    robot.move
    
    assert_equal("Output:1,5,NORTH",robot.report,"Robot Placed Out of bounds" )

  end
  
  def test_repeatedplacecommand
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    robot.place(0,0,"NORTH")
    robot.move
    robot.place(5,5,"SOUTH")
    assert_equal("Output:5,5,SOUTH",robot.report,"Robot Placed Out of bounds" )

  end
  
end