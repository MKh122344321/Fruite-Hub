import 'package:uuid/uuid.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/entities/order_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helper_functions/get_user.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/utils/api_path.dart';

class CheckOutRemoteDataSource {
  final DataBaseService dataBaseService;
  final NetworkInfo networkInfo;
  CheckOutRemoteDataSource({
    required this.networkInfo,
    required this.dataBaseService,
  });

  Future<void> addOrder({required OrderInputEntity order}) async {
    if (await networkInfo.isConnected == true) {
      try {
        final currentDocumentOrderId = Uuid().v1();
        await dataBaseService.setData(
          path: ApiPath.addOrders(
            userId: getUser().uid,
            orderId: currentDocumentOrderId,
          ),
          data: (OrderModel.fromEntity(
            order,
          )).toJson(currentDocumentOrderId: currentDocumentOrderId),
        );
      } catch (e) {
        throw CustomException(message: e.toString());
      }
    } else {
      throw CustomException(message: 'No internet connection');
    }
  }
}
