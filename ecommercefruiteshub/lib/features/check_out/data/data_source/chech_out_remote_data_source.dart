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
        await dataBaseService.setData(
          path: ApiPath.addOrders(orderId: Uuid().v4(), userId: getUser().uid),
          data: OrderModel.fromEntity(order).toJson(),
        );
      } catch (e) {
        throw CustomException(message: e.toString());
      }
    } else {
      throw CustomException(message: 'No internet connection');
    }
  }
}
