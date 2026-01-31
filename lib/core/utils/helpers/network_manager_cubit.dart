import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkManagerCubit extends Cubit<bool> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // القيمة الابتدائية نفترض أنها true (متصل) حتى يتم الفحص
  NetworkManagerCubit() : super(true) {
    _monitorConnection();
  }

  void _monitorConnection() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      result,
    ) {
      _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      emit(false); // تحديث الحالة إلى غير متصل
    } else {
      emit(true); // تحديث الحالة إلى متصل
    }
  }

  // دالة للفحص اليدوي السريع
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel(); // إغلاق الاشتراك عند تدمير الكيوبت
    return super.close();
  }
}
