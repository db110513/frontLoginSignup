import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonLogo extends StatelessWidget {

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network("https://pr0.nicelocal.es/MbA6U3EBfAZ5ThlejrNRiQ/1120x700,q85/4px-BW84_n0QJGVPszge3NRBsKw-2VcOifrJIjPYFYkOtaCZxxXQ2Rigl9Bn5oeEqluGZYUMXVHEqz3esiJ3F6DdT0umelP2c0i2rMMrsI3Vmbi2T-uAtA",width: 350,),
        "Make A List of your task".text.light.white.wider.lg.make(),
      ],
    );
  }
}