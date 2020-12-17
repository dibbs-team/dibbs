import 'package:flutter/material.dart';

import '../../../design/my_attributes.dart';
import '../../../lang/my_localizations.dart';

/// Unmovable list item for adding a new image.
class NewImage extends StatelessWidget {
  final key = UniqueKey();
  final void Function() newGalleryImage;
  final void Function() newCameraImage;

  NewImage({
    @required this.newGalleryImage,
    @required this.newCameraImage,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return GestureDetector(
      onLongPress: () {}, // Override onLongPress to make item unmovable.
      child: AspectRatio(
        aspectRatio: MyAttributes.imageAspectRatio,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: MyAttributes.borderRadius,
          ),
          child: Center(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton.icon(
                            label: Text(l10n.camera),
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              newCameraImage();
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton.icon(
                            label: Text(l10n.gallery),
                            icon: Icon(Icons.photo),
                            onPressed: () {
                              newGalleryImage();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
