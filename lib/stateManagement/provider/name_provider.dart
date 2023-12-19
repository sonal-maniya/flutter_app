// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_app/stateManagement/provider/employee_change_notifier_provider.dart';
import 'package:flutter_app/stateManagement/provider/post_future_provider.dart';
import 'package:flutter_app/stateManagement/provider/user_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Provider
final nameProvider = Provider<String>((ref) => "Sonal Maniya");

// 2. State Provider
final updateNameProvider = StateProvider<String?>((ref) => null);

// 3. StateNotifier and StateNotifierProvider -> Mots used
final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(const User(name: '', age: 0)));

// 4. ChangeNotifierProvider
final employeeChangeNotifierProvider =
    ChangeNotifierProvider((ref) => EmployeeChangeNotifier());

// 5. FutureNotifierProvider
final postFutureProvider = FutureProvider((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.getPost();
});

// 6. StreamProvider
final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
