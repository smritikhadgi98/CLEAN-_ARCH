import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/data_source/batch_remote_datasource.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/batch_repository.dart';
import 'package:student_management_starter/features/course/data/data_source/local/course_remote_datasource.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/course_repository.dart';

final courseRemoteRepository = Provider<ICourseRepository>((ref) {
  return CourseRemoteRepoImpl(
    courseRemoteDataSource: ref.read(courseRemoteDataSourceProvider),
  );
});

class CourseRemoteRepoImpl implements ICourseRepository{
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRemoteRepoImpl ({
    required this.courseRemoteDataSource
  });

  @override
  Future<Either<Failure,bool>> addCourse(CourseEntity course){
    return courseRemoteDataSource.addCourse(course);
  }

  @override
  Future<Either<Failure ,List<CourseEntity>>> getAllCourses(){
    return courseRemoteDataSource.getAllCourses();
  }
}