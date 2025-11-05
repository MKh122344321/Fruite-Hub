import '../../../../core/connection/network_info.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/utils/api_path.dart';

class BestSellingRemoteDataSource {
  final DataBaseService dataBaseService;
  final NetworkInfo networkInfo;
  BestSellingRemoteDataSource({
    required this.dataBaseService,
    required this.networkInfo,
  });

  Future<List<ProductEntity>> getBestSellingProducts() async {
    if (await networkInfo.isConnected == true) {
      try {
        var listOfBestSelling = await dataBaseService.getCollection(
          path: ApiPath.products(),
          queryBuilder: (query) {
            return query.limit(10).orderBy('sellingCount', descending: true);
          },
          builder: (query, documentId) =>
              ProductModel.fromJson(query).toEntity(),
        );
        return listOfBestSelling;
      } catch (e) {
        throw CustomException(
          message:
              'Exeption in getBestSellingProducts : Failed to get products from fierbase',
        );
      }
    } else {
      throw CustomException(message: 'No internet connection');
    }
  }
}
