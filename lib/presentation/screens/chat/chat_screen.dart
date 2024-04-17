import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.flim9-1.fna.fbcdn.net/v/t1.6435-9/59993547_2357243644338885_5290176059604467712_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFCXudn1DUMaO4n10tjbFKLXTjIEd9QqTZdOMgR31CpNqT1cjIXRJCh3sIqjRlQPdMUVPO9zQLZBAGiULFYd2TK&_nc_ohc=yNiqVLEecEEAb6Rf7We&_nc_ht=scontent.flim9-1.fna&oh=00_AfApZw4e5zSlKsuRtJ0I-wVe46etfkXycw_EHufA559zbA&oe=66369532'),
          ),
        ),
        title: const Text('Mi Amorcito ❤️ '),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProviderM = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProviderM.chatScrollController,
              itemCount: chatProviderM.messageList.length,
              itemBuilder: (context, index) {
                final messageAqui = chatProviderM.messageList[index];

                return (messageAqui.fromWho == FromWho.hers)
                    ? HerMessageBubble(messageHer: messageAqui)
                    : MyMessageBubble(messageMy: messageAqui);
                // return (index % 2 == 0)
                //     ? const HerMessageBubble()
                //     : const MyMessageBubble();
              },
            )),
            MessageFieldBox(
              onValue: chatProviderM.sendMessage,
              //Forma 2
              //onValue: (value) => chatProviderM.sendMessage(value),
              //Forma 3
              // onValue: (value) {
              //   chatProviderM.sendMessage(value);
              // },
            )
          ],
        ),
      ),
    );
  }
}
