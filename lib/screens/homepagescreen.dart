// import 'dart:convert';

// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:http/http.dart' as http;

// import 'package:provider/provider.dart';

// import '../provider/userprovider.dart';

// class ChatHome extends StatefulWidget {
//   const ChatHome({super.key});

//   @override
//   State<ChatHome> createState() => _ChatHomeState();
// }

// class _ChatHomeState extends State<ChatHome> {
//   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//   //   Provider.of<UserProvider>(context, listen: false);
//   // });
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<UserProvider>(context, listen: false);
//     });
//     super.initState();
//   }

//   ChatUser user = ChatUser(
//     id: '1',
//     firstName: 'User',
//     lastName: '',
//   );

//   ChatUser gemini = ChatUser(
//     id: '2',
//     firstName: 'Bot',
//     lastName: '',
//   );

//   var ApiKey = "AIzaSyCicOLgbVIdKyzvlM3PsmECNZDeFg71H7A";

//   var url =
//       "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCicOLgbVIdKyzvlM3PsmECNZDeFg71H7A";

//   List<ChatUser> typing = [];

//   getAllMessages(ChatMessage msg, UserProvider provider) async {
//     typing.add(gemini);
//     setState(() {
//       provider.messages.insert(0, msg);
//     });

//     var bodyData = {
//       "contents": [
//         {
//           "parts": [
//             {"text": msg.text}
//           ]
//         }
//       ]
//     };
//     await http
//         .post(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: jsonEncode(bodyData),
//     )
//         .then((value) {
//       if (value.statusCode == 200) {
//         var result = jsonDecode(value.body);

//         ChatMessage chatBot = ChatMessage(
//           text: result["candidates"][0]["content"]["parts"][0]["text"],
//           user: gemini,
//           createdAt: DateTime.now(),
//         );

//         provider.messages.insert(0, chatBot);
//       } else {}
//     }).catchError((error) {});
//     typing.remove(gemini);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final chatProvider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         scrolledUnderElevation: 0,
//         title: const Text(
//           'Chatbot',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 chatProvider.clearMessages();
//               },
//               icon: const Icon(CupertinoIcons.trash)),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body: DashChat(
//         quickReplyOptions: const QuickReplyOptions(),
//         inputOptions: InputOptions(sendButtonBuilder: ((send) {
//           return IconButton(
//               onPressed: send,
//               icon: const Icon(
//                 Feather.send,
//                 color: Colors.red,
//               ));
//         })),
//         messageOptions: MessageOptions(
//             currentUserContainerColor: Colors.blue,
//             showTime: false,
//             showCurrentUserAvatar: true,
//             messageTextBuilder: ((message, previousMessage, nextMessage) {
//               return Text(
//                 message.text.trim(),
//                 style: TextStyle(
//                     fontSize: 14,
//                     height: 1.4,
//                     color:
//                         message.user.id == "1" ? Colors.white : Colors.black),
//               );
//             })),
//         scrollToBottomOptions:
//             ScrollToBottomOptions(scrollToBottomBuilder: ((scrollController) {
//           return Positioned(
//               bottom: 20,
//               left: MediaQuery.of(context).size.width / 2,
//               child: IconButton.filledTonal(
//                   onPressed: () {
//                     scrollController.animateTo(
//                       0.0,
//                       curve: Curves.easeOut,
//                       duration: const Duration(milliseconds: 300),
//                     );
//                   },
//                   icon: const Icon(Icons.arrow_circle_down_sharp)));
//         })),
//         typingUsers: typing,
//         currentUser: user,
//         onSend: (ChatMessage msg) {
//           FocusScope.of(context).unfocus();
//           // updateRequestReceived();
//           getAllMessages(msg, chatProvider);
//         },
//         messages: chatProvider.messages,
//       ),
//     );
//   }

// // pNLAxGMzB8H4De2yv2un
//   // updateRequestReceived() async {
//   //   DocumentSnapshot doc =
//   //       await chatsCollection.doc("pNLAxGMzB8H4De2yv2un").get();

//   //   chatsCollection.doc("pNLAxGMzB8H4De2yv2un").update({
//   //     'requestReceived': doc['requestReceived'] + 1,
//   //   });
//   // }
// }
import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Rohit',
    lastName: 'Kumar',
  );

  ChatUser gemini = ChatUser(
    id: '2',
    firstName: 'Gemini',
    lastName: '',
  );

  var ApiKey = "AIzaSyCicOLgbVIdKyzvlM3PsmECNZDeFg71H7A";
  var url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCicOLgbVIdKyzvlM3PsmECNZDeFg71H7A";

  List<ChatUser> typing = [];

  getAllMessages(ChatMessage msg) async {
    typing.add(gemini);
    setState(() {
      messages.insert(0, msg);
    });

    var bodyData = {
      "contents": [
        {
          "parts": [
            {"text": msg.text}
          ]
        }
      ]
    };
    await http
        .post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(bodyData),
    )
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);

        ChatMessage chatBot = ChatMessage(
          text: result["candidates"][0]["content"]["parts"][0]["text"],
          user: gemini,
          createdAt: DateTime.now(),
        );

        messages.insert(0, chatBot);
      } else {
        print("error");
      }
    }).catchError((error) {
      print(error);
    });
    typing.remove(gemini);
    setState(() {});
  }

  // curl \
  // -H 'Content-Type: application/json' \
  // -d '{"contents":[{"parts":[{"text":"Write a story about a magic backpack"}]}]}' \
  // -X POST https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=YOUR_API_KEY

  List<ChatMessage> messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orange.,
        scrolledUnderElevation: 0,
        title: ListTile(
          leading: Image.asset(
            'assets/tractor.jpeg',
            height: 40,
            width: 40,
          ),
          title: const Text(
            'FarmBot',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Online',
            style: TextStyle(color: Colors.green),
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new), onPressed: () {}),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: DashChat(
        quickReplyOptions: QuickReplyOptions(),
        scrollToBottomOptions: ScrollToBottomOptions(),
        typingUsers: typing,
        currentUser: user,
        onSend: (ChatMessage msg) {
          getAllMessages(msg);
        },
        messages: messages,
      ),
    );
  }
}
