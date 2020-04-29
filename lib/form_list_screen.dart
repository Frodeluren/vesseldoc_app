import 'package:flutter/material.dart';
import 'package:vesseldoc_app/form_fill.dart';
import 'package:vesseldoc_app/form_structure.dart';
import 'package:vesseldoc_app/tools.dart';

class FormListScreen extends StatefulWidget {
  @override
  _FormListScreenState createState() => _FormListScreenState();
}

class _FormListScreenState extends State<FormListScreen> {
  @override
  void initState() {
    super.initState();
    _future = tools.getListOfAvailableFormStructures();
  }

  var tools = Tools();
  Future<List<FormStructure>> _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Select form structure"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
          color: Color.fromARGB(255, 30, 63, 90),
          child: Center(
              child: Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: buildList()))),
    );
  }

  Widget buildList() {
    return Container(
      child: FutureBuilder<List<FormStructure>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  FormStructure formStruct = snapshot.data[index];
                  return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  FormFillerScreen(formStructure: formStruct))),
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(formStruct.name),
                          ),
                        ),
                      ));
                });
          }
          else{
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
