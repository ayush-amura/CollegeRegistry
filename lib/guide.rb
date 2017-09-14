require 'college'
require 'teacher'
require 'student'
require 'course'

$prompt = '> '

class Guide

	def launch
		introduction  
	  conclusion	
	end

	def introduction
		puts"==============================================="
		puts "-----------College-Registry-System------------"
		puts"==============================================="
		puts " "
		menu
	end

	def menu 
		puts "1.Add College"
		puts "2.Add Courses"
		puts "3.Add Student"
		puts "4.Add Teacher"
		puts "5.Find College"
		puts "6.Find Course"
		puts "7.Find Student"
		puts "8.Find Teacher"
		flow_control
	end
		
	def flow_control
		print "Enter Your choice #{$prompt}"
		choice=gets.chomp
		case choice
		when "1"
  		college_details
  	when "2"
  		course_details
  	when "3"
  		student_detail
  	when "4"
  		teacher_detail	
  	when "5"
 			search_college 	
  	when "6"
  		search_course
  	when "7"
  		search_student
  	when "8"
  		search_teacher
  	else
    	puts "Choose appropriate"
    end
  end
       	       
 	def college_details
		puts 'Enter College Details :'
  	puts 'Enter Name :'
  	college_name = gets.chomp
  	puts 'Enter Contact number'
  	contact_no = gets.chomp
  	college=College.create_college(college_name,contact_no)
  end
  def course_details
 	  puts 'Enter Course Details'
 	  puts 'Enter Course Name :'
  	course_name = gets.chomp
  	puts 'Enter College name'
  	college_name = gets.chomp
  	puts 'Enter Teachers name'
  	teacher_name = gets.chomp
  	course=Course.create_course(course_name,college_name,teacher_name)
  end
  def student_detail
  	puts "Enter Student's details"
    puts "Enter Name #{$prompt}"
    student_name = gets.chomp
    puts "Enter contact_no #{$prompt}"
    student_contact = gets.chomp
    puts "Course name #{$prompt}"
    course = gets.chomp
    puts "College Name"
    college_name = gets.chomp 
    student=Student.create_student(student_name,student_contact,course,college_name)
  end
  def teacher_detail
		puts "Enter Teachers details"
    puts "Enter Name #{$prompt}"
    teacher_name = gets.chomp
    puts "College Name"
    college_name = gets.chomp 
    teacher=Teacher.create_teacher(teacher_name,college_name)
  end
  
  def search_college
  	puts "enter the name of the college: "
    college = gets.chomp
    CSV.read('colleges.csv').each do |college1|
      if( college1[0].include? college )
        puts"Available Courses::"
        CSV.read('courses.csv').each do |row|
          if(row[1].include? college)
            puts "course: "+row[0]
          else
     			  puts "No Courses Available"
   		    end
   	    end
   		else
      puts "College not found"
      end
 	  end
  end

  def search_course
  	puts 'Enter Name of Course:'
    course = gets.chomp
    puts "Course Name: "+course
    CSV.read('courses.csv').each do |course1|
      if(course1[0].include? course)
        puts "College:" +course1[1]+ " Students ::" +course1[2]
      end
    end 
  end
	
	def search_student
		puts "Enter The Student Name: "
    student = gets.chomp
    puts "Student Name: "+student
    CSV.read('students.csv').each do |row|
      if(row[0].include? student)
        flag=true;
        puts "Student Details::"
        puts "Name: "+row[0]
        puts "ContactNo: "+row[1]
        puts "Course:  "+row[2]
        puts "College: "+row[3]
      else
        puts"Student not found"
      end
    end
	end

	def search_teacher
    puts "Enter The Teacher Name: "
    teacher = gets.chomp
    CSV.read('teachers.csv').each do |row|
      if(row[0].include? teacher)
        puts "Teacher's Details::"
        puts "Name: "+row[0]
        puts "College: "+row[1]
      else
        puts "Teacher not found"
      end
    end
	end

	def conclusion
		
    puts"Enter y to continues"
    menu if(gets.chomp.upcase=='Y')
    puts ""
    puts'ThankYou' 
	end
end	
		



