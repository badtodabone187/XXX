import 'package:flutter/material.dart';
import '../services/note_storage.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = NoteStorage.getNotes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Nodify Notes'),
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text('No notes yet'),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(
                      '${note.latitude}, ${note.longitude}\n'
                      'Altitude: ${note.altitude}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}