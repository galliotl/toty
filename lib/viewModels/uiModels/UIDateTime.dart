import 'UIModel.dart';

class UIDateTime implements IUIModel {
  String month;
  String day;
  int dayNumber;
  String hour;
  String minute;

  UIDateTime(DateTime time) {
    this.day = dayNumberToString(time.weekday);
    this.dayNumber = time.day;
    this.month = monthToString(time.month);
    this.hour = time.hour.toString();
    this.minute = time.minute.toString();
  }

  String dayNumberToString(int day) {
    switch(day) {
      case 1: return 'Mon.';
      case 2: return 'Tue.';
      case 3: return 'Wed.';
      case 4: return 'Thu.';
      case 5: return 'Fri.';
      case 6: return 'Sat.';
      case 7: return 'Sun.';
      default: throw Error();
    }
  }
  
  String monthToString(int month) {
    switch(month) {
      case 1: return 'jan.';
      case 2: return 'feb.';
      case 3: return 'mar.';
      case 4: return 'apr.';
      case 5: return 'may';
      case 6: return 'jun.';
      case 7: return 'jul.';
      case 8: return 'aug.';
      case 9: return 'sep.';
      case 10: return 'oct.';
      case 11: return 'nov.';
      case 12: return 'dec.';
      default: throw Error();
    }
  }

}