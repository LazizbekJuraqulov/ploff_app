import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfil extends StatefulWidget {
  EditProfil({
    super.key,required this.namecontroller,//required this.nomercontroller
  });
  TextEditingController namecontroller = TextEditingController();
  //TextEditingController nomercontroller = TextEditingController();

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Редактировать профиль",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                Container(
                  height: 292,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48,
                        child: TextFormField(
                          controller: widget.namecontroller,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff858585),
                                fontWeight: FontWeight.w400),
                            fillColor: const Color(0xffF5F5F5),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //     Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
          //           child: ElevatedButton(
          //             style:ElevatedButton.styleFrom(
          //               minimumSize: Size(MediaQuery.of(context).size.width, 52),
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          //             ),

          //             onPressed: (){}, child: Text("Сохранить",style:  TextStyle(
          //           fontSize: 15,
          //           fontWeight: FontWeight.w600,
          //           color: Color(0xff000000)),)),
          //         )
          //       ],
          //     )
        ],
      ),
    );
  }
}
