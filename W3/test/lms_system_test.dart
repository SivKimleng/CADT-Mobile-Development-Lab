import 'package:test/test.dart';
import '../lib/service/lms_system.dart';

void main() {
  
  test('creates a student', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');

    expect(lms.students.first.name, 'ronan');

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.length, 0);
  });

  //task1
  test('adds a course', () {
    final lms = LmsSystem();

    lms.addCourse(
      courseId: 'C1',
      courseName: 'Mobile Development',
    );

    expect(lms.courses.length, 1);
    expect(lms.courses.first.id, 'C1');
    expect(lms.courses.first.name, 'Mobile Development');
  });

  test('removes a course', () {
    final lms = LmsSystem();

    lms.addCourse(
      courseId: 'C1',
      courseName: 'Mobile Development',
    );

    lms.removeCourse(courseId: 'C1');

    expect(lms.courses.length, 0);
  });

  test('rejects duplicate course ID', () {
    final lms = LmsSystem();

    lms.addCourse(
      courseId: 'C1',
      courseName: 'Mobile Development',
    );

    expect(
      () => lms.addCourse(
        courseId: 'C1',
        courseName: 'Web Development',
      ),
      throwsException,
    );

    expect(lms.courses.length, 1);
  });

  test('rejects removal of nonexistent course', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeCourse(courseId: 'C99'),
      throwsException,
    );
  });

//task2
  test('enrolls a student in a course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.studentIds.contains('S1'), true);
  });

  test('rejects enrollment of nonexistent student', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(
      () => lms.enrollStudent(studentId: 'S99', courseId: 'C1'),
      throwsException,
    );
  });

  test('rejects enrollment in nonexistent course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');

    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C99'),
      throwsException,
    );
  });

  test('rejects duplicate enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
      throwsException,
    );

    expect(lms.courses.first.studentIds.length, 1);
  });

  test('student can enroll in multiple courses', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.addCourse(courseId: 'C2', courseName: 'Web Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S1', courseId: 'C2');

    expect(lms.courses[0].studentIds.contains('S1'), true);
    expect(lms.courses[1].studentIds.contains('S1'), true);
  });

  test('course can have multiple students', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addStudent(studentId: 'S2', studentName: 'Dara');

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S2', courseId: 'C1');

    expect(lms.courses.first.studentIds.length, 2);
    expect(lms.courses.first.studentIds.contains('S1'), true);
    expect(lms.courses.first.studentIds.contains('S2'), true);
  });

//task4
  test('removes a student from a course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.discardStudentFromCourse(
      studentId: 'S1',
      courseId: 'C1',
    );

    expect(lms.courses.first.studentIds.contains('S1'), false);
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });

  test('rejects removal of nonexistent enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(
      () => lms.discardStudentFromCourse(
        studentId: 'S1',
        courseId: 'C1',
      ),
      throwsException,
    );
  });

  test('removing a student clears all enrollments', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addStudent(studentId: 'S2', studentName: 'Dara');

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.addCourse(courseId: 'C2', courseName: 'Web Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S1', courseId: 'C2');
    lms.enrollStudent(studentId: 'S2', courseId: 'C1');

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.length, 1);
    expect(lms.courses[0].studentIds.contains('S1'), false);
    expect(lms.courses[1].studentIds.contains('S1'), false);
    expect(lms.courses[0].studentIds.contains('S2'), true);
  });

  test('rejects unenrollment of nonexistent student', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(
      () => lms.discardStudentFromCourse(
        studentId: 'S99',
        courseId: 'C1',
      ),
      throwsException,
    );
  });

 
  test('rejects unenrollment from nonexistent course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');

    expect(
      () => lms.discardStudentFromCourse(
        studentId: 'S1',
        courseId: 'C99',
      ),
      throwsException,
    );
  });
//task4
  test('adds a valid result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    expect(lms.results.length, 1);
    expect(lms.results.first.score, 85);
    expect(lms.results.first.studentId, 'S1');
    expect(lms.results.first.courseId, 'C1');
  });

  test('rejects result for nonexistent student', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(
      () => lms.addResult(
        studentId: 'S99',
        courseId: 'C1',
        score: 85,
      ),
      throwsException,
    );
  });

  test('rejects result for nonexistent course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');

    expect(
      () => lms.addResult(
        studentId: 'S1',
        courseId: 'C99',
        score: 85,
      ),
      throwsException,
    );
  });

  test('rejects result if student is not enrolled', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(
      () => lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 85,
      ),
      throwsException,
    );
  });

  test('rejects invalid score', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(
      () => lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 120,
      ),
      throwsException,
    );

    expect(
      () => lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: -10,
      ),
      throwsException,
    );
  });

  // TASK 4 - Test 6: Reject duplicate result
  test('rejects duplicate result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    expect(
      () => lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 90,
      ),
      throwsException,
    );

    expect(lms.results.length, 1);
    expect(lms.results.first.score, 85);
  });
  
  // TASK 5: Check that a student's result can be removed
  test('removes a student result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    lms.removeResult(
      studentId: 'S1',
      courseId: 'C1',
    );

    expect(lms.results.length, 0);

    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);

    // Student should still be enrolled
    expect(lms.courses.first.studentIds.contains('S1'), true);
  });

  test('rejects removal of nonexistent result', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeResult(
        studentId: 'S99',
        courseId: 'C99',
      ),
      throwsException,
    );
  });

  test('removing a result keeps other results', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addStudent(studentId: 'S2', studentName: 'Dara');

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S2', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    lms.addResult(
      studentId: 'S2',
      courseId: 'C1',
      score: 90,
    );

    lms.removeResult(
      studentId: 'S1',
      courseId: 'C1',
    );

    expect(lms.results.length, 1);
    expect(lms.results.first.studentId, 'S2');
    expect(lms.results.first.score, 90);
   
    expect(lms.students.length, 2);
    expect(lms.courses.length, 1);
  });

  // Removing a result should not affect course enrollment
  test('removing a result keeps course enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 75,
    );
    lms.removeResult(
      studentId: 'S1',
      courseId: 'C1',
    );
    expect(lms.results.length, 0);
    expect(lms.courses.first.studentIds.contains('S1'), true);
  });

}