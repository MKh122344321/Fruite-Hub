import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class ProductRepoInterface {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Stream<Either<Failure, List<ProductEntity>>> searchProduct({
    required String? query,
  });
}
