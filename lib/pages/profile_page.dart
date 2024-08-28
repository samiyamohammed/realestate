import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  void _showDeactivateAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cancel_outlined, size: 60, color: Colors.blue),
              SizedBox(height: 16),
              Text(
                'Your account will be deactivated immediately.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'You will have 3 weeks to reactivate your account. After 3 weeks, your account and all associated data will be permanently deleted.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // deactivate account logic here
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              //save Profile button functionality
            },
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
          SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (String result) {
              if (result == 'delete') {
                _showDeactivateAccountDialog(context);
                print('Profile deleted');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('Delete Profile'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100)),
                        ),
                      ),
                      Positioned(
                        top: -9,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () {
                            //profile pic change functionality
                          },
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 91, 53, 175),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTextField('Full Name', 'Full Name'),
                        SizedBox(height: 20),
                        _buildTextField('Password', 'Password',
                            obscureText: true),
                        SizedBox(height: 20),
                        _buildTextField('Email', 'Email Address'),
                        SizedBox(height: 20),
                        _buildPhoneNumberField(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Recently Viewed Properties'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //RVP Functionality
                    },
                  ),
                  ListTile(
                    title: Text('Need Help?'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //Need Help Functionality
                    },
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // log out pop-up functionality
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      //color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Log Out', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.phone, color: Colors.black),
              SizedBox(width: 4),
              Text('+251'),
            ],
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: _buildTextField('Phone Number', '###-###-####'),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    ));
