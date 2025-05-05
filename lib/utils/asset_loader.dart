import 'package:flutter/services.dart';

class AssetLoader {
  Future<String> loadString(String path) {
    return rootBundle.loadString(path);
  }
}
