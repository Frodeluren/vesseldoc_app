import 'package:flutter/material.dart';
import 'package:vesseldoc_app/form_creator.dart';
import 'package:vesseldoc_app/tools.dart';

class DatatableItemWidget extends StatefulWidget {
  @override
  _DatatableItemWidgetState createState() => _DatatableItemWidgetState();

  Widget currentWidget;
  String keyWidget;
  String photoAttached;
  TextEditingController fieldTextController;
  String fieldType;
  bool isRequired;
  String keySuper;
  
  DatatableItemWidget({this.keyWidget,this.fieldType, this.fieldTextController, this.photoAttached, this.isRequired, this.keySuper}) : super(key: Key(keySuper));
}

class _DatatableItemWidgetState extends State<DatatableItemWidget>  {
  
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tools = Tools();
    return new Dismissible(
          onDismissed: (dir) {
           tools.deleteFromDatatable(widget);
          },
          key: Key(widget.keyWidget),
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        widget.fieldTextController.text,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        widget.fieldType,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        widget.photoAttached,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}