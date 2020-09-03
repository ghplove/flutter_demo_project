import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutterdemoproject/pages/view_page/animation_hero_page.dart';
import 'package:flutterdemoproject/pages/view_page/animation_hero_page2.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

//  AnimationStatus animationStatus;
//  double animationValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HeroAnimation()));
                },
                child: Text('Hero动画'),
              ),

              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RadialExpansionDemo()));
                },
                child: Text('Hero径向动画'),
              ),

              GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text(
                  'start',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 25),
                ),
              ),
//              Text(
//                'animationStatus: ${animationStatus.toString()}',
//                textDirection: TextDirection.ltr,
//              ),
//              Text(
//                'animationValue: ${animationValue.toString()}',
//                textDirection: TextDirection.ltr,
//              ),
//              Container(
//                height: animation.value,
//                width: animation.value,
//                child: FlutterLogo(),
//              ),
//              AnimationLogo(animation: animation),
              GrowTransition(animation: animation, child: LogoWidget()),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
//    animation = Tween<double>(begin: 0, end: 300).animate(controller)
//      ..addListener(() {
//        setState(() {
//          animationValue = animation.value;
//        });
//      })
//      ..addStatusListener((AnimationStatus status) {
//        setState(() {
//          animationStatus = status;
//        });
//      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        width: animation.value,
        height: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}
