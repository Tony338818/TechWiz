// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Consultation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Available Designers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200, 
              child: GetDesigner(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Available Time Slots',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            AvailableTimeSlots(),
          ],
        ),
      ),
    );
  }
}

class GetDesigner extends StatefulWidget {
  const GetDesigner({super.key});

  @override
  State<GetDesigner> createState() => _GetDesignerState();
}

class _GetDesignerState extends State<GetDesigner> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text('Designer ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('4.5 ratings', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.view_agenda),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AvailableTimeSlots extends StatefulWidget {
  const AvailableTimeSlots({super.key});

  @override
  State<AvailableTimeSlots> createState() => _AvailableTimeSlotsState();
}

class _AvailableTimeSlotsState extends State<AvailableTimeSlots> {
  DateTime selectedDate = DateTime.now();
  List<String> availableSlots = ['10:00 AM', '11:00 AM', '2:00 PM', '3:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Available Time Slots on ${selectedDate.toLocal().toString().split(' ')[0]}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableSlots
              .map(
                (slot) => ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                            'You have booked $slot on ${selectedDate.toLocal().toString().split(' ')[0]}'),
                      ),
                    );
                  },
                  child: Text(slot),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
