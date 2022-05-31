import 'dart:developer';

void devPrint(Object? o, [StackTrace? stack]) {
  return log('$o', stackTrace: stack);
}
