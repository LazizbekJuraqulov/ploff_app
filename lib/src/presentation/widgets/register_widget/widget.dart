import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';

import '../../../constants/constans.dart';
import 'notficion_widget.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocPhone = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is Phone) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 46, left: 16, right: 16),
              child: Column(
                children: [
                  const Gap(24),
                  Container(
                    height: 33,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Регистрация",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(24),
                  Spacer(),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Номер телефона',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                  const Gap(4),
                  TextField(
                    autofocus: true,
                    controller: state.numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: '+998',
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        blocPhone.add(SignNumberEvent(context));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return NotficionPage(
                        //       token: state.codeController.text);
                        // }));
                      },
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Продолжить",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
