import 'package:calculate_work_hours_app/database/moor_database.dart';
import 'package:flutter/material.dart';

import '../worker_main_functional.dart';

class WorkerListLayout extends StatelessWidget {
  final Worker _worker;

  WorkerListLayout(this._worker);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListTile(
        subtitle: Text(_worker.specification,
            style: TextStyle(fontWeight: FontWeight.w300)),
        title:
            Text(_worker.name, style: TextStyle(fontWeight: FontWeight.w400)),
        leading: CircleAvatar(
          child: Text(_worker.id.toString()),
        ),
        trailing: Text(''),
        onTap: () {
          Navigator.pushNamed(
            context,
            WorkersMainFunctional.routeName,
            arguments: ScreenArguments(_worker.id),
          );
        },
      ),
    );
  }
}
