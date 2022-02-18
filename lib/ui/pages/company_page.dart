import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/model/company.dart';
import 'package:space_x/view_models/home_view_model.dart';

class CompanyPage extends StatelessWidget {

  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<Company?>(
        future: HomeViewModel().getCompany(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        snapshot.data?.name ?? '',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("Ceo : ${snapshot.data?.ceo}"),
                    ],
                  ),
                )
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}