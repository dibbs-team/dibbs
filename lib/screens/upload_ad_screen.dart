import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';
import '../widgets/upload/upload_step_container.dart';
import '../widgets/upload/ad_type_selector.dart';

class UploadAdScreen extends StatefulWidget {
  @override
  _UploadAdScreenState createState() => _UploadAdScreenState();
}

class _UploadAdScreenState extends State<UploadAdScreen> {
  var _currentStep = 0;
  List<Widget> _steps = [];

  void initFindMode() {
    setState(() {
      // Init find ad steps.
      _steps = [
        Container(),
        Container(),
      ];
      _currentStep += 1; // Navigates to next step.
    });
  }

  void initListMode() {
    setState(() {
      // Init list ad steps.
      _steps = [
        Container(),
        Container(),
        Container(),
        Container(),
      ];
      _currentStep += 1; // Navigates to next step.
    });
  }

  /// If steps left navigates to the next step, else uploads ad.
  Future<void> _finishStep() async {
    if (_currentStep == _steps.length) {
      var res = true; //! Result from upload. Assume true for now.
      //* Communicates result of upload to parent screen.
      Navigator.of(context).pop(res);
    } else {
      setState(() {
        _currentStep += 1; // Navigates to next step.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        //* This can happen if the user presses the back button on Android.
        if (_currentStep == 0) {
          return true; // Pop this screen.
        }
        setState(() {
          _currentStep -= 1; // Navigate to previous step.
        });
        return false; // Do not pop this screen.
      },
      child: Scaffold(
        appBar: AppBar(
          // Do not show back button on first step.
          leading: _currentStep == 0 ? Container() : BackButton(),
          title: Text(
            _currentStep == 0
                ? l10n.chooseUploadTypeTitle
                : l10n.uploadStep(
                    current: _currentStep,
                    total: _steps.length,
                  ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: _currentStep == 0
            ? AdTypeSelector(
                onChooseFind: initFindMode,
                onChooseList: initListMode,
              )
            : UploadStepContainer(
                step: _currentStep,
                totalSteps: _steps.length,
                onButtonPressed: _finishStep,
                child: Container(),
              ),
      ),
    );
  }
}
