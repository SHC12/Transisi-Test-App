part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    final storage = GetStorage();

    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (storage.read('isLogin') == null) {
        Get.offAll(LoginPage());
      } else {
        Get.offAll(Root());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: whitePrimary,
          ),
          SafeArea(
              child: Stack(
            children: [
              Container(
                // width: Get.width,

                child:
                    Center(child: Image.asset('assets/logo_text_transisi.png')),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
