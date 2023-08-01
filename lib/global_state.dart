import 'package:matrix/matrix.dart';

class GlobalState {
  HomeserverSummary? homeServerSummary;
  LoginResponse? loginResponse;
}

GlobalState globalState = GlobalState();