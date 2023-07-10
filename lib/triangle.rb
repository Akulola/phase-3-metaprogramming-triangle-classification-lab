class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sides_positive = side1 > 0 && side2 > 0 && side3 > 0
    triangle_inequality = (side1 + side2 > side3) && (side2 + side3 > side1) && (side3 + side1 > side2)
  
    case
    when sides_positive && triangle_inequality
      case
      when side1 == side2 && side2 == side3
        :equilateral
      when side1 == side2 || side2 == side3 || side1 == side3
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end
  

  class TriangleError < StandardError
    def message
      puts "This is an invalid triangle"
    end
  end
end
