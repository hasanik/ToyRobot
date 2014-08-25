=begin
  * Name:ToyRobot
  * Description: Moves across a pre created table top within boundries & reports position  
  * Author:Hasani Karunasekara
  * Date:25-08-2014
=end
class ToyRobot
  attr_reader :isplaced,:x,:y
  def initialize(table)
    @table=table
    @isplaced=false
    @alldirections=["NORTH","EAST","SOUTH","WEST"]
    @direction_index=-1;
    @x=-1;
    @y=-1;

  end

  def place(x,y,direction)
    if x.between?(@table.xmin,@table.xmax) && y.between?(@table.ymin,@table.ymax)
      @x=x.to_i
      @y=y.to_i
      @isplaced=true
      @direction_index=@alldirections.index(direction).to_i
    end
  end

  def getdirection
    @direction=@alldirections[@direction_index]
  end

  def report
    if isplaced
    @dir=getdirection.to_s
    "Output:#@x,#@y,#@dir"
    else
    "Output:Robot Not Placed on Table"  
    end
  end

  def move
    if isplaced
      if getdirection=="NORTH" && @y<@table.ymax
        @y+=1
      elsif getdirection=="SOUTH" && @y>@table.ymin
        @y-=1
      elsif getdirection=="EAST" && @x<@table.xmax
        @x+=1
      elsif getdirection=="WEST" && @x>@table.xmin
        @x-=1
      end
    end
  end

  def turn(side)

    if isplaced
      numberofdirections=@alldirections.count.to_i
      if side=="RIGHT"
        if @direction_index<numberofdirections-1
          @direction_index+=1
        else
          @direction_index=0
        end
      elsif side=="LEFT"
        if @direction_index>0
          @direction_index-=1
        else
          @direction_index=numberofdirections-1
        end
      end
    end
  end

end
