// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hiberus_ttf/presentation/views/screen2.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  MainFormState createState() {
    return MainFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MainFormState extends State<MainForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: "Name", //babel text
              hintText: "Write your firts name", //hint text
              prefixIcon: Icon(Icons.person), //prefix iocn
              hintStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle:
                  TextStyle(fontSize: 14, color: Colors.green), //label style
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Surname", //babel text
              hintText: "Write your last name", //hint text
              prefixIcon: Icon(Icons.person_2), //prefix iocn
              hintStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle:
                  TextStyle(fontSize: 14, color: Colors.green), //label style
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Email", //babel text
              hintText: "Input you email", //hint text
              prefixIcon: Icon(Icons.person_2), //prefix iocn
              hintStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle:
                  TextStyle(fontSize: 14, color: Colors.green), //label style
            ),
            validator: (value) => EmailValidator.validate(value ?? "")
                ? null
                : "Please enter a valid email",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
