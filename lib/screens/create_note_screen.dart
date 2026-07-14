import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/location_service.dart';
import '../services/note_storage.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: noteController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Your note',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
  onPressed: () async {
    final position =
        await LocationService.getCurrentLocation();

    final newNote = NodifyNote(
      title: titleController.text,
      text: noteController.text,
      createdAt: DateTime.now(),
      latitude: position?.latitude,
      longitude: position?.longitude,
      altitude: position?.altitude,
    );

NoteStorage.addNote(newNote);

print('Saved to Nodify');
  },
  icon: const Icon(Icons.save),
  label: const Text('Save Note'),
),
          ],
        ),
      ),
    );
  }
}