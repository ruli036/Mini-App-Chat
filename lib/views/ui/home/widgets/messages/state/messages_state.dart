import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/helpers/helper.dart';
import 'package:mini_chat_app/core/model/auth.dart';
import 'package:mini_chat_app/core/model/message.dart';
import 'package:mini_chat_app/core/model/users.dart';

class MessagesState extends ChangeNotifier {
  List<UserModel> mockUsers = [
    UserModel(
      id: 'u1',
      name: 'Ruli Andrian',
      email: 'ruliandrian04082000@mail.com',
      photoUrl: 'https://i.pravatar.cc/150?img=1',
      unreadMessage: 0,
      isOnline: true,
    ),
    UserModel(
      id: 'u2',
      name: 'Devina Putri',
      email: 'devina@mail.com',
      photoUrl: 'https://i.pravatar.cc/150?img=2',
      unreadMessage: 0,
      isOnline: true,
    ),
    UserModel(
      id: 'u3',
      name: 'Budi Santoso',
      email: 'budi@mail.com',
      photoUrl: 'https://i.pravatar.cc/150?img=3',
      unreadMessage: 0,
      isOnline: false,
    ),
    UserModel(
      id: 'u4',
      name: 'Citra Lestari',
      email: 'citra@mail.com',
      photoUrl: 'https://i.pravatar.cc/150?img=4',
      unreadMessage: 0,
      isOnline: true,
    ),
    UserModel(
      id: 'u5',
      name: 'Andi Nugraha',
      email: 'andi@mail.com',
      photoUrl: 'https://i.pravatar.cc/150?img=5',
      unreadMessage: 0,
      isOnline: false,
    ),
  ];
  AuthData? authData;
  UserModel? chatting;
  final _chatController = StreamController<List<ChatMessage>>.broadcast();
  final TextEditingController textController = TextEditingController();
  Stream<List<ChatMessage>> get messagesStream => _chatController.stream;

  init() async {
    await getAuthUser();
    getUnreadMessage();
  }

  Future<void> getAuthUser() async {
    // get data auth
    authData = await Helper.getAuthData();
    notifyListeners();
  }

  void getUnreadMessage() {
    // count unread message from user login and different sender
    final user = {for (var user in mockUsers) user.email: user};
    for(var msg in InitialConstant.messages){
      final receiver = user[msg.receiveId];
      if (receiver != null && msg.senderId != authData?.email && !msg.isRead) {
        receiver.unreadMessage += 1;
      }
    }
  }

  void sendMessage(ChatMessage message) {
    // send message and listen to stream controller
    InitialConstant.messages.add(message);
    final chat = InitialConstant.messages.where((e)=>e.receiveId == chatting?.email).toList();
    _chatController.sink.add(List.from(chat));
  }

  void getReceiveMessage() {
    // get history message
    Timer(Duration(milliseconds: 500),() {
      final chat = InitialConstant.messages.where((e)=>e.receiveId == chatting?.email).toList();
      _chatController.sink.add(List.from(chat));
      mockUsers.where((e)=>chatting?.email == e.email).first.unreadMessage = 0;
      for(var msg in InitialConstant.messages){
        if (msg.receiveId == chatting?.email && !msg.isRead) {
          msg.isRead = true;
        }
      }
      notifyListeners();
    },);
  }

  void handleSend({String sendTo = ''}) {
    if (textController.text.trim().isEmpty) return;
    sendMessage(
      ChatMessage(
        senderId: authData?.email ?? '',
        receiveId: sendTo,
        senderName: authData?.name ?? '',
        text: textController.text.trim(),
        isRead: false,
        timestamp: DateTime.now(),
      ),
    );
    textController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _chatController.close();
    super.dispose();
  }
}
