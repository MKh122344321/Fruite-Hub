import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/home_repo_interface/home_repo_interface.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepoInterface {
  final HomeRemoteDataSource homeDataSource;
  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getHomeProducts() async {
    try {
      final result = await homeDataSource.getAllProducts();
      return Right(result);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
