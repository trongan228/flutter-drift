import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
import 'package:flutter_drift/generated/assets.dart';
import 'package:flutter_drift/screens/chart_page.dart';
import 'package:flutter_drift/screens/home_page.dart';
import 'package:flutter_drift/screens/main_page.dart';
import 'package:flutter_drift/screens/storage_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';

class DrawerVielott extends StatefulWidget {
  const DrawerVielott({super.key, required this.database});

  final AppDatabase database;

  @override
  State<DrawerVielott> createState() => _DrawerVielottState();
}

class _DrawerVielottState extends State<DrawerVielott> {
  bool isExpanded1 = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesImgDrawer), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            // Center(
            //   child: SvgPicture.asset(
            //     AppConfig.appLogo,
            //     width: 117,
            //     height: 38,
            //   ),
            // ),
            const SizedBox(
              height: 16,
            ),

            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPage(database: widget.database);
                }));
              },
              leading: const Icon(Icons.home_filled, color: Colors.red),
              title: const Text('Quản lý Văn bản',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.grey[300],
              height: 1,
            ),

            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChartPage();
                }));
              },
              leading: const Icon(Icons.bar_chart_outlined, color: Colors.red),
              title: const Text('Thống kê',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.grey[300],
              height: 1,
            ),

            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StoragePage(
                    database: widget.database,
                  );
                }));
              },
              leading: const Icon(Icons.storage_outlined, color: Colors.red),
              title: const Text('Quản lý kho',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.grey[300],
              height: 1,
            ),
            // ListTile(
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   onTap: () {
            //     Navigator.of(context).pushNamed(PageRoutes.policyPage);
            //     Scaffold.of(context).closeDrawer();
            //   },
            //   leading: SvgPicture.asset(Assets.iconsIcDieuKhoan),
            //   title: Text('Điều khoản',
            //       style: GoogleFonts.roboto(
            //           fontSize: 16,
            //           color: textColor,
            //           fontWeight: FontWeight.w300)),
            // ),
            // ListTile(
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   onTap: () {
            //     Navigator.of(context).pushNamed(PageRoutes.contactPage);
            //     Scaffold.of(context).closeDrawer();
            //   },
            //   leading: SvgPicture.asset(Assets.iconsIcLienHe),
            //   title: Text('Liên hệ',
            //       style: GoogleFonts.roboto(
            //           fontSize: 16,
            //           color: textColor,
            //           fontWeight: FontWeight.w300)),
            // ),
            const Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 88),
              child: const Text(
                'Version: 0.1.1',
                //style: Style( TẽfontSize: 14, color: gray),
              ),
            )
          ],
        ),
      ),
    );
  }
}
