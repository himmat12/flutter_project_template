import 'package:get_storage/get_storage.dart';

final utils = GetStorage('utils');

class Utils {
  ///
  ///  example get storage utils
  ///
  static void setUtils(String? value) => utils.write('utils', value);
  static String get getUtils => utils.read('utils');
}
