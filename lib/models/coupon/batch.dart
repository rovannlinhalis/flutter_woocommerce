import 'package:r_flutter_woocommerce/models/coupon/coupon.dart';
import 'package:r_flutter_woocommerce/models/generic/batch.dart';


class BatchCoupon extends BatchGeneric<Coupon> {
    BatchCoupon() : super(creator: ()=> new Coupon());
}