=begin
  * Name:TableTop
  * Description: Creates a table with specified width & height (xmax,ymax)   
  * Author:Hasani Karunasekara
  * Date:25-08-2014
=end
class TableTop

  attr_reader :xmin,:xmax,:ymin,:ymax
  def initialize(xmax,ymax)
    @xmin=0
    @xmax=xmax.to_i
    @ymin=0
    @ymax=ymax.to_i
  end
end