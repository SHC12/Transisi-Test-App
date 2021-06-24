part of 'pages.dart';

class DetailEmployeePage extends StatefulWidget {
  final Employee employee;
  DetailEmployeePage(this.employee);
  @override
  _DetailEmployeePageState createState() => _DetailEmployeePageState();
}

class _DetailEmployeePageState extends State<DetailEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            GetStorage().remove('isLogin');
          },
          child: Text(
            'Detail Employee',
            style: whiteTextFont.copyWith(
                fontWeight: FontWeight.bold, fontSize: Get.height * 0.025),
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                  color: bluePrimary,
                  height: Get.height * 0.25,
                  width: double.infinity,
                  child: Center(
                      child: Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.3,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      widget.employee.avatar)))))),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('First Name',
                                style: blackTextFont.copyWith(
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.employee.firstName,
                                style: greyTextFont.copyWith(
                                    fontSize: Get.height * 0.03,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Container(
                          height: Get.height * 0.08,
                          color: bluePrimary,
                          width: 1,
                        ),
                        Column(
                          children: [
                            Text('Last Name',
                                style: blackTextFont.copyWith(
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.employee.lastName,
                                style: greyTextFont.copyWith(
                                    fontSize: Get.height * 0.03,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Employee ID',
                        style: greyTextFont.copyWith(
                            fontSize: Get.height * 0.020,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.employee.id.toString(),
                        style: blackTextFont.copyWith(
                            fontSize: Get.height * 0.03,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Email',
                        style: greyTextFont.copyWith(
                            fontSize: Get.height * 0.020,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.employee.email,
                        style: blackTextFont.copyWith(
                            fontSize: Get.height * 0.03,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
