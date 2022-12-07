import 'package:flutter/foundation.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLodindgScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLodindgScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
