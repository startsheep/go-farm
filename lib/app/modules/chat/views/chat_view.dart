import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          title: Text(Get.arguments['farm']['title'].toString(),
              style: const TextStyle(color: Colors.black)),
          // centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: controller.chats.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: controller.chats[index]['isMe']
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.7,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: controller.chats[index]['isMe']
                                    ? Color.fromARGB(255, 100, 72, 241)
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                controller.chats[index]['message'],
                                style: TextStyle(
                                  color: controller.chats[index]['isMe']
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            //
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        // controller: controller.messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ketik pesan',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      // controller.sendMessage();
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppTheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
