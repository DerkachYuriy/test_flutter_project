import 'package:calculate_work_hours_app/core/bloc.dart';
import 'package:calculate_work_hours_app/database/moor_database.dart';
import 'package:calculate_work_hours_app/ui/workerProfile/worker_by_id_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class WorkerProfileScreen extends StatelessWidget {
  final WorkerByIdBloc _workerByIdBloc;

  WorkerProfileScreen(this._workerByIdBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState>(
        stream: _workerByIdBloc.items,
        initialData: _workerByIdBloc.currentState,
        builder: _buildBody);
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<BlocState> snapshot) {
    if (snapshot.data.items == null) return _buildLoading();
    return _buildContent(snapshot.data.items);
  }

  Widget _buildContent(List<Worker> workers) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(workers[0].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ];
      },
      body: Center(
        child:  Text(Strings.settings),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
