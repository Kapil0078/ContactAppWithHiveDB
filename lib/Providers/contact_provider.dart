import 'package:contact/Constants/color_const.dart';
import 'package:contact/Model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ContactProvider extends ChangeNotifier {
  //!! Hive

  final hiveDB = Hive.box(contactBox);

  //! Create
  Future<int> createContact2(Contact contact) async {
    final index = await hiveDB.add(contact.toJson());
    return index;
  }

  //! Read
  List<Contact> get contactList => _readContact();

  List<Contact> _readContact() {
    final list =
        hiveDB.values.map((e) => Map<String, dynamic>.from(e)).toList();
    final x = List<Contact>.from(list.map((e) => Contact.fromJson(e)));

    return x;
  }

  //! Update
  Future<void> updateContact({
    required Contact contact,
    required int index,
  }) async {
    await hiveDB.putAt(
      index,
      contact.toJson(),
    );
  }

  //! Delete
  Future<void> deleteContact(int index) async {
    await hiveDB.deleteAt(index);
  }
}
