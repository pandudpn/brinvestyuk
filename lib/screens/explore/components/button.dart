import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/auth/register/register.dart';
import 'package:learn_brinvestyuk/screens/explore/components/text.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';
import 'package:learn_brinvestyuk/widgets/buttons/outlined_button.dart';

class ButtonExplore extends StatelessWidget {
  const ButtonExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .25,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Container(
              width: size.width * .8,
              child: SecondaryOutlinedButton(
                onPressed: () => print("masuk beranda"),
                text: "Explore",
                letterSpacing: 0,
                radius: defaultRadius * 6,
              ),
            ),
            SizedBox(
              height: defaultHeight,
            ),
            Container(
              width: size.width * .8,
              child: SecondaryButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                ),
                text: "Langsung Daftar",
                letterSpacing: 0,
                radius: defaultRadius * 6,
              ),
            ),
            SizedBox(
              height: defaultHeight * 0.5,
            ),
            TextExplore(),
          ],
        ),
      ),
    );
  }
}
