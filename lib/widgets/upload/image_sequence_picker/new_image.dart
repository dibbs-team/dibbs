import 'package:dibbs/design/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../design/my_attributes.dart';
import '../../../lang/my_localizations.dart';

/// Unmovable list item for adding a new image.
class NewImage extends StatelessWidget {
  final Key key = UniqueKey();
  final void Function() newGalleryImage;
  final void Function() newCameraImage;

  NewImage({
    required this.newGalleryImage,
    required this.newCameraImage,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: MyAttributes.borderRadiusTop,
                  ),
                  context: context,
                  builder: (ctx) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton.icon(
                                label: Text(
                                  l10n.camera,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: MyColors.black,
                                ),
                                onPressed: () {
                                  newCameraImage();
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.fromHeight(70),
                                ),
                              ),
                              Divider(height: 8),
                              TextButton.icon(
                                label: Text(
                                  l10n.gallery,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.fromHeight(70),
                                ),
                                icon: Icon(
                                  Icons.photo,
                                  color: MyColors.black,
                                ),
                                onPressed: () {
                                  newGalleryImage();
                                  Navigator.of(context).pop();
                                },
                              ),
                              Divider(height: 8),
                            ],
                          ),
                        ),
                      ],
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
