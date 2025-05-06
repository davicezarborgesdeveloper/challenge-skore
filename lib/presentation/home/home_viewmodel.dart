import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:skore/data/responses/responses.dart';

import '../../domain/home_usecase.dart';

enum FlowState {
  content,
  loading,
  error,
  success,
}

class HomeViewModel {
  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  final state = ValueNotifier(FlowState.content);

  final listClass = ValueNotifier<List<Discipline>?>(null);

  int get classCount {
    return listClass.value?.length ?? 0;
  }

  void start() {
    _getHome();
  }

  _getHome() async {
    state.value = FlowState.loading;
    await Future.delayed(const Duration(seconds: 1));
    // ignore: void_checks
    (await _homeUseCase.execute(Void)).fold((failure) {
      debugPrint('Erro:${failure.message}');
      state.value = FlowState.error;
    }, (success) {
      success.discipline!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      listClass.value = success.discipline;
      state.value = FlowState.success;
    });
  }

  onDelete(Discipline discipline) {
    if (listClass.value!.isNotEmpty) {
      listClass.value!.removeWhere((item) => item.id == discipline.id);
      listClass.value = [...listClass.value ?? []];
    }
  }
}
