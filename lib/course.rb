require 'guide'
require 'csv'

class Course
	def self.create_course(course_name,college_name,teacher_name)
  	CSV.open("courses.csv", "a+") do |csv|
    	csv << [course_name,college_name,teacher_name	]
    end
  end
end