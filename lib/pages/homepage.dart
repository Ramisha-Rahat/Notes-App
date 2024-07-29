import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:noteapp/pages/login.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();



  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your note',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),

                borderSide: BorderSide(
                color: Colors.grey,
                // Customize border color when not focused
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black87,
                // Customize border color when focused
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          cursorColor: Colors.green, // Customize cursor color
          controller: textController,
        ),
          actions: [
            MaterialButton(
              onPressed: () {
                Provider.of<NoteDatabase>(context, listen: false)
                    .addNote(textController.text);
                textController.clear();
                Navigator.pop(context);
              },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: 100,
                        child: Text
                          ('Save',
                          style: TextStyle(color: Colors.black87, fontSize: 20,),)),
                  ),
                ),
          ],
        ));
  }

//delete note
  void deleteNote(int id){

    //context.read<NoteDatabase>().deleteNote(id);
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            color: Colors.black,
          child: Container(
            height: 100,
            child:Column(
              children: [
                Text('Are you Sure You wan to delete Your Note?',style: TextStyle(color: Colors.white, fontSize: 16,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Distribute buttons evenly
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<NoteDatabase>().deleteNote(id);
                        Navigator.pop(context);
                      },
                      child: Text('Yes'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, // Set button text color
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Dismiss the dialog
                      child: Text('Cancel'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, // Set button text color
                      ),
                    ),
                  ],
                )
              ],
          ),
        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Add rounded corners
          ),
          elevation: 5, // Add a slight shadow for depth
        ),
      ),
    )

    );
  }

  //edit note

  void updateNote(Note note){

    textController.text= note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Your Note', style: TextStyle(fontSize: 20),),
        content:  SizedBox(
          height: 150,
          child: TextField(
                decoration: InputDecoration(
                hintText: 'Enter your note',

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),

            borderSide: BorderSide(
              color: Colors.grey,
              // Customize border color when not focused
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black87,
              // Customize border color when focused
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
                ),
                cursorColor: Colors.green, // Customize cursor color
                controller: textController,
            maxLines: null, // Allow unlimited lines
            keyboardType: TextInputType.multiline,
              ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text('Update', style: TextStyle(color: Colors.black87, fontSize: 20,),),
          ),
        ],
      ),
    );


  }




  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    final currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 20,
        title: Text(
          'NOTES',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add, color: Colors.green,size:30),
      ),


      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            DrawerHeader(
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(0), // Adjust radius as needed
                  child: Image.asset(
                    'assets/images/note.png',
                    fit: BoxFit.cover, // Adjust image fitting mode
                  ),
                ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.home, size: 25,color: Colors.white),
                SizedBox(width: 20,),
                Text('Home' ,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.book_online_sharp, size: 25,color: Colors.white),
                SizedBox(width: 20,),
                Text('Notes' , style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 20),
                    ),

                  ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.settings, size: 25,color: Colors.white),
                SizedBox(width: 20,),
                Text('Setting' ,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 20),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.black), // Transparent icon
                      SizedBox(width: 5),
                      Text(
                        'Log Out',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: 1, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.transparent, // Set button background color to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Add rounded corners
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),

      ),

      body: Container(
        color: Colors.black87,

        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('YOUR NOTES  ', style: TextStyle(color: Colors.white,fontSize: 22),),
                  Icon(Icons.edit_calendar, color: Colors.white,),
        ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GridView.count(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 15.0, // Spacing between items
                  mainAxisSpacing: 15.0, // Spacing between rows
                  childAspectRatio: 1.5, // Adjust based on your note card's size
                  children: List.generate(currentNotes.length, (index) {
                    final note = currentNotes[index];
                    return SingleChildScrollView(
                      child: Card(
                        color: Colors.grey.shade400,
                        child: InkWell(
                          onTap: () => updateNote(note), // Handle card tap event
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column( // Adjust layout if you prefer rows
                              children: [
                                Text(note.text),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Align buttons to right
                                  children: [
                                 IconButton(onPressed: () => updateNote(note), icon: Icon(Icons.edit,)),
                                 IconButton(onPressed: () => deleteNote(note.id),
                                     icon: Icon(Icons.delete, color: Colors.red.shade900,)),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// IconButton(onPressed: () => updateNote(note), icon: Icon(Icons.edit,)),
//IconButton(onPressed: () => deleteNote(note.id), icon: Icon(Icons.delete, color: Colors.red.shade200,)),

