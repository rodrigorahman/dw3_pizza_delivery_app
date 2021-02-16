import 'package:dw3_pizza_delivery_app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/models/user_model.dart';
import 'package:dw3_pizza_delivery_app/view_models/register_user_input_model.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await restClient.post(
      '/user/auth',
      {'email': email, 'password': password},
      decoder: (resp){
        if(resp != ''){
          return UserModel.fromMap(resp);
        }
      },
    );

    if(response.hasError){
      String message = 'Erro ao authenticar usuário';
      if(response.statusCode == 403){
        message = 'Usuário ou senha inválidos';
      }
      throw RestClientException(message);
    }
    
    return response.body;
  }

  Future<void> saveUser(RegisterUserInputModel model) async {
    final response = await restClient.post('/user/', {
      'name': model.name,
      'email': model.email,
      'password': model.password,
    });

    if(response.hasError){
      throw RestClientException('Erro ao registrar usuário');
    }
  }
}
