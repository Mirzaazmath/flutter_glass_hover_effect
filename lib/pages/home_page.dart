import 'package:flutter/material.dart';
import '../repo/data.dart';
import '../widgets/hover_card_widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                for(int i =0; i<wonderList.length; i++)...[
                  HoverCardWidget(
                    title:wonderList[i].title,
                    image: wonderList[i].image,
                    slogan: wonderList[i].slogan,
                    description: wonderList[i].description,
                  )]
              ],
            ),
          ),
        ),
      ),

    );
  }
}
