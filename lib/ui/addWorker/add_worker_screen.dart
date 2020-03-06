import 'package:calculate_work_hours_app/database/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../strings.dart';

class AddWorkerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.addAWorker), actions: [
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
          },
        ),
      ]),
      body: new AddWorkerWidget(),
    );
  }
}

class AddWorkerWidget extends StatefulWidget {

  AddWorkerWidget();

  @override
  State<StatefulWidget> createState() =>
      AddWorkerWidgetState();
}

class AddWorkerWidgetState extends State {

  final _formKey = GlobalKey<FormState>();
  final workerNameController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    controller: workerNameController,
                    decoration: new InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: Strings.workerName),
                    validator: (value) {
                      if (value.isEmpty)
                        return Strings.addWorkerNamePlease;
                      else
                        return null;
                    }),
                new SizedBox(height: 20.0),
                new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addWorker(Worker(
                          id: null,
                          name: workerNameController.text,
                          specification: Strings.custom,
                          avatar: null));
                    }
                  },
                  child: Text(Strings.add),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            )));
  }

  void addWorker(Worker worker) {
    final dao = Provider.of<WorkersDao>(context);
    dao.addUser(
        name: worker.name, specification: worker.specification, avatar: "");
    Navigator.pop(context);
  }
}
