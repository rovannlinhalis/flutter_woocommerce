import 'package:flutter_woocommerce/models/coupon/coupon.dart';
import 'package:flutter_woocommerce/models/generic/batch.dart';


class BatchCoupon extends BatchGeneric<Coupon> {
    BatchCoupon() : super(creator: ()=> new Coupon());
}