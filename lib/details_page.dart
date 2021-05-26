import 'package:flutter/material.dart';
import 'package:uiexample_lesson14/place_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailsPage extends StatelessWidget {
  double screenWidth;
  PlaceDetails placeDetails;

  PlaceDetailsPage(this.placeDetails);

  /*PlaceDetailsPage(PlaceDetails placeDetails){
    this.placeDetails = placeDetails;
  }*/

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Flexible(
        child: _buildPlaceImage(),
        flex: 1,
      ),
      Flexible(
        child: Column(children: [
          _buildPlaceDescriptionAndRating(),
          _buildUserActions(),
          _buildPlaceLongDescription(),
        ]),
        flex: 2,
      ),
    ]);
  }

  _buildPlaceImage() {
    return Container(
      width: screenWidth,
      color: Colors.red,
      child: FittedBox(
          fit: BoxFit.fitWidth, child: Image.network(placeDetails.imageUrl)),
    );
  }

  _buildPlaceDescriptionAndRating() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    placeDetails.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    placeDetails.city,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text(placeDetails.stars.toString())
          ],
        ),
      ),
    );
  }

  _buildCallButton() {
    Widget call = _buildSettingsElement(Icons.call, "Call");
    return InkWell(
      child: call,
      onTap: () {
        _call();
      },
    );
  }
  _buildLocationButton() {
    Widget location = _buildSettingsElement(Icons.map, "Location");
    return InkWell(
      child: location,
      onTap: () {
        print("Location clicked");
      },
    );
  }
  _buildShareButton() {
    Widget share = _buildSettingsElement(Icons.share, "Share");
    return InkWell(
      child: share,
      onTap: () {
        print("Share clicked");
      },
    );
  }


  _buildUserActions() {
    Widget call     = _buildCallButton();
    Widget location = _buildLocationButton();
    Widget share    = _buildShareButton();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [call, location, share],
    );
  }
  _buildSettingsElement(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blueAccent,
          size: 36,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Colors.blueAccent, fontSize: 13),
          ),
        )
      ],
    );
  }
  _buildPlaceLongDescription() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Text(placeDetails.description, style: TextStyle(fontSize: 16)),
    );
  }

  _call() async {
    var url = "tel:"+ placeDetails.phoneNumber; //tel:
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
