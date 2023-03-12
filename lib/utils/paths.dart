import 'package:path_provider/path_provider.dart';

class Paths {
  static Future<String> getApplicationDocumentsPath() async {
    var dir = await getApplicationDocumentsDirectory();
    var folder = dir.path;
    return Future.value(folder);
  }
}
