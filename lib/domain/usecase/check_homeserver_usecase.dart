import 'package:matrix/matrix.dart';

import '../../services/matrix.dart';

mixin class CheckHomeServerUsecase {
  Future<HomeserverSummary> checkHomeServerUsecase({required String homeServerUrl}) async {
    HomeserverSummary response = await MatrixService.client.checkHomeserver(Uri.parse('https://matrix.org'));
    return response;
  }
}
