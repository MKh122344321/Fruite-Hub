import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../services/shared_preferences_singleton.dart';
import '../utils/constants.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(
    jsonDecode(jsonString),
  ).copyWith(profilePicture: FirebaseAuth.instance.currentUser?.photoURL ?? "");
  return userEntity;
}
