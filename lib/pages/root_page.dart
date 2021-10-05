import 'package:flutter/material.dart';
import 'package:flutter_getx_rooting_middleware/app/controller/root_controller.dart';
import 'package:flutter_getx_rooting_middleware/routes/app_routes.dart';
import 'package:get/get.dart';

class RootPage extends GetView<RootController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.location;
        return Scaffold(
          appBar: AppBar(
            title: Text(title ?? ''),
            centerTitle: true,
          ),
          body: GetRouterOutlet(
            initialRoute: AppPages.initialRoute,
          ),
        );
      },
    );
  }
}
