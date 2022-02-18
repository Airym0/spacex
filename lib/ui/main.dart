import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/view_models/home_view_model.dart';

import 'pages/launch_detail.dart';
import 'components/launch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case LaunchDetail.route:
            if (arguments != null && arguments is LaunchDetailArguments) {
              Launch launch = arguments.launch;
              return MaterialPageRoute(builder: (_) => LaunchDetail(launch));
            } else {
              throw Exception(
                  "Cette route doit avoir un objet SpotDetailArgument en argument");
            }

          default:
            return unknownRoute();
        }
      },
      home: MyHomePage(),
    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(child: Text("Route inconnue")),
            ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  static List<Widget> widgetOptions = <Widget>[
    Consumer<HomeViewModel>(
      builder: (context, HomeViewModel model, child) {
        return model.upcomingLaunches != null
            ? LaunchList(model.upcomingLaunches ?? [])
            : Center(
          child: CircularProgressIndicator(),
        );
      }
    ),
    Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) {
          return model.upcomingLaunches != null
              ? LaunchList(model.historyLaunches ?? [])
              : Center(
            child: CircularProgressIndicator(),
          );
        }
    ),
    Text(
      'Index 2: Schoool',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
            builder: (context, HomeViewModel model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.title),
            ),
            body: widgetOptions.elementAt(model.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.airplanemode_active),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Company',
                ),
              ],
              currentIndex: model.selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: model.onBarButtonItemTapped,
            ),
          );
        }));
  }
}