part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController tEmail = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  AuthController authController = Get.put(AuthController());
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_transisi.png',
            height: Get.height * 0.3,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Container(
            color: whitePrimary,
            child: ListView(
              children: [
                Image.asset(
                  'assets/bg_transisi.png',
                  height: Get.height * 0.3,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
                Obx(() => Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text('REGISTER',
                              style: blueTextFont.copyWith(
                                  fontSize: Get.height * 0.05,
                                  fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style: blueTextFont,
                                  controller: tEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: blueTextFont,
                                      hintText: "Enter your email",
                                      hintStyle: blueTextFont,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style: blueTextFont,
                                  controller: tPassword,
                                  obscureText: isHide,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: blueTextFont,
                                      hintStyle: blueTextFont,
                                      hintText: "Enter your password",
                                      suffixIcon: IconButton(
                                          icon: isHide
                                              ? Icon(Icons.visibility_off,
                                                  color: bluePrimary)
                                              : Icon(Icons.visibility,
                                                  color: bluePrimary),
                                          onPressed: () {
                                            setState(() {
                                              isHide = !isHide;
                                            });
                                          }),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: bluePrimary),
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    width: Get.width,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: whitePrimary,
                                            side: BorderSide(
                                              width: 1.0,
                                              color: bluePrimary,
                                            ),
                                            padding: EdgeInsets.all(12),
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () async {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());

                                          if (tEmail.text.isEmpty ||
                                              tPassword.text.isEmpty) {
                                            Get.snackbar('Kesalahan',
                                                'Email dan Password cannot be empty',
                                                margin: EdgeInsets.all(12),
                                                backgroundColor: Colors.white70,
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          } else {
                                            authController.register(
                                                tEmail.text, tPassword.text);
                                          }
                                        },
                                        child: authController.isLoading.value
                                            ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  backgroundColor: bluePrimary,
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                          Color>(Colors.white),
                                                )),
                                              )
                                            : Text('REGISTER',
                                                style: blueTextFont.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)))),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: Get.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: bluePrimary,
                                        padding: EdgeInsets.all(12),
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () async {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      Get.to(LoginPage());
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: whiteTextFont.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ]))
                        ],
                      ),
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
