class GlobalConfig {
  static const bool isDevMode = String.fromEnvironment('mode') == 'dev';
}