import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/widgets/chat_buble.dart';
import 'package:chat/widgets/chat_buble_for_friend.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chatPage';

  final ScrollController _scrollController = ScrollController();

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBuble(
                              messageModel: messageList[index],
                            )
                          : ChatBubleForFriend(
                              messageModel: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // autofocus: true,
                    // style: const TextStyle(decoration: TextDecoration.none),
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        kMessageCollection: value,
                        kCreatedAt: DateTime.now(),
                        kId: email,
                      });
                      controller.clear();
                      _scrollEnd();
                    },
                    decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: IconButton(
                            onPressed: () {
                              String message = controller.text;
                              messages.add({
                                kMessageCollection: message,
                                kCreatedAt: DateTime.now(),
                                kId: email,
                              });
                              controller.clear();
                              _scrollEnd();
                            },
                            icon: const Icon(Icons.send)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(16))),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                'Loading ....',
                style: TextStyle(color: kPrimaryColor, fontSize: 32),
              ),
            ),
          );
        }
      },
    );
  }

  void _scrollEnd() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeIn,
    );
  }
}
