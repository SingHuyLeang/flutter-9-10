import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_9_10/bloc/data_even.dart';
import 'package:flutter_9_10/bloc/data_state.dart';

class DataBloc extends Bloc<DataEvents, DataState> {
  DataBloc() : super(DataStateInitializer()) {

    on<IncrementEvents>((event, emit) {
      emit(DataState(data: state.data+1));
      log('State on data ++ bloc : ${state.data}');
    });

    on<DecrementEvents>((event, emit) {
      emit(DataState(data: state.data-1));
      log('State on data -- bloc : ${state.data}');
    });

  }
}
