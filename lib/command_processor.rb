=begin
  * Name:CommandProcessor
  * Description: Read a given file for input, validates if the commands are valid & simulates the movement of toy Robot  
  * Author:Hasani Karunasekara
  * Date:25-08-2014
=end
class CommandProcessor
  def initialize(robot,inputfile)
    @robot=robot
    @filename=inputfile
    @validinput=[/^\bPLACE\b\s\d,\d,\b(NORTH|SOUTH|EAST|WEST)\b$/,/MOVE$/,/LEFT$/,/RIGHT$/,/REPORT$/]
  end

  def getvalidcommands
    commands=Array.new
    count=0
    aFile = File.new(@filename, "r")
    x=Regexp.union(@validinput)
    if aFile
      aFile.each_line do |line|
        line=line.strip.to_s
        #all commands from and after 1st PLACE goes in
        if line.match(x)
          #check for only PLACE
          if line=~@validinput[0] || !commands.empty?
          commands[count]=line
          count +=1
          end
        else

        #puts 'Invalid command'
        end
      end
    aFile.close
    commands
    end
  end

  def simulate
    commands=getvalidcommands
    if commands.size>0

      commands.each {
      |command|

        case command
        when @validinput[0]
          puts command
          x=command[6].to_i;
          y=command[8].to_i;
          length=command.length;
          direction=command[10..length-1];
          @robot.place(x,y,direction)
        when @validinput[1]
          puts command
          @robot.move
        when @validinput[2],@validinput[3]
          puts command
          @robot.turn(command)
        when @validinput[4]
          puts command
          puts @robot.report
        end
      }
    end
  end

end
