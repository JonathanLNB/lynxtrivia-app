import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/AppColors.dart';
import '../../utils/Constants.dart';
import 'SplashController.dart';

class SplashPage extends StatelessWidget {
  AnimationController animController;
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GetBuilder<SplashController>(
        builder: (_) => Scaffold(
              body: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Obx(() => AnimatedOpacity(
                        duration: const Duration(seconds: 2),
                        opacity: _.opacity.value,
                        child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              '${Constants.IMAGE_PATH}logo.png',
                            )))),
                  )),
            ));
  }
}
