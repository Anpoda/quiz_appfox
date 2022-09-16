import 'package:intl/intl.dart';

class DateTimeHelper {
  String getTime(){
    var timeNow = DateTime.now();
    var formatter = DateFormat('HH:mm:ss');
    String formattedTime = formatter.format(timeNow);
    return formattedTime;
  }

  String getDate(){
    var dateNow = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(dateNow);
    return formattedDate;
  }
}