import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_jocks/controller/jock_screen_controller.dart';

class JockScreen extends StatelessWidget {
  const JockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<JockScreenController>().get();
        },
        child: context.watch<JockScreenController>().isLoding
            ? CircularProgressIndicator()
            : Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(context
                .watch<JockScreenController>()
                .jockObj
                ?.type
                .toString()
                .toUpperCase() ??
            ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context
                        .watch<JockScreenController>()
                        .jockObj
                        ?.setup
                        .toString() ??
                    "",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                  context
                          .watch<JockScreenController>()
                          .jockObj
                          ?.punchline
                          .toString() ??
                      "",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25))
            ],
          ),
        ),
      ),
    );
  }
}
