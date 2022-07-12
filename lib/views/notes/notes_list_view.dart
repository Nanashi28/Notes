import 'package:flutter/material.dart';
import 'package:notes/services/cloud/cloud_note.dart';
import '../../utilities/dialogs/delete_dialog.dart';

typedef NoteCallback = void Function(CloudNote note);

class NotesListView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

  const NotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(0.5),
          child: DecoratedBox(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            child: ListTile(
              onTap: () {
                onTap(note);
              },
              title: Text(
                note.title,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () async {
                  final shouldDelete = await showDeleteDialog(context);
                  if (shouldDelete) {
                    onDeleteNote(note);
                  }
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ),
        );
      },
    );
  }
}
