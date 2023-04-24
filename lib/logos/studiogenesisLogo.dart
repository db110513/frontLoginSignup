import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StudiogenesisLogo extends StatelessWidget {

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network("https://www.dipta.cat/empren/sites/empren/files/logo-studiogenesis-768x432.png",width: 350,),
        "Make A List of your task".text.light.white.wider.lg.make(),
      ],
    );
  }
}