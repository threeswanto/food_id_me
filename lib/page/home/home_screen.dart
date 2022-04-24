import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_id_me/base/ui/text_styles.dart';
import 'package:food_id_me/page/home/home_notifier.dart';
import 'package:food_id_me/page/web_view/webview_screen.dart';
import 'package:provider/provider.dart';

import '../../model/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Jakarta Selatan';

  @override
  void initState() {
    context.read<HomeNotifier>().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, notifier, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.account_circle_sharp),
          title: const Text("FOOD.ID"),
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.chat_rounded),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Dikirim ke",
                            style: text14White,
                          ),
                          const SizedBox(width: 10),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white),
                              elevation: 16,
                              style: text16WhiteBold,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Jakarta Selatan',
                                'Jakarta Barat',
                                'Jakarta Timur',
                                'Jakarta Utara'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: const ListTile(
                          leading: Icon(Icons.search),
                          title: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mau belanja makanan apa?"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              notifier.response != null
                  ? CarouselSlider(
                      options: CarouselOptions(height: 210.0),
                      items: notifier.topData.map((Data data) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WebViewScreen(url: data.pageUrl!),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    "${data.media}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator())),
                    ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Special di FOOD.ID",
                  textAlign: TextAlign.start,
                  style: text18Bold,
                ),
              ),
              notifier.response != null
                  ? Flexible(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3 / 1.5),
                          itemCount: notifier.bottomData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewScreen(
                                          url: notifier
                                              .bottomData[index].pageUrl!)),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${notifier.bottomData[index].media}",
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            );
                          }),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator())),
                    )
            ],
          ),
        ),
      );
    });
  }
}
