import '../model/student.dart';
import '../model/course.dart';
import '../model/course_result.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  // Add a new student to the LMS
  void addStudent({
    required String studentId,
    required String studentName,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student != null) {
      throw Exception('Student $studentId already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  // Remove a student from the LMS
  void removeStudent({required String studentId}) {
    // Make sure the student exists
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    // Remove the student from all courses
    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }

    // Delete all results belonging to the student
    results.removeWhere((result) {
      return result.studentId == studentId;
    });

    // Finally, remove the student from the LMS
    students.removeWhere((student) {
      return student.id == studentId;
    });
  }

  // Look for a student using their ID
  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null;
  }

  // TASK 1: Add a new course
  void addCourse({
    required String courseId,
    required String courseName,
  }) {
    Course? course = _findCourseOrNull(courseId);

    // Don't allow courses with the same ID
    if (course != null) {
      throw Exception('Course $courseId already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  // task 1: remove a course
  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    results.removeWhere((result) {
      return result.courseId == courseId;
    });

    courses.removeWhere((course) {
      return course.id == courseId;
    });
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  // task 2: enroll a student in a course
  void enrollStudent({
    required String studentId,
    required String courseId,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    if (course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is already enrolled in course $courseId');
    }
    course.studentIds.add(studentId);
  }

  // task 3: Remove a student from a course
  void discardStudentFromCourse({
    required String studentId,
    required String courseId,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    bool isEnrolled = course.studentIds.contains(studentId);
    if (isEnrolled == false) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }
    course.studentIds.remove(studentId);
    results.removeWhere((result) {
      return result.studentId == studentId &&
          result.courseId == courseId;
    });
  }

  // task4: add a student's result for a course
  void addResult({
    required String studentId,
    required String courseId,
    required double score,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    bool isEnrolled = course.studentIds.contains(studentId);

    if (isEnrolled == false) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }
    if (score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }
    for (CourseResult result in results) {
      if (result.studentId == studentId &&
          result.courseId == courseId) {
        throw Exception(
          'Result already exists for student $studentId in course $courseId',
        );
      }
    }

    results.add(
      CourseResult(
        studentId: studentId,
        courseId: courseId,
        score: score,
      ),
    );
  }

  
  // TASK 5: Remove a student's result from a course
  void removeResult({
    required String studentId,
    required String courseId,
  }) {
    bool resultExists = false;

    for (CourseResult result in results) {
      if (result.studentId == studentId &&
          result.courseId == courseId) {
        resultExists = true;
        break;
      }
    }

    if (resultExists == false) {
      throw Exception(
        'Result for student $studentId in course $courseId not found',
      );
    }

    results.removeWhere((result) {
      return result.studentId == studentId &&
          result.courseId == courseId;
    });
  }

}
