import 'dart:async';

class Bloc<T> {
  final BlocState currentState = BlocState<T>.empty();

  final StreamController<BlocState> statusChanged = new StreamController();

  Stream<BlocState> get items => statusChanged.stream;

  void getItems(Stream<T> stream) {
    currentState.loading = true;
    print("loading");
    statusChanged.add(currentState);
    stream.listen((data) {
      currentState.items = data;
      currentState.loading = false;
      //  onComplete(data);
      print("complete");
      statusChanged.add(currentState);
    }, onError: (error) {
      print("error");
      currentState.error = error;
      statusChanged.add(currentState);
    });
  }

  void dispose() {
    print("dispose");
    statusChanged.close();
  }
}

class BlocState<T> {
  bool loading;
  T items;
  String error;

  BlocState(this.loading, this.items, this.error);

  BlocState.empty() {
    loading = false;
    items = null;
    error = null;
  }
}
