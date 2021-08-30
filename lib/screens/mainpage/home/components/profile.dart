import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    Key? key,
    this.isLogin,
    required this.name,
  }) : super(key: key);

  final String name;
  final bool? isLogin;

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BRInvestYuk!",
                  style: TextStyle(
                    fontFamily: "CartoonMarker",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      BoxShadow(offset: Offset(0, 2), blurRadius: 0),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(defaultPadding),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultRadius * 1.6),
              boxShadow: [
                BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 20,
                    color: Color(0xff000000).withOpacity(.3))
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 30,
                  child: Text(
                    widget.name.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: size.width * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.name,
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: defaultHeight * .5),
                      Text("Ranking 10/100",
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => print("banner di pencet"),
                  child: SvgPicture.asset("assets/images/medal.svg"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
