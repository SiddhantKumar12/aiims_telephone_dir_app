import 'package:aiims_telephone_directory/component/myText.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Center(
      child: MyText(label: 'HomeScreen'),
    ));
  }
}
