import 'package:calculate_work_hours_app/core/bloc.dart';
import 'package:calculate_work_hours_app/ui/workersList/workers_list_repository.dart';

class WorkersListBloc extends Bloc {
  final WorkersListRepository _repository;

  WorkersListBloc(this._repository){
    getItems(_repository.getWorkersList());
  }
}
