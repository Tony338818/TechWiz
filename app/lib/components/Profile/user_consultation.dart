// ignore_for_file: prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:app/components/consultation.dart';
import 'package:flutter/material.dart';

class UserConsultation extends StatefulWidget {
  const UserConsultation({super.key});

  @override
  _UserConsultationState createState() => _UserConsultationState();
}

class _UserConsultationState extends State<UserConsultation> {
  bool consult = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Consultation'),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Consultation()));
        },
        child: Text('Click Now to Book a consultation'),
      ),
      body: !consult
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                      child: Image.network(
                        'https://storage.vivago.ai/image/p_e89ad298-76a9-11ef-a53e-4ed4b81f76cb.jpg?width=512',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Consultation is Empty',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text('You have made no consultations'),
                ],
              ),
            )
          : Consulted(),
    );
  }
}

class Consulted extends StatelessWidget {
  const Consulted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text('Consultation with Designer ${index + 1}'),
            subtitle:
                Text('Date: ${DateTime.now().add(Duration(days: index))}'),
            trailing: IconButton(
              icon: Icon(Icons.select_all),
              onPressed: () {
              },
            ),
          ),
        );
      },
    );
  }
}
