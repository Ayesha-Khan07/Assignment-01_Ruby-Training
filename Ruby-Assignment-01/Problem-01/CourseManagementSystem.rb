''' Problem statement: 
implement a simple online course management system. It defines Course, Instructor, and Student classes that allow students to enroll or drop courses, instructors to add assignments, and courses to manage capacity and enrolled students.
'''

class Course
  attr_accessor :title, :description, :capacity, :enrolled_students
  attr_reader :assignments, :instructor 
  
  def initialize(title, desc, capacity, inst)
    @title = title
    @description = desc
    @capacity = capacity
    @instructor = inst
    @enrolled_students = []
    @assignments = []
  end

  def to_s
  "The course details are:\n" \
  "Title: #{@title}\n" \
  "Description: #{@description}\n" \
  "Capacity: #{@capacity}\n" \
  "Enrolled Students: #{@enrolled_students.size}\n"
  end

 ''' def to_s
    "The course details are: " + "\n"
    "Title: #{@title} " + "\n"
    "Description: #{@description}" + "\n"
    "Capacity: #{@capacity}" + "\n"
    "Enrolled Students: #{@enrolled_students.size}" + "\n"
  end '''

  private
  def has_already_enrolled(stdObj)
    @enrolled_students.include?(stdObj)
  end

  def already_add_assignment(assign)
    @assignments.include?(assign)
  end

  public
  def capacity
    @capacity
  end

  def enrolled_students
    @enrolled_students
  end

  def enroll_Students(studentObj)
    if @enrolled_students.size >= @capacity
      puts "Can not enroll #{studentObj.student_name} as course #{@title} is full"

    elsif has_already_enrolled(studentObj)
      puts "#{studentObj.student_name} has already enrolled in course #{@title}."

    else
      @enrolled_students << studentObj
      puts "#{studentObj.student_name} enrolled in course #{@title}.."
    end
  end

  def drop_student(stdObj)
    if @enrolled_students.size <= 0
      puts "No one enroll in course #{@title} till now"
    
    elsif has_already_enrolled(stdObj)
      @enrolled_students.delete(stdObj)
      puts "#{stdObj.student_name} dropped from course #{@title}"
    
    else
      puts "Student is not enrolled in course #{@title}"
    end
  end

  def add_assignment(assignment)
    if already_add_assignment(assignment)
      puts "Course #{title} assignment is already uploaded."
    
    else
      @assignments << assignment
      puts "#{assignment} addedd successfully in course #{@title}."
    end
  end
end

'''Instructor class implementation'''

class Instructor  
  attr_accessor :instructor_name

  def initialize(name)
    @instructor_name = name
  end

  def add_assignment_of_course(course, assignment)
    course.add_assignment(assignment)
  end
end


'''Student class implementation'''

class Student 
  attr_accessor :student_name

  def initialize(name)
    @student_name = name
  end

  def enroll_in_course(course)
    course.enroll_Students(self)
  end

  def drop_from_course(course)
    course.drop_student(self)
  end
end

''' ---------- main -------'''

instructor_1 = Instructor.new("Saam")
instructor_2 = Instructor.new("khan")

course_1 = Course.new("Ruby", "Learn Ruby", 2, instructor_1)
course_2 = Course.new("Rails", "Learn Rails", 2, instructor_2)

student_1 = Student.new("ayesha")
student_2 = Student.new("elaf")
student_3 = Student.new("izal")

''' enroll stds '''

student_1.enroll_in_course(course_1)
student_2.enroll_in_course(course_1)
student_3.enroll_in_course(course_1)   # not enrolled -> course_1 capacity is 2

#drop student 2 so that std 3 add in course 1
puts
student_2.drop_from_course(course_1)
student_2.enroll_in_course(course_2)
student_3.enroll_in_course(course_1)

''' add assignment in course 1 '''
puts
instructor_1.add_assignment_of_course(course_1, "This is the first RUBY assignment")

#show course info

puts "\n" + "course 2 info"
puts "\n" + course_1.to_s
if course_1.capacity == course_1.enrolled_students.size
  puts
  puts "course 1 is full........"
end

puts "\n" + "course 2 info"
puts course_2.to_s
if course_2.capacity == course_2.enrolled_students.size
  puts
  puts "course 2 is full........"
else
  puts 
  puts "course 2 is not full - you can enroll students in course 2"
end



