import 'package:flutter/material.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/cloud/cloud_note.dart';
import 'package:notes/services/cloud/firebase_cloud_storage.dart';
import 'package:notes/views/notes/notes_list_view.dart';
import '../../constants/routes.dart';

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {
  late final TextEditingController _search;
  late final FirebaseCloudStorage _notesService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _search = TextEditingController();
    _notesService = FirebaseCloudStorage();
    _search.addListener(_onSearchChanged);
    super.initState();
  }

  void _onSearchChanged() {
    // Triggers a rebuild whenever the search text changes,
    // so the StreamBuilder's builder re-filters the list.
    setState(() {});
  }

  @override
  void dispose() {
    _search.removeListener(_onSearchChanged);
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
            hintText: 'Search for the title or content of your note....',
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _notesService.allNotes(ownerUserId: userId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allNotes = snapshot.data as Iterable<CloudNote>;
                final query = _search.text.trim().toLowerCase();

                final filteredNotes = query.isEmpty
                    ? allNotes
                    : allNotes.where(
                        (note) =>
                            note.title.toLowerCase().contains(query) ||
                            note.text.toLowerCase().contains(query),
                      );

                if (filteredNotes.isEmpty) {
                  return const Center(
                    child: Text('No notes found.'),
                  );
                }

                return NotesListView(
                  notes: filteredNotes,
                  onDeleteNote: (note) async {
                    await _notesService.deleteNote(
                      documentId: note.documentId,
                    );
                  },
                  onTap: (note) {
                    Navigator.of(context).pushNamed(
                      createOrUpdateNoteRoute,
                      arguments: note,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
