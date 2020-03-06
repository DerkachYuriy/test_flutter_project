import 'package:calculate_work_hours_app/core/bloc.dart';

import 'package:calculate_work_hours_app/database/moor_database.dart';
import 'package:calculate_work_hours_app/ui/workersList/workers_list_repository.dart';
import 'package:calculate_work_hours_app/ui/workersList/workers_list_bloc.dart';
import 'package:calculate_work_hours_app/ui/workersList/worker_list_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkerListBuilder extends StatefulWidget {
  WorkerListBuilder(this._repository);

  final WorkersListRepository _repository;

  @override
  createState() => new WorkersListState();
}

class WorkersListState extends State<WorkerListBuilder> {
  WorkersListBloc _workersListBloc;

  @override
  void dispose() {
    _workersListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _workersListBloc = WorkersListBloc(widget._repository);
    return StreamBuilder<BlocState>(
        stream: _workersListBloc.items,
        initialData: _workersListBloc.currentState,
        builder: _buildBody);
  }

  Widget _buildBody(
      BuildContext context, AsyncSnapshot<BlocState> snapshot) {
    if (snapshot.data.items == null) return _buildLoading();

    return _buildContent(snapshot.data.items);
  }

  Widget _buildContent(List<Worker> workers) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 4, left: 4, right: 4),
      itemCount: workers.length,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.only(left: 3, top: 2, right: 3, bottom: 2),
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: new WorkerListLayout(workers[index])));
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
