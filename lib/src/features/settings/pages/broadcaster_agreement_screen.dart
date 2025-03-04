import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class BroadcasterAgreementScreen extends StatelessWidget {
  const BroadcasterAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(98),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                'Broadcaster Agreement',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).surface,
                    fontWeight: FontWeight.w700),
              ),
            ),
            backgroundColor: colorScheme(context).primary,
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Broadcaster Agreement',
                    style: textTheme(context).titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(
                  height: 6,
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tortor augue, suscipit a eleifend eu, dignissim sollicitudin purus. Proin eget ante consectetur, sagittis eros in, consectetur dui. Vestibulum sollicitudin diam et diam lacinia, a porta augue dapibus. Duis varius lorem vel elit molestie, nec dignissim velit cursus. Phasellus at blandit tellus. Duis vel metus eu turpis lobortis iaculis. Pellentesque id nisl aliquet, suscipit magna fermentum, tristique arcu. ',
                    style: textTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        color:
                            colorScheme(context).onSurface.withOpacity(0.5))),
                const SizedBox(
                  height: 16,
                ),
                Text('Service Content',
                    style: textTheme(context).titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(
                  height: 6,
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tortor augue, suscipit a eleifend eu, dignissim sollicitudin purus. Proin eget ante consectetur, sagittis eros in, consectetur dui. Vestibulum sollicitudin diam et diam lacinia, a porta augue dapibus. Duis varius lorem vel elit molestie, nec dignissim velit cursus. Phasellus at blandit tellus. Duis vel metus eu turpis lobortis iaculis. Pellentesque id nisl aliquet, suscipit magna fermentum, tristique arcu. ',
                    style: textTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        color:
                            colorScheme(context).onSurface.withOpacity(0.5))),
              ],
            )));
  }
}
