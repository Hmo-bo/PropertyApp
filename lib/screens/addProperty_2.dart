import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class addProperty_2 extends StatefulWidget {
  const addProperty_2({Key? key}) : super(key: key);

  @override
  State<addProperty_2> createState() => _addProperty_2State();
}

class _addProperty_2State extends State<addProperty_2> {
  final _formKey = GlobalKey<FormState>();
  List States = [for (var i = 1; i <= 58; i++) i];
  int state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'This Field is Required' : null,
                  // controller: _roomsController,
                  decoration: const InputDecoration(
                    icon: Icon(MdiIcons.bed),
                    labelText: 'Number of Rooms',
                  ),
                ),
                SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
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
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'This Field is Required' : null,
                  // controller: _roomsController,
                  decoration: const InputDecoration(
                    icon: Icon(MdiIcons.bed),
                    labelText: 'Number of Rooms',
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
