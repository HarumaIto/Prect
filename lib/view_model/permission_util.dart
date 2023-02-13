import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> locationRequest() {
    return Permission.location.request().isGranted;
  }
}