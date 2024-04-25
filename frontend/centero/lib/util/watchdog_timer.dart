import 'dart:async';
import 'package:logging/logging.dart';

class WatchdogTimer {
  _WatchdogInstance? _instance;
  final Logger logger;

  WatchdogTimer({required this.logger});

  void start(Duration duration, void Function() onElapsed) {
    _instance?.cancel();
    _instance = _WatchdogInstance();
    _instance?.init(duration, onElapsed);
  }

  void cancel() {
    if (_instance == null) {
      logger.warning('Cannot cancel watchdog timer, timer was never started.');
      return;
    }
    _instance?.cancel();
  }

  void pause() {
    if (_instance == null) {
      logger.warning('Cannot pause watchdog timer, timer was never started.');
      return;
    }
    _instance?.pause();
  }

  void unpause() {
    if (_instance == null) {
      logger.warning('Cannot unpause watchdog timer, timer was never started.');
      return;
    }
    _instance?.unpause();
  }
}

class _WatchdogInstance {
  // Represents a managed lifespan under the constraint that this countdown
  // session is started once, paused/unpaused multiple times, and cancelled
  // exactly once.

  late Timer timer;
  late final Duration maxDuration;
  late final void Function() callback;
  final stopwatch = Stopwatch();

  void init(Duration duration, void Function() onElapsed) {
    maxDuration = duration;
    callback = onElapsed;
    timer = Timer(maxDuration, _elapsedImpl);
    stopwatch.start();
  }

  void cancel() {
    timer.cancel();
    stopwatch.reset();
  }

  void pause() {
    stopwatch.stop();
    timer.cancel();
  }

  void unpause() {
    final remaining = maxDuration - stopwatch.elapsed;
    timer = Timer(remaining, _elapsedImpl);
    stopwatch.start();
  }

  void _elapsedImpl() {
    callback();
    cancel();
  }
}
