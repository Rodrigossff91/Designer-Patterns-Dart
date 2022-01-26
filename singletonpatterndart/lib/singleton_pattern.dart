import 'package:flutter/material.dart';
import 'package:singletonpatterndart/database/connection.dart';

class SingletonPattern extends StatefulWidget {
  const SingletonPattern({Key? key}) : super(key: key);

  @override
  _SingletonPatternState createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {
  @override
  void initState() {
    buscarNomes();
    // int i = 0;
    // while (i < 10) {
    //   print(SingletonRaiz.instance.id);
    //   print(SingletonFactory().id);
    //   i++;
    // }
    super.initState();
  }

  List<String> nomes = [];
  Future<void> buscarNomes() async {
    var db = await Connection.instance.db;
    var result = await db.rawQuery("select* from teste");
    setState(() {
      nomes = result.map<String>((e) => e['nome'] as String).toList();
    });

    print(nomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Singleton"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var db = await Connection.instance.db;
            await db
                .rawInsert('insert into teste values("Adicionado pelo float)');
            buscarNomes();
          },
        ),
        body: ListView.builder(
          itemCount: nomes.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(nomes[index]),
              ],
            );
          },
        ));
  }

  @override
  void dispose() {
    Connection.instance.closeConnection();
    super.dispose();
  }
}
