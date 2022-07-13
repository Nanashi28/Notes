import 'package:flutter/material.dart';

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({Key? key}) : super(key: key);

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Search'),
      ),
      body: const Text('still testing'),
    );
  }
}
