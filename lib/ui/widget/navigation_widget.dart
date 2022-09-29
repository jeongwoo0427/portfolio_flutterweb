import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'scaffold/constrained_layout.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(ResponsiveWrapper.of(context).scaledWidth);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
        height: 55,
        width: double.infinity,
        color: colorScheme.primary,
        padding: ResponsiveValue<EdgeInsets>(context,
            defaultValue: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            valueWhen: [const Condition.smallerThan(name: TABLET, value: EdgeInsets.symmetric(horizontal: 10))]).value,
        child: ConstrainedLayout(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Iz Folio',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                  ? Icon(Icons.menu)
                  : Row(
                      children: const [
                        Text('hi'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('hello')
                      ],
                    )
            ],
          ),
        ));
  }
}
