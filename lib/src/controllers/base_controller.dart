import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _state = VIEWSTATE.idel.obs;

  VIEWSTATE get state => _state.value;

  void setState(VIEWSTATE newState) => _state.value = newState;
}

enum VIEWSTATE { idel, error, retrived, loading }
