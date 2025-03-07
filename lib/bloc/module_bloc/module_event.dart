abstract class ModuleEvent {}

class LoadModules extends ModuleEvent {}

class UnlockModule extends ModuleEvent {
  final int index;

  UnlockModule(this.index);
}
