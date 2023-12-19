import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print("$previousValue $newValue");
  }
}
