import 'package:calculate_work_hours_app/ui/worker_main_functional.dart';
import 'package:calculate_work_hours_app/ui/workersList/workers_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'strings.dart';
import 'database/moor_database.dart';
import 'ui/addWorker/add_worker_screen.dart';
import 'ui/workersList/worker_list_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    return MultiProvider(
      providers: [
        Provider(builder: (_) => db.workersDao)
      ],
      child: MaterialApp(
        routes: {
          WorkersMainFunctional.routeName: (context) => WorkersMainFunctional()
        },
        debugShowCheckedModeBanner: false,
        title: Strings.listOfWorkers,
        home: WorkersList(),
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
      ),
    );
  }
}

class WorkersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text(Strings.listOfWorkers), actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddWorkerScreen()));
            },
          ),
        ]),
        body: WorkerListBuilder(WorkersListRepository(
            Provider.of<WorkersDao>(context).watchAllWorkers)));
  }
}
