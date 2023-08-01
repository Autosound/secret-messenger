import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_app/service_locator.dart';
import 'dart:core';
import '../../services/matrix.dart';
import 'chat_list_cubit.dart';
import 'chat_list_cubit_states.dart';
import 'package:http/http.dart' as http;

class ChatListScreen extends StatelessWidget {
  final avatarPlaceholder = 'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
  final avatarPlaceholder2 = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbYDFhcSk3Wnrit3ziOdhsgqt6OQQ73f2g8pYmkUc&s';
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt.chatListCubit.getRooms();

    final scheme = MatrixService.client.homeserver!.scheme;
    final host = MatrixService.client.homeserver!.host;
    final port = MatrixService.client.homeserver!.port;
    // final path = MatrixService.client.homeserver!.path;

    return Scaffold(
      drawer: const Drawer(
        child: NavigationDrawer(children: [Text('Settings')]),
      ),
      appBar: AppBar(
        title: const Text('Secret Messenger'),
      ),
      body: BlocBuilder<ChatListCubit, ChatListState>(
        bloc: GetIt.chatListCubit,
        builder: (context, state) {
          return switch (state) {
            ChatListLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ChatListEmpty() => const Center(
                child: Text('Your chatlist is empty'),
              ),
            ChatListSuccess() => ListView.builder(
                itemCount: state.rooms.length,
                itemBuilder: (context, i) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ListTile(
                    onTap: () {},
                    leading: state.rooms[i].avatar != null
                        ? FutureBuilder(
                            future: http.get(
                              Uri(
                                scheme: scheme,
                                host: host,
                                port: port,
                                path: '/_matrix/media/r0/thumbnail/${state.rooms[i].avatar!.host}${state.rooms[i].avatar!.path}',
                                queryParameters: {'width': '50', 'height': '50', 'method': 'crop'},
                              ),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(snapshot.data!.bodyBytes);
                              } else if (snapshot.hasError) {
                                return const Text('HAS ERROR');
                              } else {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            },
                          )
                        : Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrM9idjLIZhIs-ZGvkIef0hWJbgOiReywmVg&usqp=CAU'),
                    title: Text(state.rooms[i].getLocalizedDisplayname()),
                    subtitle: Text(
                      state.rooms[i].lastEvent!.text,
                      style: const TextStyle(color: Colors.blueGrey, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
