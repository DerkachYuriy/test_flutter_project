import 'package:calculate_work_hours_app/database/moor_database.dart';
import 'package:calculate_work_hours_app/ui/workerProfile/worker_by_id_bloc.dart';
import 'package:calculate_work_hours_app/ui/workerProfile/worker_by_id_repository.dart';
import 'package:calculate_work_hours_app/ui/workerProfile/worker_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../strings.dart';

class WorkersMainFunctional extends StatefulWidget {
  WorkersMainFunctional({Key key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  _WorkersMainFunctionalWidgetState createState() =>
      _WorkersMainFunctionalWidgetState();
}

class _WorkersMainFunctionalWidgetState extends State<WorkersMainFunctional> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    
    WorkerByIdBloc workerByIdBloc = new WorkerByIdBloc(WorkerByIdRepository(Provider.of<WorkersDao>(context).getWorkerById(args.workerId)));

    List<Widget> _widgetOptions = <Widget>[
      WorkerProfileScreen(workerByIdBloc),
      Text(
        Strings.settings,
        style: optionStyle,
      ),
      Text(
        Strings.settings,
        style: optionStyle,
      ),
    ];


    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text(Strings.settings),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            title: Text(Strings.settings),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(Strings.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ScreenArguments {
  final int workerId;

  ScreenArguments(this.workerId);
}
