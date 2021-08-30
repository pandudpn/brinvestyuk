import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/models/onboarding_model.dart';
import 'package:learn_brinvestyuk/screens/onboard/components/page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/onboard/onboard_top.svg",
                height: size.height * 0.14,
                fit: BoxFit.fitHeight,
              ),
              Container(
                height: size.height * 0.8,
                child: PageView.builder(
                  itemCount: items.length,
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (value) => {
                    setState(() => _currentPage = value),
                  },
                  itemBuilder: (context, index) => PageOnBoard(
                    data: items[index],
                    last: items.length - 1 == index,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _pageIndicator(_currentPage),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<OnBoardingModel> items = <OnBoardingModel>[
    OnBoardingModel(
      title: "Timbang Risiko-Nya, Dapatkan Keuntungan-Nya",
      subtitle:
          "Di BRInvestYuk Kamu Bisa Atur Keuntungannya Dengan Risiko Yang Terukur",
      image: "assets/images/onboard/onboard_1.svg",
    ),
    OnBoardingModel(
      title: "Tentukan Arah Investasimu",
      subtitle:
          "Mau Lari Kencang Bisa, Mau Jalan Santai Bisa, Yang Penting Kamu Bisa Untung Terus",
      image: "assets/images/onboard/onboard_2.svg",
    ),
    OnBoardingModel(
      title: "Modalmu itu Ibarat Bibit Unggul",
      subtitle:
          "Kami sedddiakan media tanamnya, dirawat dengan baik, selanjutnya jadi Bukit",
      image: "assets/images/onboard/onboard_3.svg",
    ),
  ];

  List<Widget> _pageIndicator(int _currentPage) {
    List<Widget> lists = [];

    for (int i = 0; i < items.length; i++) {
      lists.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return lists;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 7.0,
      width: isActive ? 22.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive ? secondaryColor : secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
