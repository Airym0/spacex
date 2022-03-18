import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/manager/notification_manager.dart';

class SettingsPage extends StatelessWidget {
  static const route = "/settings";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationManager(),
        child: Consumer<NotificationManager>(
            builder: (context, NotificationManager model, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Paramètres"),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Notifications : ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        const Spacer(),
                        CupertinoSwitch(
                            value: NotificationManager.activated,
                            onChanged: (newValue) {
                              model.setNotificationState(newValue);
                            })
                      ],
                    ),
                  ],
                ),
              ));
        }));
  }
}
