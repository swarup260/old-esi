import 'package:flutter/material.dart';

import './models/page_model.dart';
import './api/networkManager.dart';
import 'SearchLocation.dart';
import 'widgets/page_indicator.dart';

class Walkthrough extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf7fbff),
      body: WalkthroughBody(),
    );
  }
}

class WalkthroughBody extends StatefulWidget {
  WalkthroughBody({Key key}) : super(key: key);

  @override
  WalkthroughBodyState createState() => WalkthroughBodyState();
}

class WalkthroughBodyState extends State<WalkthroughBody> {
  PageController _pageController;
  CrossFadeState _bottomState = CrossFadeState.showFirst;
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    if (_pageController.hasClients) {
      setState(() {
        /* if (_pageController.page.toInt() == (pages.length - 1)) {
          _bottomState = CrossFadeState.showSecond;
        } else {
          _bottomState = CrossFadeState.showFirst;
        } */
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //SizedBox(height: 100.0),
                SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Image.asset(pages[index].assetImagePath),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                ),
              ],
            );
          },
          onPageChanged: (int index) {
            if (index == (pages.length - 1)) {
              _bottomState = CrossFadeState.showSecond;
            } else {
              _bottomState = CrossFadeState.showFirst;
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 96.0,
            alignment: Alignment.center,
            child: AnimatedCrossFade(
              crossFadeState: _bottomState,
              duration: Duration(milliseconds: 300),
              firstChild: PageIndicators(
                pageController: _pageController,
                pageLength: pages.length,
              ),
              secondChild: FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setPersistedSeenWalkthrough(true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchLocation()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 98.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
  }
}

class PageIndicators extends StatelessWidget {
  final PageController pageController;
  final int pageLength;

  const PageIndicators({Key key, this.pageController, this.pageLength})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: PageViewIndicator(
              controller: pageController,
              pageCount: pageLength,
              color: Colors.black,
            )),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              pageController.animateToPage((pageLength - 1),
                  curve: Curves.decelerate,
                  duration: Duration(milliseconds: 500));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text(
                'Skip',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 19.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
