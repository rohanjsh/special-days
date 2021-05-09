import 'package:special_day/exibition_bottom_sheet.dart';
import 'package:special_day/scrollable_exibition_bottom_sheet.dart';
import 'package:special_day/sliding_cards.dart';
import 'package:special_day/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //https://bit.ly/3f4i34O
  //https://scontent.fbom3-1.fna.fbcdn.net/v/t1.18169-9/11701201_795849797198511_5978512100810343092_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=e3f864&_nc_ohc=zIIJkcr95j4AX-cKln1&_nc_ht=scontent.fbom3-1.fna&oh=3e5665f0c5329643c5159236c795c47f&oe=60BE4A0B
  HomePage(
      {this.event,
      this.date,
      this.oneLiner,
      this.tab2Moments,
      this.tab2Details,
      this.tab2Title,
      this.tab2Link,
      this.tab1Moments,
      this.tab1Details,
      this.tab1Title,
      this.tab1Link,
      this.tab3Details,
      this.tab3Link,
      this.tab3Moments,
      this.tab3Title});

  final String event;
  final String date;
  final String oneLiner;
  final String tab1Link;
  final String tab1Title;
  final String tab1Details;
  final String tab1Moments;
  final String tab2Link;
  final String tab2Title;
  final String tab2Details;
  final String tab2Moments;
  final String tab3Link;
  final String tab3Title;
  final String tab3Details;
  final String tab3Moments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black38),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                // Header(
                //   title: event,
                // ),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),

          ExhibitionBottomSheet(),
          //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({@required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
