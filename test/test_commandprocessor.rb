require File.expand_path(File.dirname(__FILE__) + "/../lib/toy_robot")
require File.expand_path(File.dirname(__FILE__) + "/../lib/table_top")
require File.expand_path(File.dirname(__FILE__) + "/../lib/command_processor")
require 'test/unit'

class TestCommandProcessor < Test::Unit::TestCase
  def test_validcommands
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    cp=CommandProcessor.new(robot,"testvalidcommands_input.txt")
    assert_equal([],cp.getvalidcommands)
  end
  
    def test_validcommands2
    table=TableTop.new(5,5)
    robot=ToyRobot.new(table)
    cp=CommandProcessor.new(robot,"testvalidcommands2_input.txt")
    assert_equal(["PLACE 0,0,NORTH","REPORT"],cp.getvalidcommands)
  end
  
end