import 'package:dw3_pizza_delivery_app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/models/order_model.dart';
import 'package:dw3_pizza_delivery_app/view_models/checkout_input_model.dart';

class OrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);

  Future<List<OrderModel>> findMyOrders(int userId) async {
    final response = await _restClient.get('/order/user/$userId', decoder: (resp) {
      if (resp is List) {
        return resp.map<OrderModel>((o) => OrderModel.fromMap(o)).toList();
      }
      return null;
    });

    if (response.hasError) {
      print(response.statusText);
      throw RestClientException('Erro ao buscar pedidos');
    }

    return response.body;
  }

  Future<void> saveOrder(CheckoutInputModel model) async {
    switch (model.paymentType) {
      case 'Cartão de Crédito':
        model.paymentType = 'credito';
        break;
      case 'Cartão de Débito':
        model.paymentType = 'debito';
        break;
      case 'Dinheiro':
        model.paymentType = 'dinheiro';
        break;
    }
    final response = await _restClient.post('/order/', model.toMap());

    if (response.hasError) {
      print(response.statusText);
      throw RestClientException('Erro ao registrar pedido');
    }
  }
}
