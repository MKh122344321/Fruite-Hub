import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class AddProductRepoInterface {
  Future<Either<Failure, void>> addProduct({required ProductEntity product});
}
