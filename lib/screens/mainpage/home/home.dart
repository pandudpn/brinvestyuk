import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';
import 'package:learn_brinvestyuk/screens/auth/login/login_screen.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/article.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/investment.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/products.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/profile.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/components/shimmer.dart';
import 'package:learn_brinvestyuk/screens/mainpage/product/product_list_screen.dart';
import 'package:learn_brinvestyuk/view_model/articles/articles_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/auth/login/login_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/products/products_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/products/products_view_model.dart';
import 'package:learn_brinvestyuk/view_model/users/user_profile_list_view_model.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isRequest = true;
  UserProfileListViewModel? profile;
  List<ProductsViewModel>? products = <ProductsViewModel>[];
  List<ArticleListModel>? articles = <ArticleListModel>[];

  @override
  void initState() {
    readyCall();

    super.initState();
  }

  void readyCall() async {
    int defaultLengthProducts = 10;
    int defaultLengthArticles = 10;

    final userProfile =
        Provider.of<UserProfileListViewModel>(context, listen: false);
    await userProfile.getProfile();

    final productListView =
        Provider.of<ProductsListViewModel>(context, listen: false);
    await productListView.fetchProducts(1, null, null);

    final articlesListView =
        Provider.of<ArticlesListViewModel>(context, listen: false);
    await articlesListView.fetchArticles(1);

    if (productListView.products != null &&
        productListView.products!.length < 10) {
      defaultLengthProducts = productListView.products!.length;
    }

    if (articlesListView.articles != null &&
        articlesListView.articles!.articles != null &&
        articlesListView.articles!.articles!.length < 10) {
      defaultLengthArticles = articlesListView.articles!.articles!.length;
    }

    setState(() {
      profile = userProfile;
      if (productListView.products != null) {
        for (int i = 0; i < defaultLengthProducts; i++) {
          products?.add(productListView.products![i]);
        }
      }

      if (articlesListView.articles != null &&
          articlesListView.articles!.articles != null) {
        for (int j = 0; j < defaultLengthArticles; j++) {
          articles?.add(articlesListView.articles!.articles![j]);
        }
      }
      isRequest = false;
    });
  }

  Future<void> _onRefresh(BuildContext context) async {
    setState(() => isRequest = true);
    products = [];
    articles = [];
    readyCall();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: ListView(
        padding: EdgeInsets.only(bottom: defaultPadding),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * .35,
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
                      isRequest
                          ? ShimmerProfile()
                          : ProfileSection(
                              name: profile?.user == null
                                  ? "Investor"
                                  : profile!.user!.name,
                            ),
                      SizedBox(
                        height: defaultHeight * .5,
                      ),
                      isRequest
                          ? ShimmerInvestment()
                          : InvestmentSection(
                              total: profile?.user?.userInvestment?.formatted
                                      ?.total ??
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
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(),
                                ),
                              ),
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
                      isRequest
                          ? ShimmerProductSection()
                          : ProductSection(
                              products: products,
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
                      isRequest
                          ? ShimmerArticleSection()
                          : ArticleSection(
                              articles: articles,
                            )
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
