import 'package:flutter/material.dart';
import 'package:property/tool.dart';

import 'PropertiesForSale.dart';

class profileDetailles extends StatefulWidget {
  const profileDetailles({Key? key}) : super(key: key);

  @override
  State<profileDetailles> createState() => _profileDetaillesState();
}

class _profileDetaillesState extends State<profileDetailles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: texts(
            text: 'Profile Detailles', clr: Colors.white, fw: FontWeight.bold),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 15),
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/images/bgd.jpg'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        texts(text: '@User_name'),
                        SizedBox(
                          height: 10,
                        ),
                        texts(text: '+213 050 050 050')
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        PropertiesForSale()
      ]),
    );
  }
}
