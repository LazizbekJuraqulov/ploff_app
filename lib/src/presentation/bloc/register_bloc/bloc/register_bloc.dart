

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/remote/confrim_login_maneger.dart';
import 'package:ploff_app/src/data/datasourse/remote/phone_api_manager.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    // on<InitalEvent>((event, emit) {
    //   final state = this.state as Phone;
    //   emit(Phone(state.text, state.code, state.nomer));
    // });

    on<PhoneEvent>((event, emit) async {
      final stat = this.state as Phone;
      final phone = await PhoneApi.postApi("", stat.nomer.text);
      emit(Phone(stat.text, phone, stat.code));
    });
  }
}
