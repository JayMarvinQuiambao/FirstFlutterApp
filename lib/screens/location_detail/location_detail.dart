import 'package:flutter/material.dart';
import 'package:hello_world/models/location.dart';
import 'package:hello_world/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'text_section.dart';

class LocationDetail extends StatelessWidget {
  final int _locationId;

  LocationDetail(this._locationId);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchById(_locationId);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(assetPath: location.imagePath),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                child: LocationTile(location: location),
              ),
            ]..addAll(textSections(location))),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
