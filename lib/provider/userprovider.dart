import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String phoneNumber = '';
  bool isAuthor = false;
  String currUserUid = '';
  bool isLoading = false;
  bool isAuth = false;

  logOutUser() async {
    isAuth = false;
    notifyListeners();
  }

  static ChatUser gemini = ChatUser(
    id: '2',
    firstName: 'Bot',
    lastName: '',
  );

  static var chatMessages = ChatMessage(
    text: "Hello👋 ask me anything!",
    user: gemini,
    createdAt: DateTime.now(),
  );

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: "Hello👋 ask me anything!",
      user: gemini,
      createdAt: DateTime.now(),
    )
  ];

  clearMessages() {
    messages.clear();
    messages.add(chatMessages);
    notifyListeners();
  }

  // Future<void> getData() async {
  //   isLoading = true;
  //   notifyListeners();
  //   var uid = FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot userDoc = await userCollection.doc(uid).get();
  //   name = userDoc['username'];
  //   email = userDoc['email'];
  //   phoneNumber = userDoc["phoneNumber"];
  //   isAuthor = userDoc["isAuthor"];
  //   currUserUid = uid;
  //   isLoading = false;
  //   notifyListeners();
  // }
}
