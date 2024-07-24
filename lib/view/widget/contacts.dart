import 'dart:convert';
import 'package:aiims_telephone_directory/component/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modal/helpline_number.dart'; // For rootBundle

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<HelplineNumberModal> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    String jsonString = await rootBundle.loadString('assets/contacts.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<HelplineNumberModal> loadedContacts =
        jsonList.map((json) => HelplineNumberModal.fromJson(json)).toList();

    setState(() {
      contacts = loadedContacts;
    });
  }

  void showContactModal(BuildContext context, HelplineNumberModal contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(contact.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Phone: ${contact.phone}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchPhoneDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 5.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          width: double.maxFinite,
          color: Colors.green,
          child: MyText(
            alignment: true,
            label: 'HelpLine Number',
            fontColor: Colors.white,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              HelplineNumberModal contact = contacts[index];
              return ListTile(
                tileColor: Colors.white,
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  onPressed: () {
                    _launchPhoneDialer(contact.phone);
                  },
                  icon: CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 18.sp,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showContactModal(context, contact);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
