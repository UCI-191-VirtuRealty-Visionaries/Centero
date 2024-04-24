class GlobalConfig {
  static const bool isDevMode = String.fromEnvironment('mode') == 'dev';
  static const Duration standardIdleTimeout = Duration(seconds: 60);
}