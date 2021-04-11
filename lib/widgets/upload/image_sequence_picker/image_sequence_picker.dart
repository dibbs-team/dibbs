import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';
import 'new_image.dart';
import 'image_item.dart';
import '../../../lang/my_localizations.dart';
import '../../../design/my_attributes.dart';

// ignore: must_be_immutable
class ImageSequencePicker extends StatelessWidget {
  final _key = new GlobalKey<_ImageSequencePickerStateImpl>();
  final int imagesPerRow;
  final int maxItems;

  //* _imagesWhenDisposed is mutable because it is used for saving the picked
  //* images if the state is disposed before the getter is called.
  List<File>? _imagesWhenDisposed;

  ImageSequencePicker({
    required this.imagesPerRow,
    required this.maxItems,
  });

  //* If the state has not been disposed we get the picked images directly from
  //* the state otherwise we return the images that were picked at disposal.
  List<File>? get result => _key.currentState?.images ?? _imagesWhenDisposed;

  @override
  Widget build(BuildContext context) {
    return _ImageSequencePickerImpl(
      key: _key,
      saveImagesOnDispose: (images) {
        _imagesWhenDisposed = images;
      },
      imagesPerRow: imagesPerRow,
      maxItems: maxItems,
    );
  }
}

/// Implementation of ImageSequencePicker.
/// Seperated to be able to access its state with the given key.
class _ImageSequencePickerImpl extends StatefulWidget {
  final void Function(List<File>) saveImagesOnDispose;
  final int imagesPerRow;
  final int maxItems;

  _ImageSequencePickerImpl({
    required key,
    required this.saveImagesOnDispose,
    required this.imagesPerRow,
    required this.maxItems,
  }) : super(key: key);

  @override
  _ImageSequencePickerStateImpl createState() =>
      _ImageSequencePickerStateImpl();
}

class _ImageSequencePickerStateImpl extends State<_ImageSequencePickerImpl> {
  List<File> images = [];
  final picker = ImagePicker();

  @override
  void dispose() {
    super.dispose();
    widget.saveImagesOnDispose(images);
  }

  /// Let's the user pick an image with the given method and saves it.
  Future<void> _pickImage(ImageSource method) async {
    final maxHeight = 1600.0;
    final imageFile = await picker.getImage(
      source: method,
      maxHeight: maxHeight,
      maxWidth: maxHeight * MyAttributes.imageAspectRatio,
    );

    if (imageFile != null) {
      //* imageFile can be null when the user for example cancels.
      setState(() {
        images.add(File(imageFile.path));
      });
    }
  }

  /// Updates image list based on reorder.
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // Can't move image beyond new image item.
      newIndex = min(newIndex, images.length - 1);

      File image = images.removeAt(oldIndex);
      images.insert(newIndex, image);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return LayoutBuilder(builder: (ctx, constraints) {
      final spacing = 16.0;
      final itemWidth =
          (constraints.maxWidth.floor() - (widget.imagesPerRow - 1) * spacing) /
              widget.imagesPerRow;
      List<Widget> items = [];

      // Create image items for each image.
      items.addAll(images
          .map(
            (image) => Container(width: itemWidth, child: ImageItem(image)),
          )
          .toList());

      // Add as many new image items as there are images left to pick.
      final newImage = Container(
        width: itemWidth,
        child: NewImage(
          newCameraImage: () => _pickImage(ImageSource.camera),
          newGalleryImage: () => _pickImage(ImageSource.gallery),
        ),
      );
      for (var i = images.length; i < widget.maxItems; ++i) {
        items.add(newImage);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReorderableWrap(
            spacing: spacing,
            runSpacing: spacing,
            children: items,
            onReorder: _onReorder,
            buildDraggableFeedback: (context, constraints, child) => Container(
              child: child,
              color: Colors.transparent,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            l10n.listAdImagesInfo(images.length),
          )
        ],
      );
    });
  }
}
