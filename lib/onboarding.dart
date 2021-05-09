import 'package:flutter/material.dart';
import 'package:special_day/forms.dart';
import 'package:special_day/home_page.dart';

const String createAccountUrl =
    "https://miro.medium.com/max/1190/1*8QgPF5tXwo5NqhvXXncwSQ.png";
const String moneyUrl = "https://i.gifer.com/4M57.gif";
const String funUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqc97xALD-ZRWxBWwdBip4SCxCFzQEh8GX3Q&usqp=CAU";

const double kHorizontalPadding = 32;
const double kVerticalPadding = 32;

class SimpleOnboarding extends StatefulWidget {
  const SimpleOnboarding({this.onFinish, this.onSkip});
  final Function onFinish;
  final Function onSkip;

  @override
  _SimpleOnboardingState createState() => _SimpleOnboardingState();
}

class _SimpleOnboardingState extends State<SimpleOnboarding> {
  Color myDarkColor = Colors.grey[800];
  Color accentColor = Colors.deepPurple;

  PageController pageController = PageController();
  int screenIndex;

  List<Widget> screens = [
    SingleScreen(
      title: "Special Days",
      subtitle:
          "We bring to you an interface to virtually celebrate small occasions !! \n\nFor best experience use it on a smartphone device",
      imageUrl: createAccountUrl,
    ),
    SingleScreen(
      title: "Celebrate Virtually !",
      subtitle:
          "Customize your own experience! Fill in some details and you are ready to go. \n\nDon't worry we do not take any information it is all stored on your phone itself !",
      imageUrl: moneyUrl,
    ),
  ];

  @override
  void initState() {
    screenIndex = 0;
    super.initState();
  }

  void setScreenIndex(int value) {
    setState(() {
      screenIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    return Theme(
      data: currentTheme.copyWith(
        textTheme: currentTheme.textTheme
            .copyWith(bodyText2: TextStyle(color: myDarkColor)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: myDarkColor),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 32.0, vertical: kVerticalPadding),
            child: Stack(
              children: [
                PageViewWithIndicators(
                  dotColor: accentColor,
                  pageController: pageController,
                  onPageChanged: setScreenIndex,
                  children: screens,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      screenIndex != 0
                          ? TextButton(
                              child:
                                  Text("Prev", style: TextStyle(fontSize: 16)),
                              onPressed: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                            )
                          : SizedBox.shrink(),
                      TextButton(
                        onPressed: () {
                          if (screenIndex == screens.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SimpleTextFields()));
                          } else {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        child: Text(
                          screenIndex == screens.length - 1
                              ? "Get Started"
                              : "Next",
                          style: TextStyle(fontSize: 16, color: accentColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleScreen extends StatelessWidget {
  const SingleScreen({this.title, this.subtitle, this.imageUrl});
  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (imageUrl != null)
          SizedBox(
            height: size.height * .5,
            child: Image.network(imageUrl),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(height: 12),
            Text(
              subtitle ?? "",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }
}

// Page view with indicator widget
enum IndicatorType { dots, numbered }

class PageViewWithIndicators extends StatefulWidget {
  const PageViewWithIndicators({
    this.children,
    this.dotColor = Colors.white,
    this.type = IndicatorType.dots,
    this.pageController,
    this.onPageChanged,
  });
  final List<Widget> children;
  final Color dotColor;
  final IndicatorType type;
  final Function(int) onPageChanged;
  final PageController pageController;

  @override
  _PageViewWithIndicatorsState createState() => _PageViewWithIndicatorsState();
}

class _PageViewWithIndicatorsState extends State<PageViewWithIndicators> {
  int activeIndex;

  @override
  void initState() {
    activeIndex = 0;
    super.initState();
  }

  setActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  _buildDottedIndicators() {
    List<Widget> dots = [];
    const double radius = 8;

    for (int i = 0; i < widget.children.length; i++) {
      dots.add(
        Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == activeIndex
                ? widget.dotColor
                : widget.dotColor.withOpacity(.6),
          ),
        ),
      );
    }
    dots = intersperse(SizedBox(width: 6), dots)
        .toList(); // Add spacing between dots

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots,
        ),
      ),
    );
  }

  _buildNumberedIndicators() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.33),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(
            "${(activeIndex + 1).toString()} / ${widget.children.length.toString()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: widget.children,
          onPageChanged: (value) {
            setActiveIndex(value);
            widget.onPageChanged(value);
          },
          controller: widget.pageController,
        ),
        widget.type == IndicatorType.dots
            ? _buildDottedIndicators()
            : _buildNumberedIndicators(),
      ],
    );
  }
}

// Util

// Copied from https://github.com/modulovalue/dart_intersperse/blob/master/lib/src/intersperse.dart
/// Puts [element] between every element in [list].
Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
