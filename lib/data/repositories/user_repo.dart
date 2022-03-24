import 'package:app/application/config/config.dart';
import 'package:app/data/entities/user_dto.dart';
import 'package:app/data/services/local_storage.dart';
import 'package:app/data/services/rest_api_service.dart';
import 'package:app/models/user_model.dart';

class UserRepository {
  final RestApiService _dataBaseService = RestApiService();

  Future<String> login(UserModel userModel) async {
    Map<String, dynamic> response = {};
    try {
      response = await _dataBaseService.postRequest(
        Endpoints.login,
        UserLogin.loginBody(userModel),
      );
      UserDto userDto = UserDto.fromMap(response);
      if (userDto.status == true) {
        await LocalStorage().setToken(userDto.accessToken);
        return Message.loginSuccess;
      } else {
        return userDto.message;
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
