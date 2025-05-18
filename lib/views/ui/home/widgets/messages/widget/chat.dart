import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/core/model/message.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/state/messages_state.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  MessagesState localState;

  ChatPage({super.key, required this.localState});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: localState,
      child: Consumer<MessagesState>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: Text(state.chatting?.name ?? "-")),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<ChatMessage>>(
                      stream: state.messagesStream,
                      builder: (context, snapshot) {
                        final messages = snapshot.data ?? [];
                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final reversedIndex = messages.length - 1 - index;
                            final msg = messages[messages.length - 1 - index];
                            final isMe = msg.senderId == state.authData?.email;
                            final isLatestMessage = reversedIndex == messages.length - 1;
                            final messageWidget = Align(
                              key: ValueKey(msg.timestamp.toIso8601String()),
                              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isMe ? styleMiniChat.colors.background.teal : styleMiniChat.colors.background.grey,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      msg.senderName,
                                      style: styleMiniChat.text.bodyBold.copyWith(
                                        color: isMe ? styleMiniChat.colors.text.button : styleMiniChat.colors.text.base,)
                                    ),
                                    Text(
                                      msg.text,
                                      style: styleMiniChat.text.bodyRegular.copyWith( color: isMe ? styleMiniChat.colors.text.button : styleMiniChat.colors.text.base,)
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      DateFormat('HH:mm').format(msg.timestamp),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            isMe
                                                ? Colors.white70
                                                : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            return isLatestMessage && isMe
                                ? AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 400),
                                  transitionBuilder: (child, animation) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0.3, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: messageWidget)
                                : messageWidget;
                          },
                        );
                      },
                    ),
                  ),
                  Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: state.textController,
                            style: TextStyle(
                              color: styleMiniChat.colors.text.base
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Type a message...',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed:
                              () => state.handleSend(
                                sendTo: state.chatting?.email ?? '',
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
