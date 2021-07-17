import 'package:football_app/state/request_state.dart';

class Resource<T> {
  T data;
  String errorMessage;
  RequestState state;

  Resource({this.data, this.errorMessage, this.state});
}