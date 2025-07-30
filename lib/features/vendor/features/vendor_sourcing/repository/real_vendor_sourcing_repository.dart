import 'dart:io';

import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

class RealVendorSourcingRepository implements VendorSourcingRepository {
  final DioService _dioService = Get.find<DioService>();
}
