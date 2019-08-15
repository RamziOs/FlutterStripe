import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Identify uniquely the form state

  String _userName,
      _email,
      _password; // We declare all the variables in 1 line :-)

  Widget _showTitle() => Text(
        'Register',
        style: Theme.of(context).textTheme.headline,
      );

  Widget _showUserNameInput() => Padding(
        padding: EdgeInsets.only(top: 40),
        child: TextFormField(
          validator: (value) =>
              value.length < 6 ? 'Username too short !' : null,
          onSaved: (value) => _userName = value,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter username (min length 6)',
            icon: Icon(
              Icons.face,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget _showEmailInput() => Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextFormField(
          validator: (value) => !value.contains('@') ? 'Invalid email' : null,
          onSaved: (value) => _email = value,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter a valid email',
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget _showPasswordInput() => Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextFormField(
          validator: (value) =>
              value.length < 6 ? 'Password too short !' : null,
          onSaved: (value) => _password = value,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter password (min length 6)',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget _showFormActions() => Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Submit',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.black),
              ),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _submit,
            ),
            FlatButton(
              child: Text('Existing user ? Login'),
              onPressed: () {},
            )
          ],
        ),
      );

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _showTitle(),
                  _showUserNameInput(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}