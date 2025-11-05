import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repo_interface/product_repo_interface.dart';

class GetAllProductsForAppUseCase {
  final ProductRepoInterface repo;

  GetAllProductsForAppUseCase({required this.repo});

  Future<Either<Failure, List<ProductEntity>>> call() => repo.getProducts();
}
