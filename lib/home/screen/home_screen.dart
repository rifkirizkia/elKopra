// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:elkopra/constant/r.dart';
import 'package:elkopra/home/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../api/api.dart';
import '../../news/screen/news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsModel? newsModel;
  bool isLoading = false;
  void getNews() async {
    try {
      final api = Api();
      setState(() {
        isLoading = true;
      });
      final res = await api.getNews();
      if (res != null) {
        newsModel = NewsModel.fromJson(res);
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(R.assets.img_profile),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning,',
                        style: TextStyle(
                            fontSize: 12,
                            color: R.colors.text_thin,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Amanda Rahma',
                        style: TextStyle(
                            fontSize: 14,
                            color: R.colors.text_thin_button,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(R.assets.img_menu)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff8732F5),
                        Color(0xff4645F8)
                      ], // Ganti warna gradient sesuai keinginan
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Image.asset(R.assets.img_elips1),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(R.assets.img_elips2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Balance',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  '10/23',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Rp 2.800.788',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 55,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '*** **** **** 1289',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 47,
                                  height: 19,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: SvgPicture.asset(R.assets.svg_logo),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            color: R.colors.light_grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(R.assets.svg_credit),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          'Credit Application',
                          style: TextStyle(
                              fontSize: 10,
                              color: R.colors.text_normal,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: R.colors.light_grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(R.assets.svg_vouchers),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          'Vouchers',
                          style: TextStyle(
                              fontSize: 10,
                              color: R.colors.text_normal,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: R.colors.light_grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(R.assets.svg_spsw),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          'SPSW & Balance',
                          style: TextStyle(
                              fontSize: 10,
                              color: R.colors.text_normal,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: R.colors.light_grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(R.assets.svg_pos),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          'POS Cafe',
                          style: TextStyle(
                              fontSize: 10,
                              color: R.colors.text_normal,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Todays Transactions',
                    style: TextStyle(
                        fontSize: 12,
                        color: R.colors.text_normal,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                      onTap: (() {}),
                      child: Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 10,
                            color: R.colors.light_primary,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                height: 157,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: R.colors.light_primary, width: 0.7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Image.asset(R.assets.img_no_transaction),
                    Text(
                      'No Transaction',
                      style: TextStyle(
                          fontSize: 12,
                          color: R.colors.text_normal,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest News',
                    style: TextStyle(
                        fontSize: 12,
                        color: R.colors.text_normal,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                      onTap: (() {}),
                      child: Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 10,
                            color: R.colors.light_primary,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 215,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return newsModel == null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 182,
                                height: 200,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 182,
                                      height: 111,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 182,
                                          height: 111,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    SizedBox(
                                      width: 182,
                                      height: 14,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 182,
                                          height: 14,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      width: 182,
                                      height: 14,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 182,
                                          height: 14,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: 182,
                                      height: 14,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 182,
                                          height: 14,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      width: 182,
                                      height: 14,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 182,
                                          height: 14,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      height: 14,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 50,
                                          height: 14,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailScreen(
                                            image: newsModel!
                                                .articles![index].urlToImage!,
                                            judul: newsModel!
                                                .articles![index].title!,
                                            author: newsModel!
                                                .articles![index].author!,
                                            deskripsi: newsModel!
                                                .articles![index].description!,
                                          )),
                                );
                              }),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 182,
                                  height: 200,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        newsModel!.articles![index].urlToImage!,
                                        height: 111,
                                        width: 182,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        newsModel!.articles![index].title!,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: R.colors.text_normal,
                                            fontWeight: FontWeight.w700),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        newsModel!
                                            .articles![index].description!,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: R.colors.text_thin,
                                            fontWeight: FontWeight.w400),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'Learn More ...',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: R.colors.light_primary,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
