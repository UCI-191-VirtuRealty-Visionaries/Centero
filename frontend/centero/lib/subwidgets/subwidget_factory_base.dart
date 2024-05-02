import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

abstract class SubwidgetFactory<T> {
  final BuildContext context;
  final Logger logger = Logger('${T.toString()}.SubwidgetFactory');

  SubwidgetFactory({
    required this.context,
  });
}
