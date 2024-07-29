import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:noteapp/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{

  static late Isar isar;

  //INITIALIZING THE DB
static Future<void> initialized() async{

  final dir= await getApplicationDocumentsDirectory();

  isar=await Isar.open(
    [NoteSchema],
    directory: dir.path,
  );

  }


  //list of notes in begibning

  final List<Note> currentNotes=[];

  //CREATE
  Future<void> addNote(String textFromUser) async {

    //create
    final newNote= Note()..text = textFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //reread from db
    fetchNotes();

  }

  //READ

 Future<void> fetchNotes() async{

    List<Note> fetchNotes =await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);

    notifyListeners();

 }


  //UPDATE
  Future<void> updateNote(int id, String newText) async{

    final existingNote = await isar.notes.get(id);
    if (existingNote != null){
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }

  }



  //DELETE

Future<void> deleteNote(int id) async{
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
}


}