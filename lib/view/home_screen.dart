import 'package:aiims_telephone_directory/component/myText.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../modal/user_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModal> _users = [
    UserModal(id: 1, username: 'john_doe', phone: '1234567890'),
    UserModal(id: 2, username: 'jane_smith', phone: '0987654321'),
    UserModal(id: 3, username: 'alice_jones', phone: '5551234567'),
    UserModal(id: 4, username: 'bob_brown', phone: '5559876543'),
    UserModal(id: 5, username: 'charlie_clark', phone: '5554567890'),
    UserModal(id: 6, username: 'david_davis', phone: '5555678901'),
    UserModal(id: 7, username: 'eve_evans', phone: '5556789012'),
    UserModal(id: 8, username: 'frank_foster', phone: '5557890123'),
    UserModal(id: 9, username: 'grace_green', phone: '5558901234'),
    UserModal(id: 10, username: 'hank_harris', phone: '5559012345'),
    UserModal(id: 11, username: 'isla_ireland', phone: '5550123456'),
    UserModal(id: 12, username: 'jack_johnson', phone: '5551234012'),
    UserModal(id: 13, username: 'karen_kelly', phone: '5552345123'),
    UserModal(id: 14, username: 'leo_lawrence', phone: '5553456234'),
    UserModal(id: 15, username: 'mia_martin', phone: '5554567345'),
    UserModal(id: 16, username: 'noah_nelson', phone: '5555678456'),
    UserModal(id: 17, username: 'olivia_owen', phone: '5556789567'),
    UserModal(id: 18, username: 'peter_perez', phone: '5557890678'),
    UserModal(id: 19, username: 'quincy_quinn', phone: '5558901789'),
    UserModal(id: 20, username: 'rachel_ross', phone: '5559012890'),
  ];

  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<UserModal> _searchUsers(String query) {
    if (query.isEmpty) {
      return _users;
    } else {
      return _users.where((user) {
        return user.username!.toLowerCase().contains(query.toLowerCase()) ||
            user.phone!.contains(query);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _searchUsers(_searchQuery);
    return MyScaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by username or phone number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  title: Text(user.username ?? ''),
                  subtitle: Text(user.phone ?? ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
