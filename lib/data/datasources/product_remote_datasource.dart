import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/products'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal server error');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductByCategory(
      int categoryId) async {
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/products?categoryid=$categoryId'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal server error');
    }
  }
}
