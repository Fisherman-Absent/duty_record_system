import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import 'package:duty_record_system/controller/sign_controller.dart';

class CameraScan extends StatefulWidget {
  const CameraScan({super.key});

  @override
  CameraScanState createState() => CameraScanState();
}

class CameraScanState extends State<CameraScan> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // 初始化相機
    WidgetsFlutterBinding.ensureInitialized();
    availableCameras().then((cameras) {
      CameraDescription firstCamera = cameras[1];

      // 創建相機控制器
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      // 初始化相機控制器
      _initializeControllerFuture = _controller.initialize();
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    // 釋放相機資源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // 如果初始化完成，顯示相機預覽
              return CameraPreview(_controller);
            } else {
              // 如果尚未完成，顯示載入中的訊息
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
    );
  }
}
