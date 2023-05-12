import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menopal/screens/RegistrationScreen.dart';

import '../../model/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  EditProfileScreen({required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //editing controller
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController.text = widget.user.firstName ?? '';
    _lastNameController.text = widget.user.lastName ?? '';
    _emailController.text = widget.user.email ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saveButton = Material(
      elevation: 5,
      color: Colors.pink,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Text(
          "Save",
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: "First Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateProfile();
                  }
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      )),
    );
  }

  void updateProfile() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> updatedData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
      };

      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(widget.user.uid)
            .update(updatedData);
        Fluttertoast.showToast(msg: "Profile updated successfully");
      } catch (error) {
        Fluttertoast.showToast(msg: "Failed to update profile");
      }
    }
  }
}
