class DataState {
  int data;
  DataState({required this.data});
}

final class DataStateInitializer extends DataState {
  DataStateInitializer() : super(data: 0);
}
