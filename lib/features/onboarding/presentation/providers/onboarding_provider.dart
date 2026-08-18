import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider =
NotifierProvider<OnboardingNotifier, int>(
  OnboardingNotifier.new,
);

class OnboardingNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setPage(int page) {
    if (page >= 0) {
      state = page;
    }
  }

  void nextPage(int totalPages) {
    if (state < totalPages - 1) {
      state++;
    }
  }

  void previousPage() {
    if (state > 0) {
      state--;
    }
  }

  void reset() {
    state = 0;
  }
}