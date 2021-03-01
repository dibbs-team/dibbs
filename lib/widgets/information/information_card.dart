import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String body;

  const InformationCard({
    this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          if (body != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  body,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      ),
    );
  }
}
