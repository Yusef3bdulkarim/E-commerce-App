import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_managed_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  NetworkCubit() : super(NetworkInitial()) {
    // مراقبة تغير حالة الشبكة فور بدء الكيوبت
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // تحديث الحالة بناءً على النتيجة
  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      emit(NetworkDisconnected());
      // هنا يمكنك استدعاء SnackBar التحذيري إذا أردت
    } else {
      emit(NetworkConnected());
    }
  }

  // دالة لفحص الاتصال يدوياً (مثل الموجودة في الصورة)
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel(); // إغلاق الـ Stream لمنع تسريب الذاكرة
    return super.close();
  }
}