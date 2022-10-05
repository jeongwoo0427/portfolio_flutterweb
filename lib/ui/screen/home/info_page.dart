import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(color: colorScheme.background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:
                  ResponsiveValue<double>(context, defaultValue: 43, valueWhen: [const Condition.smallerThan(name: TABLET, value: 34)])
                      .value,
            ),
          )
        ],
      ),
    );
  }
}
