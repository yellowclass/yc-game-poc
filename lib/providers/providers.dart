import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<int> directionProvider = StateProvider((ref) => 0);
StateProvider<bool> flippedProvider = StateProvider((ref) => false);
