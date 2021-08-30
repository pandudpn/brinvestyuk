import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/article.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/investment.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/products.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/profile.dart';
import 'package:learn_brinvestyuk/view_model/users/user_profile_list_view_model.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  UserProfileListViewModel? profile;

  @override
  void initState() {
    readyCall();
    super.initState();
  }

  @override
  void readyCall() async {
    final userProfile =
        Provider.of<UserProfileListViewModel>(context, listen: false);
    await userProfile.getProfile();

    setState(() {
      profile = userProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: () async => print("refresh"),
      child: ListView(
        padding: EdgeInsets.only(bottom: defaultPadding * 2),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.5, 1],
                    colors: [
                      Color(0xfffd5b00),
                      Color(0xffffb423),
                      Color(0xffff7100),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileSection(
                        name: profile?.user == null
                            ? "Investor"
                            : profile!.user!.name,
                      ),
                      SizedBox(
                        height: defaultHeight * .5,
                      ),
                      InvestmentSection(
                        total:
                            profile?.user?.userInvestment?.formatted?.total ??
                                "Rp 0",
                      ),
                      SizedBox(height: defaultHeight * 1.5),
                      Divider(
                        height: defaultHeight * .5,
                        thickness: 8,
                        color: Color(0xffaaaaaa).withOpacity(.2),
                      ),
                      SizedBox(height: defaultHeight),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Kesempatan Investasi nih!",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            GestureDetector(
                              onTap: () => print("pencet produk"),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Lihat semua",
                                    style: TextStyle(
                                        color: secondaryColor, fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: secondaryColor,
                                    size: 18,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: defaultHeight),
                      ProductSection(),
                      SizedBox(height: defaultHeight * 1.5),
                      Divider(
                        height: defaultHeight * .5,
                        thickness: 8,
                        color: Color(0xffaaaaaa).withOpacity(.2),
                      ),
                      SizedBox(height: defaultHeight),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Belajar Investasi yuk!",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            GestureDetector(
                              onTap: () => print("pencet produk"),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Lihat semua",
                                    style: TextStyle(
                                        color: secondaryColor, fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: secondaryColor,
                                    size: 18,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: defaultHeight),
                      ArticleSection()
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
