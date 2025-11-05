import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repo_interface/best_selling_repo_interface.dart';

class GetBestSellingProductsUseCase {
  final BestSellingRepoInterface repo;
  GetBestSellingProductsUseCase({required this.repo});
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return repo.getBestSelling();
  }
}
