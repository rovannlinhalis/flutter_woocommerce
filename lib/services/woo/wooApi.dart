import 'package:meta/meta.dart';
import 'package:r_flutter_woocommerce/services/woo/repository.dart';

class WooCommerceApi {
  // WooSettings settings = WooSettings(
  //     baseUrl: "https://cardapio.rovann.com.br",
  //     userKey: "ck_16238fba86074a3cc176afe91b2be8a68bd4fd13",
  //     userSecret: "cs_b84084d728af36610ba1073ec591c0aa4af1ed8c");

  WooSettings settings;
  
  ProductRepository products;
  CustomerRepository customers;
  OrderRepository orders;
  CouponRepository coupons;
  ProductAttributeRepository productAttributes;
  ProductCategoryRepository productCategories;
  ProductTagRepository productTags;
  PaymentGatewayRepository paymentGateways;

  WooCommerceApi({@required WooSettings wooSettings} ) {
    this.settings = wooSettings;
    customers = CustomerRepository(settings: settings);
    orders = OrderRepository(settings: settings);
    coupons = CouponRepository(settings: settings);
    products = ProductRepository(settings: settings);
    productAttributes = ProductAttributeRepository(settings: settings);
    productCategories = ProductCategoryRepository(settings: settings);
    productTags = ProductTagRepository(settings: settings);
    paymentGateways = PaymentGatewayRepository(settings: settings);
  }

  OrderNoteRepository orderNotes(int orderId) {
    return OrderNoteRepository(orderId: orderId, settings: settings);
  }

  OrderRefoundRepository orderRefounds(int orderId) {
    return OrderRefoundRepository(orderId: orderId, settings: settings);
  }

  ProductVariationRepository productVariations(int productId) {
    return ProductVariationRepository(productId: productId, settings: settings);
  }

  ProductAttributeTermsRepository productAttributeTerms(int attributeId) {
    return ProductAttributeTermsRepository(attributeId: attributeId, settings: settings);
  }
  
}
