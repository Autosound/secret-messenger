import 'package:matrix/matrix.dart';

sealed class ChatListState {}

class ChatListLoading extends ChatListState {}

class ChatListEmpty extends ChatListState {}

class ChatListSuccess extends ChatListState {
  final List<Room> rooms;
  ChatListSuccess({
    required this.rooms,
  });
}
