import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';

@immutable
class CloudNote {
  final String documentId;
  final String ownerUserId;
  final String text;
  final String title;

  const CloudNote({
    required this.documentId,
    required this.ownerUserId,
    required this.text,
    required this.title,
  });

  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        text = snapshot.data()[textFieldName] as String,
        title = snapshot.data()[noteTitleFieldName] as String;
}
