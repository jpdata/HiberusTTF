// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hiberus_ttf/presentation/views/screen2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.name, //babel text
              hintText: AppLocalizations.of(context)!.nameHint, //hint text
              prefixIcon: const Icon(Icons.person), //prefix iocn
              hintStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle: const TextStyle(
                  fontSize: 14, color: Colors.green), //label style
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.surname, //babel text
              hintText: AppLocalizations.of(context)!.surnameHint, //hint text
              prefixIcon: const Icon(Icons.person_2), //prefix iocn
              hintStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle: const TextStyle(
                  fontSize: 14, color: Colors.green), //label style
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email, //babel text
              hintText: AppLocalizations.of(context)!.emailHint, //hint text
              prefixIcon: const Icon(Icons.person_2), //prefix iocn
              hintStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), //hint text style
              labelStyle: const TextStyle(
                  fontSize: 14, color: Colors.green), //label style
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
                    SnackBar(
                        content: Text(AppLocalizations.of(context)!.loading)),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.submit),
            ),
          ),
        ],
      ),
    );
  }
}
