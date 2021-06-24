part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController scrollController = ScrollController();
  var isSearching = false;
  final EmployeeController employeeController = Get.put(EmployeeController());
  int page = 1;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          page++;
          employeeController.getMoreEmployee(page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        shadowColor: Colors.black12,
        title: Text(
          'TRANSISI EMPLOYEE',
          style: whiteTextFont.copyWith(
              fontWeight: FontWeight.bold, fontSize: Get.height * 0.025),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  GetStorage().remove('isLogin');
                  Get.offAll(LoginPage());
                },
                child: Icon(Icons.logout),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: bluePrimary,
          onPressed: () {
            Get.to(CreateEmployeePage());
          },
          child: Icon(Icons.add)),
      body: Obx(() => SafeArea(
              child: Container(
            height: Get.height - 80,
            child: employeeController.isLoading.value && page == 1
                ? Shimmer.fromColors(
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (ctx, i) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            height: Get.height * 0.12,
                            margin: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                          );
                        }),
                    baseColor: Colors.white54,
                    highlightColor: Colors.grey[300],
                  )
                : !employeeController.isLoading.value &&
                        employeeController.listEmployee.length == 0
                    ? Container(
                        height: Get.height,
                        child: Center(child: Text('Employee list is empty')))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: employeeController.listEmployee.length +
                            (!employeeController.isLoading.value &&
                                    !employeeController
                                        .isMoreDataAvailable.value
                                ? 1
                                : 0),
                        itemBuilder: (context, i) {
                          if (i < employeeController.listEmployee.length &&
                              !employeeController.isMoreDataAvailable.value) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailEmployeePage(
                                    employeeController.listEmployee[i]));
                              },
                              child: EmployeeCard(
                                  employeeController.listEmployee[i]),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: bluePrimary,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    bluePrimary),
                              )),
                            );
                          }
                        }),
          ))),
    );
  }
}
