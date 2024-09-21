import 'package:flutter/material.dart';

class UserTable extends StatefulWidget {
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  List<User> users = [
    User(id: 1, name: 'John Doe', email: 'john@example.com'),
    User(id: 2, name: 'Jane Smith', email: 'jane@example.com'),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Actions')),
        ],
        rows: users.map((user) {
          return DataRow(cells: [
            DataCell(Text(user.id.toString())),
            DataCell(Text(user.name)),
            DataCell(Text(user.email)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blue, // Edit color
                  onPressed: () => _editUser(user),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red, // Delete color
                  onPressed: () => _deleteUser(user),
                ),
                IconButton(
                  icon: const Icon(Icons.pause_circle_filled),
                  color: Colors.orange, // Suspend color
                  onPressed: () => _suspendUser(user),
                ),
              ],
            )),
          ]);
        }).toList(),
      )),
    );
  }

  void _editUser(User user) {
    Navigator.pushNamed(
      context,
      '/editUser',
      arguments: {
        'name': user.name,
        'email': user.email,
      },
    );
  }

  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${user.name}? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  users.removeWhere((u) => u.id == user.id);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${user.name} has been deleted')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _suspendUser(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Suspension'),
          content: Text('Are you sure you want to suspend ${user.name}? They will temporarily lose access to the system.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Suspend'),
              onPressed: () {
                // Implement actual suspension logic here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${user.name} has been suspended')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: UserTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addUser');
        },
        child: Icon(Icons.add),
        tooltip: 'Add User',
        backgroundColor: Color(0xFFFFDE82),
      ),
    );
  }
}




