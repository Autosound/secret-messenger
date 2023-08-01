import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix_app/domain/usecase/get_rooms_usecase.dart';
import 'package:matrix_app/presentation/chat_list/chat_list_cubit_states.dart';

class ChatListCubit extends Cubit<ChatListState> with GetRoomsUsecase {
  ChatListCubit() : super(ChatListLoading());

  void getRooms() {
    List<Room> rooms = getRoomsUsecase();
    if (rooms.isEmpty) {
      emit(ChatListEmpty());
    } else {
      emit(ChatListSuccess(rooms: rooms));
    }
  }
}
