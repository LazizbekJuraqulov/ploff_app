import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 80),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      content: Container(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Вы хотите выйти из своей учетной записи?"),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(
                                                8),
                                        color: Color(0xfff5f5f5)),
                                    child: Text(
                                      "отмена",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff000000),
                                          fontWeight:
                                              FontWeight.w600),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(
                                                8),
                                        color: Color(0xffFFCC00)),
                                    child: Text(
                                      "выход",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff000000),
                                          fontWeight:
                                              FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
  }
}