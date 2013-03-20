# Robert Mroz          
#!/usr/bin/env ruby
#rescue Exception => e
#end

def get_problem
	puts "Select the form that you would like to convert to slope-intercept form: " #Prompts for choice between two-point and slope point
	puts "1) Two-Point form (you know two points on the line)"
	puts "2) Point-slope form (you know the lines slope and one point)"
	
	loop do
	choice = gets.chomp.to_i
	return choice if [1, 2].include? choice
    STDERR.puts "Incorrect choice: choose either 1 or 2"
  end
end
def get2_pt
	begin
	puts "Enter the x-y coordinates of the first point: " #prompts for first point
	print "x1 = "
	x1 = gets.chomp.to_i
	print "y1 = "
	y1 = gets.chomp.to_i
	puts "Enter the x-y coordinates of the second point: " #prompts for the second point
	print "x2 = "
	x2 = gets.chomp.to_i
	print "y2 = "
	y2 = gets.chomp.to_i
		if (x2 == x1)
			puts "That is a vertical line"
		elsif (y2 == y1)
			puts "That is a horizontal line"
		end
	end while (x1 == x2 || y1 == y2)
	return x1, y1, x2, y2
end
def get_pt_slope
	begin
	puts "Enter the slope: "
	slope = gets.chomp.to_i
	puts "Enter the x-y coordinates of the point: "
	print "x1 = "
	x1 = gets.chomp.to_i
	print "y1 = "
	y1 = gets.chomp.to_i
		if (slope == 0)
			puts "That is a horizontal line"
		end
	end while (slope == 0)
	return slope, x1, y1
end
def slope_intcpt_from2_pt(x1, y1, x2, y2)
	slope = (y2 - y1)/(x2 - x1)
	intercept = y1 - (slope * x1)
	return slope, intercept
end
def intcpt_from_pt_slope(x1, y1, slope)
	intercept = y1 - (slope * x1)
	return intercept
end
def display2_pt(x1, y1, x2, y2)
	puts "Two-point form"
	puts "     (#{y2} - #{y1})"
	puts " m = ---------------"
	puts "     (#{x2} - #{x1})"
end
def display_pt_slope(x1, y1, slope)
	puts "Point-slope form"
	puts " y - #{y1} = #{slope}(x - #{x1})"
end
def display_slope_intcpt(slope, intercept)
	if (intercept < 0.0)
			add_sub = '-'
			intercept = intercept.abs
		else
			add_sub = '+'
		end
	puts "Slope intercept form"
	puts " y = #{slope}x #{add_sub} #{intercept}"
end
begin
	choice = get_problem
	case choice
	when 1
		(x1, y1, x2, y2) = get2_pt
		display2_pt(x1, y1, x2, y2)
		(slope, intercept) = slope_intcpt_from2_pt(x1, y1, x2, y2)
	when 2
		(slope, x1, y1) = get_pt_slope
		display_pt_slope(x1, y1, slope)
		intercept = intcpt_from_pt_slope(x1, y1, slope)
	end
	display_slope_intcpt(slope, intercept)
	begin
	puts "Do another conversion (Y or N): "
	cont = gets.chomp
	end while (cont!='Y'&&cont!='y'&&cont!='N'&&cont!='n')
end while (cont!='N'&&cont!='n')