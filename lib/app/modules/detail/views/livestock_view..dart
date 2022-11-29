import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/modules/home/widgets/livestock_box.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:getx_pattern_starter/app/widgets/title_bar.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LivestockView extends StatelessWidget {
  const LivestockView({super.key});

  @override
  Widget build(BuildContext context) {
    final liveStock = Get.arguments['liveStock'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text('Detail', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                children: [
                  Container(
                    height: 250,
                    constraints: BoxConstraints(
                      maxHeight: 250,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 188, 188, 188)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        liveStock['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              liveStock['title'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              formatRupiah(liveStock['price']),
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            MdiIcons.heartOutline,
                          ))
                      // textDirection: TextDirection.LTR,
                    ],
                  ),
                  Divider(),
                  _buildFarm(liveStock),
                  Divider(),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ExpandableText(
                    liveStock['description'],
                    expandText: 'Selengkapnya',
                    collapseText: 'Tutup',
                    maxLines: 10,
                    linkColor: AppTheme.primary,
                    style: TextStyle(fontSize: 14),
                  ),
                  Divider(),
                  //
                  // make column for comment
                  // make column for comment
                  TitleBar(
                    titleSize: 14,
                    sideTitleSize: 14,
                    title: 'Ternak lain dari Peternakan ini',
                    sideTittle: 'Lihat semua',
                  ),
                  // make grid view like at home
                  // make grid view like at home
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return LiveStockBox(content: liveStock);
                      },
                    ),
                  )
                ],
              ),
            ),
            _buildAction()
          ],
        ),
      ),
    );
  }

  Widget _buildFarm(liveStock) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  liveStock['farm']['image'],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 188, 188, 188).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 1), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  liveStock['farm']['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  liveStock['farm']['address']['city'],
                  style: TextStyle(
                      fontSize: 12,
                      // color: AppTh,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          // make eleveated button with border and widh 100
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppTheme.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            child: Text(
              'Lihat Peternakan',
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAction() {
    return Container(
      decoration: BoxDecoration(
          // color: AppTheme.secondary,
          color: Colors.white,
          boxShadow: [
            // only top
            BoxShadow(
              color: Color.fromARGB(255, 187, 187, 187).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(3, -1), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: AppTheme.secondary,
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Column(
                  children: [
                    Icon(
                      MdiIcons.phone,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      "Hubungi Peternakan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.secondary.withBlue(200),
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Column(
                  children: [
                    Icon(
                      MdiIcons.barn,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      "Masukan Kekandang",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatRupiah(int number) {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'id',
      decimalDigits: 0,
      name: 'Rp ',
    );
    return formatCurrency.format(number);
  }
}
