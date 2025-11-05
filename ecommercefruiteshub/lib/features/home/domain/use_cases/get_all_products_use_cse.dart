import 'package:dartz/dartz.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../home_repo_interface/home_repo_interface.dart';

class GetAllProductsUseCse {
  final HomeRepoInterface repo;

  GetAllProductsUseCse({required this.repo});

  Future<Either<Failure, List<ProductEntity>>> call() => repo.getHomeProducts();
}
