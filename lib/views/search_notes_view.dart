import 'package:flutter/material.dart';

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({Key? key}) : super(key: key);

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
            hintText: 'Search Note....',
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This feature is still in development. Please wait, Thank You!',
        ),
      ),
    );
  }
}
