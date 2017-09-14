require 'csv'
require 'guide'

class Teacher
   def self.create_teacher(teacher_name,college_name)
     CSV.open('teachers.csv','a+') do |csv|
         csv << [teacher_name,college_name]
     end
   end
end
  
