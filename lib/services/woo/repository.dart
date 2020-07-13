import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/coupon/coupon.dart';
import 'package:r_flutter_woocommerce/models/customers/customer.dart';
import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/generic/params.dart';
import 'package:r_flutter_woocommerce/models/orders/notes/orderNote.dart';
import 'package:r_flutter_woocommerce/models/orders/order.dart';
import 'package:r_flutter_woocommerce/models/orders/refounds/refound.dart';
import 'package:r_flutter_woocommerce/models/payment/paymentGateway.dart';
import 'package:r_flutter_woocommerce/models/products/attribute_terms/attributeTerm.dart';
import 'package:r_flutter_woocommerce/models/products/attributes/attributes.dart';
import 'package:r_flutter_woocommerce/models/products/categories/productCategory.dart';
import 'package:r_flutter_woocommerce/models/products/product.dart';
import 'package:r_flutter_woocommerce/models/products/tag/productTag.dart';
import 'package:r_flutter_woocommerce/models/products/variation/variation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'dart:convert';

typedef TT ItemFromJson<TT>(Map<String, dynamic> json);

class WooSettings {
  String _baseUrl;
  String userKey;
  String userSecret;

  String get token {
    if (userKey != null && userSecret != null) {
      String str = '$userKey:$userSecret';
      String base64 = base64Encode(utf8.encode(str));
      return 'Basic $base64';
      //_urlHeader['Authorization']

    } else {
      return "";
    }
  }

  // String get domain => _baseUrl
  //     .toLowerCase()
  //     .replaceAll("https://", "")
  //     .replaceAll("http://", "");

  WooSettings(
      {@required baseUrl, @required this.userKey, @required this.userSecret}) {
    this._baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
  }
}

class HTTPResponse {
  String content;
  bool sucess;
  int code;
  HTTPResponse(
      {@required this.sucess, @required this.content, @required this.code});
}

class WooResult<T> {
  T result;
  bool sucess;
  String message;

  WooResult({this.result, this.sucess, this.message});
}

class WooRepository<T extends BaseModel> {
  WooSettings settings;
  String endPoint;
  ItemFromJson<T> modelFromJson;
  String mensagem = "";

  String get apiUrl =>
      this.settings._baseUrl + "/wp-json/wc/v3/" + this.endPoint + "";

  WooRepository({
    @required this.endPoint,
    @required this.settings,
    @required this.modelFromJson,
  });

  Future<HTTPResponse> httpGet(String url) async {
    HttpClient httpClient = new HttpClient();
    httpClient..badCertificateCallback = (cert, host, port) => true;
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.headers.set('Authorization', settings.token);

    HttpClientResponse response = await request.close();
    String jsonResponse = await response.transform(utf8.decoder).join();
    httpClient.close();
    return HTTPResponse(
        sucess: response.statusCode >= 200 && response.statusCode < 300,
        content: jsonResponse,
        code: response.statusCode);
  }

  Future<HTTPResponse> httpPost(String url, String data) async {
    var byteData = utf8.encode(data);
    HttpClient httpClient = new HttpClient();
    httpClient..badCertificateCallback = (cert, host, port) => true;
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    //request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(HttpHeaders.acceptHeader, "application/json");
    request.headers.set(HttpHeaders.contentLengthHeader, byteData.length);
    request.headers.set('Authorization', settings.token);

    print("postDATA: " + data);
    request.add(byteData);
    HttpClientResponse response = await request.close();
    String jsonResponse = await response.transform(utf8.decoder).join();
    httpClient.close();
    return HTTPResponse(
        sucess: response.statusCode >= 200 && response.statusCode < 300,
        content: jsonResponse,
        code: response.statusCode);
  }

  Future<HTTPResponse> httpPut(String url, String data) async {
    HttpClient httpClient = new HttpClient();
    httpClient..badCertificateCallback = (cert, host, port) => true;
    HttpClientRequest request = await httpClient.putUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.headers.set('Authorization', settings.token);
    request.add(utf8.encode(data));

    HttpClientResponse response = await request.close();
    String jsonResponse = await response.transform(utf8.decoder).join();
    httpClient.close();
    return HTTPResponse(
        sucess: response.statusCode >= 200 && response.statusCode < 300,
        content: jsonResponse,
        code: response.statusCode);
  }

  Future<HTTPResponse> httpDelete(String url) async {
    HttpClient httpClient = new HttpClient();
    httpClient..badCertificateCallback = (cert, host, port) => true;
    HttpClientRequest request = await httpClient.deleteUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.headers.set('Authorization', settings.token);

    HttpClientResponse response = await request.close();
    String jsonResponse = await response.transform(utf8.decoder).join();
    httpClient.close();
    return HTTPResponse(
        sucess: response.statusCode >= 200 && response.statusCode < 300,
        content: jsonResponse,
        code: response.statusCode);
  }



  Future<WooResult<T>> create(T obj) async {
    String url = apiUrl;
    HTTPResponse response = await httpPost(url, json.encode(obj.toJson()));
    WooResult<T> result;
    if (response.sucess) {
      var r = json.decode(response.content);
      result = new WooResult<T>(
          message: "sucesso", result: modelFromJson(r), sucess: true);
    } else {
      result = new WooResult<T>(message: response.content, sucess: false);
    }
    return result;
  }

  Future<WooResult<T>> retrieve(int id) async {
    String url = apiUrl + "/" + id.toString();

    HTTPResponse response = await httpGet(url);
    WooResult<T> result;
    if (response.sucess) {
      var r = json.decode(response.content);
      result = new WooResult<T>(
          message: "sucesso", result: modelFromJson(r), sucess: true);
    } else {
      result = new WooResult<T>(message: response.content, sucess: false);
    }
    return result;
  }

  Future<WooResult<List<T>>> listPage(ParamsList params) async {
    String url = apiUrl + params.toString();
    HTTPResponse response = await httpGet(url);

    WooResult<List<T>> result;

    if (response.sucess) {
      List<T> resultado = new List<T>();
      var r = json.decode(response.content);
      r.forEach((v) {
        resultado.add(modelFromJson(v));
      });

      result = new WooResult<List<T>>(
          message: "sucesso", result: resultado, sucess: true);
    } else {
      result =
          new WooResult<List<T>>(message: response.content, sucess: false);
    }
    return result;
  }

  Future<WooResult<List<T>>> listAll() async {
    ParamsList params = ParamsList();
    List<T> resultado = new List<T>();
    List<T> listaAux;
    WooResult<List<T>> result;
    bool anyError = false;
    String mensagemErro;
    do {
      listaAux = new List<T>();
      String url = apiUrl + params.toString();

      HTTPResponse response = await httpGet(url);

      if (response.sucess) {
        //print(response.result);
        var r = json.decode(response.content);
        r.forEach((v) {
          listaAux.add(modelFromJson(v));
        });
        resultado.addAll(listaAux);
        params.pageNum++;
      } else {
        anyError = true;
        mensagemErro = response.content;
        break;
      }
    } while (listaAux.length >= params.perPage && !anyError);

    if (!anyError) {
      result = WooResult<List<T>>(
          message: "sucess", result: resultado, sucess: true);
    } else {
      result = WooResult<List<T>>(
          message: mensagemErro, result: resultado, sucess: true);
    }
    return result;
  }

  Future<T> update(int id, T obj) async {
    String url = apiUrl + "/" + id.toString();
    HTTPResponse response = await httpPut(url, json.encode(obj.toJson()));
    if (response.sucess) {
      var r = json.decode(response.content);
      T resultado = modelFromJson(r);
      return resultado;
    } else {
      this.mensagem = response.content;
      return null;
    }
  }

  Future<T> delete(int id, bool force) async {
    String url = apiUrl + "/" + id.toString() + "?force=" + force.toString();
    HTTPResponse response = await httpDelete(url);
    if (response.sucess) {
      var r = json.decode(response.content);
      T resultado = modelFromJson(r);
      return resultado;
    } else {
      this.mensagem = response.content;
      return null;
    }
  }

  Future<BatchGeneric<T>> batchUpdate(BatchGeneric<T> batchObj) async {
    String url = apiUrl;
    HTTPResponse response = await httpPost(url, json.encode(batchObj.toJson()));
    if (response.sucess) {
      var r = json.decode(response.content);
      BatchGeneric<T> resultado = BatchGeneric<T>.fromJson(r);
      return resultado;
    } else {
      this.mensagem = response.content;
      return null;
    }
  }
}

class CustomerRepository extends WooRepository<Customer> {
  CustomerRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "customers",
            modelFromJson: (json) => Customer.fromJson(json));
}

class CouponRepository extends WooRepository<Coupon> {
  CouponRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "coupons",
            modelFromJson: (json) => Coupon.fromJson(json));
}

class OrderRepository extends WooRepository<Order> {
  OrderRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "orders",
            modelFromJson: (json) => Order.fromJson(json));
}

class OrderNoteRepository extends WooRepository<OrderNote> {
  OrderNoteRepository({@required WooSettings settings, @required int orderId})
      : super(
            settings: settings,
            endPoint: "orders/" + orderId.toString() + "/notes",
            modelFromJson: (json) => OrderNote.fromJson(json));
}

class OrderRefoundRepository extends WooRepository<Refound> {
  OrderRefoundRepository(
      {@required WooSettings settings, @required int orderId})
      : super(
            settings: settings,
            endPoint: "orders/" + orderId.toString() + "/notes",
            modelFromJson: (json) => Refound.fromJson(json));
}

class ProductRepository extends WooRepository<Product> {
  ProductRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "products",
            modelFromJson: (json) => Product.fromJson(json));
}

class ProductVariationRepository extends WooRepository<Variation> {
  ProductVariationRepository(
      {@required WooSettings settings, @required int productId})
      : super(
            settings: settings,
            endPoint: "products/" + productId.toString() + "/variations",
            modelFromJson: (json) => Variation.fromJson(json));
}

class ProductAttributeRepository extends WooRepository<ProductAttribute> {
  ProductAttributeRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "products/attributes",
            modelFromJson: (json) => ProductAttribute.fromJson(json));
}

class ProductAttributeTermsRepository extends WooRepository<AttributeTerms> {
  ProductAttributeTermsRepository(
      {@required WooSettings settings, int attributeId})
      : super(
            settings: settings,
            endPoint:
                "products/attributes/" + attributeId.toString() + "/terms",
            modelFromJson: (json) => AttributeTerms.fromJson(json));
}

class ProductCategoryRepository extends WooRepository<ProductCategory> {
  ProductCategoryRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "products/categories",
            modelFromJson: (json) => ProductCategory.fromJson(json));
}

class ProductTagRepository extends WooRepository<Tag> {
  ProductTagRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "products/tags",
            modelFromJson: (json) => Tag.fromJson(json));
}

class PaymentGatewayRepository extends WooRepository<PaymentGateway> {
  PaymentGatewayRepository({@required WooSettings settings})
      : super(
            settings: settings,
            endPoint: "payment_gateways",
            modelFromJson: (json) => PaymentGateway.fromJson(json));
}
