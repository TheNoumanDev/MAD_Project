import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

//import 'package:practice_app/constants/routes.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();
  final genderController = TextEditingController();
  String _selectedGender = "";

  final List<String> _genderOptions = ['Male', 'Female', 'Non-binary', 'Other'];

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Person');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Inserting data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Inserting data in Firebase Realtime Database',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: descriptionController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: statusController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                    hintText: 'Enter phone Number',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedGender.isNotEmpty ? _selectedGender : null,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                      genderController.text = value;
                    });
                  },
                  items: _genderOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> students = {
                      'Name': titleController.text,
                      'Email': descriptionController.text,
                      'Number': statusController.text,
                      'Gender': genderController.text,
                    };

                    dbRef.push().set(students);
                    Navigator.pop(context);
                    // Navigator.of(context)
                    //     .pushNamedAndRemoveUntil(APIViewRoute, (route) => false);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                  child: const Text('Insert Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
