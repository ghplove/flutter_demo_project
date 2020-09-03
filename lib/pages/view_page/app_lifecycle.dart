import 'package:flutter/material.dart';

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('----didChangeAppLifecycleState----');
    print('state = $state');
    if(state == AppLifecycleState.paused){
      print('----app进入前台----');
    }else if(state == AppLifecycleState.resumed){
      print('----app进入后台----');
    }else if(state == AppLifecycleState.inactive){

//    } else if(state == AppLifecycleState.suspending){
    } else if(state == AppLifecycleState.detached){

    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


}
