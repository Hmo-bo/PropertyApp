import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property/tool.dart';

class addProperty_2 extends StatefulWidget {
  const addProperty_2({Key? key}) : super(key: key);

  @override
  State<addProperty_2> createState() => _addProperty_2State();
}

class _addProperty_2State extends State<addProperty_2> {
  final _formKey = GlobalKey<FormState>();
  List States = [for (var i = 1; i <= 58; i++) i];
  int state = 16;
  bool value = false;
  String action='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey[100],
            ),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    fontSize: 20
                  ),
                validator: (value) =>
                value!.isEmpty ? 'This Field is Required' : null,
                // controller: _roomsController,
                  textAlign: TextAlign.end,
                decoration: InputDecoration(

                  prefixIcon: Icon(MdiIcons.homeCityOutline,size: 30,),
                  label: Align(
                      alignment: Alignment.centerRight,
                      child: arabtexts(text:'إسم الحي' ))
                ),
              ),
                SizedBox(height: 20,),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                  width: 100,
                  child: DropdownButtonFormField(
                    menuMaxHeight: 300,
                    borderRadius: BorderRadius.circular(25),
                    dropdownColor: Colors.blueGrey,
                    items: States.map(
                          (val) {
                        return DropdownMenuItem<int>(
                          alignment: Alignment.centerRight,
                          value: val,
                          child: Text(
                            val.toString(),
                            style: const TextStyle(fontSize: 22),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          state = val!;
                        },
                      );
                    },
                  ),
                ),
                  SizedBox(width: 10,),
                  arabtexts(text: 'الولاية'),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 100,
                    child: DropdownButtonFormField(
                      menuMaxHeight: 300,
                      // hint: texts(text: 'Select State Code',size: 18,clr: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(25),
                      dropdownColor: Colors.blueGrey,
                      items: States.map(
                            (val) {
                          return DropdownMenuItem<int>(
                            alignment: Alignment.centerRight,
                            value: val,
                            child: Text(
                              val.toString(),
                              style: const TextStyle(fontSize: 22),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                              () {
                            state = val!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  arabtexts(text: 'البلدية'),

                ],
              ),
                SizedBox(height: 20,),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 20
                  ),
                  textAlign: TextAlign.end,
                  validator: (value) =>
                  value!.isEmpty ? 'This Field is Required' : null,
                  // controller: _roomsController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(MdiIcons.cashFast,size: 30,),
                    label: Align(
                      child: arabtexts(text:'السعر',),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: this.value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                    ),
                    arabtexts(text: 'إمكانية الدفع بالتقسيط'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width:  100,
                      child: DropdownButtonFormField(
                        menuMaxHeight: 300,
                        // hint: texts(text: 'Select State Code',size: 18,clr: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25),
                        // dropdownColor: Colors.blueGrey,
                        items: ['كراء','بيع'].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.centerRight,
                              value: val,
                              child: Text(
                                val.toString(),
                                style: const TextStyle(fontSize: 22),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              action = val!;
                              print(action);
                            },
                          );
                        },
                      ),
                    ),
                    arabtexts(text: 'إختيار العملية'),
                  ],
                ),

                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'This Field is Required' : null,
                  // controller: _roomsController,
                  decoration: const InputDecoration(
                    icon: Icon(MdiIcons.bed),
                    labelText: 'Number of Rooms',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
