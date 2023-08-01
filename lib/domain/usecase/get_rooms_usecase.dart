import 'package:matrix/matrix.dart';
import 'package:matrix_app/services/matrix.dart';

mixin class GetRoomsUsecase {
  List<Room> getRoomsUsecase() {
    return MatrixService.client.rooms;
  }
}
