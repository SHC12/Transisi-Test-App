part of 'widgets.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard(this.employee);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: bluePrimary.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                employee.avatar,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(employee.firstName + ' ' + employee.lastName,
                      style: blackTextFont.copyWith(
                          fontSize: Get.height * 0.03,
                          fontWeight: FontWeight.w500)),
                  Text(employee.email,
                      style: greyTextFont.copyWith(
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.w500))
                ],
              ))
        ],
      ),
    );
  }
}
