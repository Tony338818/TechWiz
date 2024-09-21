// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class DesignerConsultation extends StatefulWidget {
  const DesignerConsultation({super.key});

  @override
  _DesignerConsultationState createState() => _DesignerConsultationState();
}

class _DesignerConsultationState extends State<DesignerConsultation> {
  List<String> availableTimeSlots = [];
  List<Map<String, dynamic>> bookedAppointments = [];

  final TextEditingController _timeSlotController = TextEditingController();
  bool consult = false;

  void addTimeSlot(String slot) {
    setState(() {
      availableTimeSlots.add(slot);
    });
  }

  void cancelAppointment(int index) {
    setState(() {
      bookedAppointments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Consultations'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Available Time Slots',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _timeSlotController,
                    decoration: InputDecoration(
                      hintText: 'Enter time slot (e.g., 10:00 AM - 11:00 AM)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_timeSlotController.text.isNotEmpty) {
                      addTimeSlot(_timeSlotController.text);
                      _timeSlotController.clear();
                    }
                  },
                  child: Text('Add Slot'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (availableTimeSlots.isNotEmpty) ...[
              Text(
                'Available Time Slots',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (String slot in availableTimeSlots)
                ListTile(
                  title: Text(slot),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        availableTimeSlots.remove(slot);
                      });
                    },
                  ),
                ),
            ] else
              Text(
                'No time slots available. Add new slots above.',
                style: TextStyle(color: Colors.grey),
              ),
            SizedBox(height: 30),
            Text(
              'Booked Appointments',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            bookedAppointments.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookedAppointments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                              'Client: ${bookedAppointments[index]['client']}'),
                          subtitle: Text(
                              'Time: ${bookedAppointments[index]['timeSlot']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel, color: Colors.red),
                            onPressed: () {
                              cancelAppointment(index);
                            },
                          ),
                        ),
                      );
                    },
                  )
                : Text(
                    'No appointments booked yet.',
                    style: TextStyle(color: Colors.grey),
                  ),
          ],
        ),
      ),
    );
  }
}
