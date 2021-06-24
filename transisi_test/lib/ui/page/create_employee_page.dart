part of 'pages.dart';

class CreateEmployeePage extends StatefulWidget {
  @override
  _CreateEmployeePageState createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  final EmployeeController employeeController = Get.put(EmployeeController());
  TextEditingController tName = TextEditingController();
  TextEditingController tJob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Create Employee',
          style: whiteTextFont.copyWith(
              fontWeight: FontWeight.bold, fontSize: Get.height * 0.025),
        ),
      ),
      body: Obx(() => SafeArea(
              child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: bluePrimary,
                    height: Get.height * 0.25,
                    width: double.infinity,
                    child: Center(
                      child: Icon(Icons.person,
                          color: Colors.white, size: Get.height * 0.2),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Employee Name',
                              style: blueTextFont.copyWith(
                                  fontSize: Get.height * 0.025,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: blueTextFont,
                            controller: tName,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter employee name ",
                                hintStyle: blueTextFont,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Job',
                              style: blueTextFont.copyWith(
                                  fontSize: Get.height * 0.025,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: blueTextFont,
                            controller: tJob,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter employee job ",
                                hintStyle: blueTextFont,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: bluePrimary),
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Get.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: bluePrimary,
                                  padding: EdgeInsets.all(12),
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());

                                if (tName.text.isEmpty || tJob.text.isEmpty) {
                                  Get.snackbar(
                                      'Error', 'Name and Job cannot be empty',
                                      margin: EdgeInsets.all(12),
                                      backgroundColor: Colors.white70,
                                      snackPosition: SnackPosition.BOTTOM);
                                } else {
                                  employeeController.createEmployee(
                                      tName.text, tJob.text);
                                }
                              },
                              child: employeeController.isLoading.value
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        backgroundColor: bluePrimary,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      )),
                                    )
                                  : Text(
                                      'CREATE',
                                      style: whiteTextFont.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                            ),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ))),
    );
  }
}
