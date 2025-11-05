import 'package:dartz/dartz.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/product_remote_data_source.dart';
import '../../domain/repo_interface/product_repo_interface.dart';

class ProductsRepoImpl implements ProductRepoInterface {
  final ProductRemoteDataSource productsRemoteDatqaSource;
  ProductsRepoImpl({required this.productsRemoteDatqaSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final productsList = await productsRemoteDatqaSource.getProducts();
      return right(productsList);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> searchProduct({
    required String? query,
  }) async* {
    try {
      await for (final productsList in productsRemoteDatqaSource.searchProducts(
        searchLetters: query,
      )) {
        yield right(productsList);
      }
      // yield* productsRemoteDatqaSource.searchProducts(searchLetters: query);
    } on CustomException catch (e) {
      yield left(ServerFailure(e.message));
    }
  }
}
