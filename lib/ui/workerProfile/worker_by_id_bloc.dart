import 'package:calculate_work_hours_app/core/bloc.dart';
import 'package:calculate_work_hours_app/ui/workerProfile/worker_by_id_repository.dart';

class WorkerByIdBloc extends Bloc {
  final WorkerByIdRepository _repository;

  WorkerByIdBloc(this._repository) {
    getItems(_repository.getUserById());
  }
}
