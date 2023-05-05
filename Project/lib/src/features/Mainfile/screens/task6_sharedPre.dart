import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPre extends StatefulWidget {
  @override
  _SharedPreState createState() => _SharedPreState();
}

class _SharedPreState extends State<SharedPre> {
  TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    _loadUsername();
    super.initState();
  }

  Future<void> _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "";
    });
  }

  Future<void> _saveUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  void _submitUsername() {
    _saveUsername(_usernameController.text);
    setState(() {
      _username = _usernameController.text;
    });
    _usernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    print(_username);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter your username:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitUsername,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            if (_username != "") ...[
              const Text(
                'Your username is:',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                _username,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
