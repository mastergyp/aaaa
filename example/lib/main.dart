import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:aaaa/aaaa.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _aaaaPlugin = Aaaa();
  String _appUrl = '';
  String _apkFilePath = '/storage/emulated/0/Mob/update.apk';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _aaaaPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController()..text = "/storage/emulated/0/Mob/update.apk",
              decoration: InputDecoration(
                  hintText:
                      'apk file path to install. Like /storage/emulated/0/demo/update.apk'),
              onChanged: (path) => _apkFilePath = path,

            ),
            FlatButton(
                onPressed: () {
                  onClickInstallApk();
                },
                child: Text('install')),
            TextField(
              decoration:
                  InputDecoration(hintText: 'URL for app store to launch'),
              onChanged: (url) => _appUrl = url,
            ),
            FlatButton(
                onPressed: () => onClickGotoAppStore(_appUrl),
                child: Text('gotoAppStore')),
            Center(
              child: Text('Running on: $_platformVersion\n'),
            )
          ],
        ),
      ),
    );
  }

  void onClickInstallApk() async {
    if (_apkFilePath.isEmpty) {
      print('make sure the apk file is set');
      return;
    }

    var status = await Permission.storage.request();
    if (status.isGranted) {
      Aaaa.installApk(_apkFilePath, 'com.vapeam.aaaa_example').then((result) {
        print('install apk $result');
      }).catchError((error) {
        print('install apk error: $error');
      });
    } else {
      print('Permission request fail!');
    }
  }

  void onClickGotoAppStore(String url) {
    // url = url.isEmpty
    //     ? 'https://itunes.apple.com/cn/app/%E5%86%8D%E6%83%A0%E5%90%88%E4%BC%99%E4%BA%BA/id1375433239?l=zh&ls=1&mt=8'
    //     : url;
    // Aaaa.gotoAppStore(url);
  }
}
