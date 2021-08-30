import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/onboarding_model.dart';
import 'package:learn_brinvestyuk/screens/explore/explore_screen.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';

class PageOnBoard extends StatelessWidget {
  final OnBoardingModel data;
  final bool last;

  const PageOnBoard({
    Key? key,
    required this.data,
    required this.last,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final StorageManagement storage = StorageManagement();

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: defaultHeight,
          ),
          Center(
            child: SvgPicture.asset(
              data.image,
              height: size.height * 0.37,
              width: size.width,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: defaultHeight * 3,
          ),
          Center(
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: defaultHeight,
          ),
          Center(
            child: Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: defaultHeight * 1.5,
          ),
          last
              ? Container(
                  height: size.height * 0.12,
                  child: Center(
                    child: SecondaryButton(
                      onPressed: () => {
                        storage.firstInstall = false,
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreScreen(),
                          ),
                        ),
                      },
                      text: "Lanjutkan",
                      radius: defaultRadius * 6,
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
