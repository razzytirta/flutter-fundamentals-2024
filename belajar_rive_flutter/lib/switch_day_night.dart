import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SwitchDayNight extends StatefulWidget {
  @override
  _SwitchDayNightState createState() => _SwitchDayNightState();
}

class _SwitchDayNightState extends State<SwitchDayNight> {
  int state = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: GestureDetector(
        onTap: () {
          if (state == 0) {
            setState(() {
              state = 1;
            });
          } else if (state == 2) {
            setState(() {
              state = 3;
            });
          }
        },
        child: FlareActor(
          "assets/images/switch_daytime.flr",
          animation: (state == 0)
              ? "night_idle"
              : (state == 1)
                  ? "switch_day"
                  : (state == 2) ? "day_idle" : "switch_night",
          callback: (animatonName) {
            if (animatonName == "switch_day") {
              setState(() {
                state = 2;
              });
            } else if (animatonName == "switch_night") {
              setState(() {
                state = 0;
              });
            }
          },
        ),
      ),
    );
  }
}
