import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//
ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color(0xffffffff),
  secondary: Color(0xff8ebdbd),
  surface: Color(0xff007fff),
  background: Color(0xff0a1829),
  error: Color(0xff1e4976),
  onPrimary: Color(0xff007efd),
  onSecondary: Color(0xff0a1929),
  onSurface: Color(0xff000000),
  onBackground: Color(0xff0a1829),
  onError: Color(0xff000000),
  brightness: Brightness.light,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.pink,
      ),
      title: 'Flutter Firebase',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final name = TextEditingController();
  final date = TextEditingController();
  final text = TextEditingController();
  final source = TextEditingController();
  final url_origin = TextEditingController();
  final url = TextEditingController();
  final img_link = TextEditingController();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers horizontally
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.book,
                color: Theme.of(context).colorScheme.onPrimary),
            const SizedBox(
              width: 3,
            ),
            Text(
              "Ma Veille",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    body: const ArticleData(),
    floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context)
          {
            return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // Centers horizontally
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.pen,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onPrimary),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              " Ajouter un article",
                              style: TextStyle(
                                color: Color(0xff007efd),
                                fontSize: 25,
                              ),
                            ),

                          ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Titre : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: name,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Date : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: date,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Résumé : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: text,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Source : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: source,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Lien source : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: url_origin,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Lien : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: url,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color(0xff132f4c),
                                      width: 1.0
                                  )
                              ),
                              title: Row(
                                children: [
                                  const Text("Image : ", style: TextStyle(
                                      color: Color(0xffb2bac2))),
                                  Expanded(child: TextField(
                                    textInputAction: TextInputAction.done,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    controller: img_link,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 70
                            ),
                            ElevatedButton(onPressed: () async {
                              QuerySnapshot articleCollection = await
                              FirebaseFirestore.instance.collection('Article').get();
                              int articleCount = articleCollection.size;
                              int count = articleCount + 1;
                              log(count);
                              FirebaseFirestore.instance.collection('Article').doc(count.toString())
                                  .set({
                                'name': name.value.text,
                                'date': date.value.text,
                                'text': text.value.text,
                                'source': source.value.text,
                                'url_origin': url_origin.value.text,
                                'url': url.value.text,
                                'img_link' : img_link.value.text,
                              });
                              name.clear();
                              date.clear();
                              text.clear();
                              source.clear();
                              url_origin.clear();
                              url.clear();
                              Navigator.pop(context);
                            }, child: const Text('OK'),
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                primary: Theme
                                    .of(context)
                                    .colorScheme
                                    .surface,
                                onPrimary: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],

                  ),

                ),
                shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
          backgroundColor: const Color(0xFF0a1829),
            );
          });
          // Add your onPressed code here!
        },
        label: const Text('Ajouter un article'),
        foregroundColor: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

class ArticleData extends StatefulWidget {
  const ArticleData({Key? key}) : super(key: key);

  @override
  _ArticleDataState createState() => _ArticleDataState();
}
class _ArticleDataState extends State<ArticleData> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Article').snapshots();
  ValueNotifier<int> index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (_, int index) {
            var content = snapshot.data?.docs[index]["text"];
            var name = snapshot.data?.docs[index]["name"];
            return Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface),
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  title: Text(
                   name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Wrap(
                    children: <Widget>[
                      Text(content,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary))
                    ],
                  ),
                  trailing: IconButton(
            icon: const Icon(FontAwesomeIcons.solidTrashCan,
                      color: Colors.blue, size: 25.0), onPressed: () {
                    // FirebaseFirestore.instance.collection("Article").doc(snapshot.data!.docs[index].reference.id.toString()).delete().then(
                    //       (doc) => showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) => _buildPopupDialog(context),
                    //       )
                    // );
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: const Color(0xff007efd),
                      title: const Text('Suppression', style: TextStyle(color: Colors.white),),
                      content: const Text("Êtes-vous sûr de vouloir supprimer l'article ?", style: TextStyle(color: Colors.white),),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Annuler'),
                          child: const Text('Annuler', style: TextStyle(color: Colors.white))
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection("Article").doc(snapshot.data!.docs[index].reference.id.toString()).delete();
                            Navigator.pop(context);
                        },

                          child: const Text('OK', style: TextStyle(
                              color: Colors.white),
                        ),
                      ),
                    ]));
                  },
            ),
            ),
          ));
        },
        );
      },
    );
  }
}