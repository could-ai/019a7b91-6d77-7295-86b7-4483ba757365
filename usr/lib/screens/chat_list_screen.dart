import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../widgets/chat_list_item.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<Chat> _chats = [
    Chat(
      id: '1',
      name: 'John Doe',
      lastMessage: 'Hey! How are you doing?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      unreadCount: 2,
      isOnline: true,
    ),
    Chat(
      id: '2',
      name: 'Sarah Smith',
      lastMessage: 'Can we meet tomorrow?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
      unreadCount: 0,
      isOnline: true,
    ),
    Chat(
      id: '3',
      name: 'Mike Johnson',
      lastMessage: 'Thanks for your help!',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      unreadCount: 0,
      isOnline: false,
    ),
    Chat(
      id: '4',
      name: 'Emily Brown',
      lastMessage: 'See you later 👋',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      avatarUrl: 'https://i.pravatar.cc/150?img=4',
      unreadCount: 0,
      isOnline: false,
    ),
    Chat(
      id: '5',
      name: 'David Wilson',
      lastMessage: 'That sounds great!',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      unreadCount: 1,
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Implement menu
            },
          ),
        ],
      ),
      body: _chats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No chats yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return ChatListItem(
                  chat: chat,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(chat: chat),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement new chat
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New chat feature coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}