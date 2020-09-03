import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print('----build----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text(_count.toString()),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    print('----didChangeDependencies----');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('----didUpdateWidget----');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    print('----initState----');
    super.initState();
  }

  @override
  void deactivate() {
    print('----deactivate----');
    super.deactivate();
  }

  @override
  void dispose() {
    print('----dispose----');
    super.dispose();
  }


}
