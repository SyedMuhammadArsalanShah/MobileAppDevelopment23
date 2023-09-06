import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  var firstdatecont = TextEditingController();
  var lastdatecont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.headphones))],
      ),
      body: Column(
        children: [
          TextField(
            controller: firstdatecont,
          ),
          TextField(
            controller: lastdatecont,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(int.parse(firstdatecont.text)),
                    lastDate: DateTime(int.parse(lastdatecont.text)));

                if (dateTime != null) {
                  print(" selected  ${dateTime.day}");
                  data = dateTime.day;

                  setState(() {});
                }
              },
              child: Text("Show Date  Picker")),
          Text("$data"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                TimeOfDay? timepicker = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial);

                if (timepicker != null) {
                  print(" selected  ${timepicker.hour}");
               
                }
              },
              child: Text("Time Picker"))
        ],
      ),
    );
  }
}
