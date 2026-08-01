import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Normalized App Failure Representation
sealed class NetworkFailure {
  final String message;
  final int? statusCode;
  const NetworkFailure(this.message, [this.statusCode]);
}

class ServerFailure extends NetworkFailure {
  const ServerFailure(super.message, [super.statusCode]);
}

class NoInternetFailure extends NetworkFailure {
  const NoInternetFailure() : super('ইন্টারনেট সংযোগ নেই!');
}

// 2. State wrapper for normalized UI state
class UIState<T> {
  final bool isLoading;
  final T? data;
  final NetworkFailure? failure;

  const UIState({this.isLoading = false, this.data, this.failure});

  factory UIState.loading() => const UIState(isLoading: true);
  factory UIState.success(T data) => UIState(data: data);
  factory UIState.error(NetworkFailure failure) => UIState(failure: failure);
}

// 3. Normalized Controller
class ProfileController extends StateNotifier<UIState<String>> {
  ProfileController() : super(const UIState());

  Future<void> fetchProfile() async {
    state = UIState.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Simulated data return
      state = UIState.success('John Doe');
    } catch (e) {
      state = UIState.error(const ServerFailure('ডাটা লোড করা যায়নি', 500));
    }
  }
}