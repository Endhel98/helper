import 'package:flutter/material.dart';
import 'package:helper/pages/class_info_page.dart';

class AppBarWidget extends StatelessWidget {
  final Function function;

  AppBarWidget({@required this.function});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleSpacing: 0.0,
      title: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Image.asset(
          "images/logo.png",
          height: 300.0,
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<Options>(
          itemBuilder: (context) => <PopupMenuEntry<Options>>[
            const PopupMenuItem<Options>(
              child: Text("Limpar todos os campos"),
              value: Options.cleanFields,
            ),
            const PopupMenuItem<Options>(
              child: Text("Zerar Faltas"),
              value: Options.resetAbsenses,
            ),
            const PopupMenuItem<Options>(
              child: Text("Excluir Matéria"),
              value: Options.deleteClass,
            ),
          ],
          onSelected: function,
        )
      ],
    );
  }
}
