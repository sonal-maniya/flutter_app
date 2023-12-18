import 'package:flutter_app/riverpod/user_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modal/user_modal.dart';

final userDataProvider = FutureProvider<List<UserModal>>((ref) async {
  return ref.watch(userProvider).getUser(); // Watching the changes
});
