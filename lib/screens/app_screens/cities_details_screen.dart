import 'package:flutter/material.dart';
import 'package:traveller/data/data_manager.dart';
import 'package:traveller/widget/details/city_details_app_bar.dart';
import 'package:traveller/widget/details/city_details_bottom_bar.dart';

class DetailsScreen extends StatelessWidget {
  int id;
  DetailsScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(DataManager.Details[id].mainImage),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: CityDetailsAppBar(),
          ),
          bottomNavigationBar: CityDetailsBottomBar(id: this.id),
        ));
  }
}
