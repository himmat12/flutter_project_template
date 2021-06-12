import 'package:get/get.dart';
import 'package:toppicks/src/views/dashboard/dashboard.dart';

class Routes {
  static List<GetPage> getRoutes() {
    return <GetPage>[
      GetPage(name: '/', page: () => const Dashboard()),
    ];
  }
}
