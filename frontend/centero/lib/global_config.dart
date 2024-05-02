class GlobalConfig {
  static const bool isDevMode = String.fromEnvironment('mode') == 'dev';
  static const bool enableIdleLogout = bool.fromEnvironment('idleLogout', defaultValue: true);
  static const Duration standardIdleTimeout = Duration(seconds: 60);
}