import '../../../../core/connection/network_info.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/utils/api_path.dart';

class ProductRemoteDataSource {
  final DataBaseService dataBaseService;
  final NetworkInfo networkInfo;
  ProductRemoteDataSource({
    required this.networkInfo,
    required this.dataBaseService,
  });

  Future<List<ProductEntity>> getProducts() async {
    if (await networkInfo.isConnected == true) {
      try {
        final allProductsList = await dataBaseService.getCollection(
          path: ApiPath.products(),
          builder: (query, documentId) =>
              ProductModel.fromJson(query).toEntity(),
        );

        return allProductsList;
      } catch (e) {
        throw CustomException(
          message:
              'Exeption in getAllProducts : Failed to get products from fierbase',
        );
      }
    } else {
      throw CustomException(message: 'No internet connection');
    }
  }

  Stream<List<ProductEntity>> searchProducts({
    required String? searchLetters,
  }) async* {
    if (await networkInfo.isConnected == true) {
      try {
        await for (final allProductsList in dataBaseService.collectionStream(
          queryBuilder: (query) {
            return query.where('name', isGreaterThanOrEqualTo: searchLetters);
          },
          builder: (query, documentId) =>
              ProductModel.fromJson(query).toEntity(),

          path: ApiPath.products(),
        )) {
          yield allProductsList;
        }
      } catch (e) {
        throw CustomException(
          message:
              'Exeption in getAllProducts : Failed to get products from fierbase',
        );
      }
    } else {
      throw CustomException(message: 'No internet connection');
    }
  }
}
