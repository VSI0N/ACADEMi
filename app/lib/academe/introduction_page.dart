import 'package:ACADEMe/academe/pages/askme_view.dart';
import 'package:ACADEMe/academe/components/center_next_button.dart';
import 'package:ACADEMe/academe/pages/progress_view.dart';
import 'package:ACADEMe/academe/pages/education_view.dart';
import 'package:ACADEMe/academe/pages/get-started_view.dart';
import 'package:ACADEMe/academe/components/top_back_skip_view.dart';
import 'package:ACADEMe/introduction_animation/components/welcome_view.dart';
import 'package:flutter/material.dart';

class AcademeScreen extends StatefulWidget {
  const AcademeScreen({Key? key}) : super(key: key);

  @override
  _AcademeScreenState createState() =>
      _AcademeScreenState();
}

class _AcademeScreenState
    extends State<AcademeScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ClipRect(
        child: Stack(
          children: [
            GetStartedView(
              animationController: _animationController!,
            ),
            EducationView(
              animationController: _animationController!,
            ),
            AskMeView(
              animationController: _animationController!,
            ),
            ProgressView(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.pop(context);
  }
}
