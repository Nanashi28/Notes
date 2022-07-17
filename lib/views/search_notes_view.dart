import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/cloud/cloud_note.dart';
import 'package:notes/services/cloud/cloud_storage_constants.dart';

typedef NoteSearching = void Function(CloudNote note);

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white60,
        ),
        title: TextField(
          controller: _search,
          enableSuggestions: false,
          autocorrect: false,
          maxLines: 1,
          autofocus: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Search for the title of your note....',
          ),
        ),
      ),
      body: const Text(
          'This feature is still in development, please stay tuned! Thank You!'),
    );
  }
}
