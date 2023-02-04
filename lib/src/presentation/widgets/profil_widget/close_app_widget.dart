import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NavbarBloc>();
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 80),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          actionsAlignment: MainAxisAlignment.center,
                          actionsPadding: EdgeInsets.only(bottom: 16),
                          contentPadding: EdgeInsets.only(left: 16, right: 16),
                          title: const Center(
                            child: Text(
                              "Bнимание!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0000000),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          content: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Вы уверены, что хотите удалить учётную записъ ?",
                              style: TextStyle(
                                  color: Color(0xff858585),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          actions: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 40, top: 14, right: 40, bottom: 14),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF2F2F2),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Text(
                                    "Нет",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff0000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                                onTap: () async {
                                    Navigator.pop(context);
                                  bloc.add(CloseTranferEvent(isBool: false));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 40, top: 14, right: 40, bottom: 14),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5C109),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Text(
                                    "Да",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff0000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ],
                        );
                      }));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffffffff),
                  ),
                  child: const Text(
                    "Выйти",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffF2271C),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(
                      color: Color(0xff858585),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
