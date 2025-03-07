import '../../models/modules_model.dart';

abstract class ModuleState {}

class ModuleLoading extends ModuleState {}

class ModuleLoaded extends ModuleState {
  final List<Module> modules;

  ModuleLoaded(this.modules);
}
