import 'package:dartz/dartz.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepoInterface {
  Future<Either<Failure, List<ProductEntity>>> getHomeProducts();
}
