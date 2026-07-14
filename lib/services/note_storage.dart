  import '../models/note.dart';

class NoteStorage {
  static final List<NodifyNote> notes = [];

  static void addNote(NodifyNote note) {
    notes.add(note);
  }

  static List<NodifyNote> getNotes() {
    return notes;
  }
}