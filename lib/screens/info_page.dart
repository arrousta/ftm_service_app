import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          body: Center(
            child: Scrollbar(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/ftm.png"),
                    height: 100,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "شرکت فنی مهندسی فرزین توانش مهرساد با نام تجاری FTM درسال ۱۳۹۳ با همکاری جمعی از مدیران و متخصصین و با هدف ارائه جدیدترین خدمات تخصصی برق و الکترونیک تاسیس گردیده است. این مجموعه پاسخی است به نیاز موسسات و سازمان ها و شرکت های بزرگ و متوسط واحد های صنفی بزرگ و کوچک ، شخصیت های حقیقی کشور در زمینه خدمات تخصصی برق و الکترونیک ، بر اساس شناختی دوگانه از خواست مشتری و راه حل مناسب. گروه ...... کلیه خدمات خود را با تکیه بر تخصص، دانش فنی و تجربیات کارشناسان خود در قالب یک کار گروهی و تخصصی ارائه می‌کند. این متخصصین علاوه بر دارا بودن مدارک رسمی علمی و سوابق ارزشمند کاری، دارای مدارک گوناگون از مراجع صنعت ........ دنیا می باشند.",
                      style: TextStyle(
                        letterSpacing: 6,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text("تیم نرم افزار:"),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () => UrlLauncher.launch("tel:+989227073767"),
                    child: const Text(
                      "علی نعمت الهی",
                      locale: Locale('EN'),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 4,
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => UrlLauncher.launch("tel:+989175363564"),
                    child: const Text(
                      "علیرضا روستا",
                      locale: Locale('EN'),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 4,
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
