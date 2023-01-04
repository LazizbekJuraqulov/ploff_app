

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/remote/confrim_login_maneger.dart';
import 'package:ploff_app/src/data/datasourse/remote/phone_api_manager.dart';
import 'package:ploff_app/src/data/datasourse/remote/register_confrim.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
  
     on<RegisterInitialEvent>((event, emit) {
      emit(Phone());
    });
    on<SignNumberEvent>((event, emit)async {
      final state = this.state as Phone;
      await PhoneApi.postApi(event.context, state.numberController.text);
    });
    on<SignNameEvent>((event, emit)async {
      final state = this.state as Phone;
      await ConfirmLoginApi.postApi ( state.nameController.text, state.numberController.text,);
    });
    on<RegisterConfirmEvent>((event, emit)async {
      final state = this.state as Phone;
      await RegisterApi.registerApi(state.codeController.text, state.numberController.text);  
    });
  }
}
