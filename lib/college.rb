require 'csv'
require 'guide'

class College
    def  self.create_college(college_name,college_contact)
       CSV.open("colleges.csv", "a+") do |csv|
       csv << [college_name,college_contact]
       end
    end
end

 	