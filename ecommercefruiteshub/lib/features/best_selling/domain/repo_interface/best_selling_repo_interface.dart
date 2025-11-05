import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class BestSellingRepoInterface {
  Future<Either<Failure, List<ProductEntity>>> getBestSelling();
}
