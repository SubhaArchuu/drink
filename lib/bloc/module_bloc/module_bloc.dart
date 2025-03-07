import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/modules_model.dart';
import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  ModuleBloc() : super(ModuleLoading()) {
    on<LoadModules>((event, emit) async {
      List<Module> modules = [
        Module(title: "Beat Cravings", isLocked: false),
        Module(title: "Practise Imagery", isLocked: false),
        Module(title: "Saying NO", isLocked: false),
        Module(title: "Mindfulness", isLocked: false),
        Module(title: "Guilt and Shame", isLocked: true),
        Module(title: "Relationship Issues", isLocked: true),
        Module(title: "Anger Issues", isLocked: true),
        Module(title: "Practise Imagery", isLocked: true),
      ];
      List<Module> animatedModules = [];
      //emit(ModuleLoaded([]))
      emit(ModuleLoaded(List.from(animatedModules)));


      for (int i = 0; i < modules.length; i++) {
        await Future.delayed(Duration(milliseconds: 100));
        animatedModules.add(modules[i]);
        if (!emit.isDone) {
          emit(ModuleLoaded(List.from(animatedModules))); // Show items progressively
        }
      }
    });

    on<UnlockModule>((event, emit) {
      if (state is ModuleLoaded) {
        List<Module> modules = (state as ModuleLoaded).modules;
        modules[event.index] = modules[event.index].copyWith(isLocked: false);
        emit(ModuleLoaded(List.from(modules)));
      }
    });
  }
}


