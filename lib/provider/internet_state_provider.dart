import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider((ref) => Connectivity());

final internetStreamProvider = StreamProvider((ref) {
   final stream = ref.read(connectivityProvider).onConnectivityChanged;
   return stream;
});