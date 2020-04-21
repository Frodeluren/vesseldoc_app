import 'package:flutter/material.dart';
import 'package:vesseldoc_app/tools.dart';

class FormFillerScreen2 extends StatefulWidget {
  @override
  _FormFillerScreen2State createState() => _FormFillerScreen2State();
  String title;
  FormFillerScreen2({this.title});
}

class _FormFillerScreen2State extends State<FormFillerScreen2> {
  @override
  void initState() {
    super.initState();
  }

  var tools = Tools();
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text(
          widget.title ?? "",
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      body: new SingleChildScrollView(
        child: Container(
          child: new Center(
            child: Container(
              //height: MediaQuery.of(context).size.height*0.9,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: getListOfDynamicWidgets()),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getListOfDynamicWidgets() {
    List<Widget> dynamicWidgetList = new List<Widget>();
    var test = tools.getJsonForm();

    for (var item in test.listOfItems) {
      if (item["field"] == "Header") {
        dynamicWidgetList.add(dynamicHeaderWidget(item["text"]));
      }
      if (item["field"] == "Checkbox") {
        dynamicWidgetList.add(dynamicCheckboxWidget(item["text"]));
      }
      if (item["field"] == "TextField") {
        dynamicWidgetList.add(dynamicTextFieldWidget(item["text"]));
      }
      if (item["field"] == "Slider") {
        dynamicWidgetList.add(dynamicSliderWidget(item["text"]));
      }
    }
    return dynamicWidgetList;
  }

  Widget dynamicHeaderWidget(String title) {
    return Text(
      title,
      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }

  Widget dynamicTextFieldWidget(String title) {
    return Container();
  }

  Widget dynamicSliderWidget(String title) {
  bool sliderValue = false;
    return Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Row(children: <Widget>[
        new Expanded(child: new Text(title)),
        new Switch(
          value: sliderValue,
          onChanged: (bool value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
      ]),
    );
  }

  Widget dynamicCheckboxWidget(String title) {
    return Container();
  }
}
