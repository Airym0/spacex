import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/manager/get_it.dart';
import 'package:space_x/model/company.dart';
import 'package:space_x/view_models/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) {
      return Scaffold(
        body: FutureBuilder<Company?>(
          future: locator<HomeViewModel>().getCompany(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(snapshot.data?.name ?? '',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Roboto',
                                      fontSize: 40))),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("Ceo : ${snapshot.data?.ceo}"),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("${snapshot.data?.employees} employees."),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("Since ${snapshot.data?.founded}."),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("${snapshot.data?.summary}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/SpaceX-Logo-Xonly.svg/1280px-SpaceX-Logo-Xonly.svg.png')),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () =>
                                launch('${snapshot.data?.links.website}')),
                        InkWell(
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://logo-marque.com/wp-content/uploads/2021/03/Flickr-Logo.png')),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () =>
                                launch('${snapshot.data?.links.flickr}')),
                        InkWell(
                            child: SizedBox(
                                width: 60,
                                height: 50,
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/fr/thumb/c/c8/Twitter_Bird.svg/944px-Twitter_Bird.svg.png')),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () =>
                                launch('${snapshot.data?.links.twitter}')),
                      ],
                    ),
                  ),
                  Text("Crew members :"),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: SizedBox(
                      height: 230,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: model.crews?.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 32, 0),
                                    child: Column(
                                      children: [
                                        ClipOval(
                                          child: Image.network(
                                            model.crews?[i].image ?? "",
                                            width: 180,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 16, 0, 0),
                                          child:
                                              Text(model.crews?[i].name ?? ""),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    });
  }
}
