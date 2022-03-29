
const String yyyy = 'yyyy'; // 4 عدد سال
const String YYYY = 'YYYY'; // 4 عدد سال

const String yy = 'yy'; // 2 عدد سال
const String YY = 'YY'; // 2 عدد سال

const String mm = 'mm'; // 2 عدد ماه اگر ماه تک رقمی باشد 0 در اول ان قرار میدهد

const String m = 'm'; // 1 عدد ماه اگر ماه تک رقمی باشد 0 قرار نمیدهد

const String MM = 'MM'; // ماه به صورت حروفی کامل

const String M = 'M'; // ماه به صورت حروفی کوتاه

const String dd = 'dd'; // روز به صورت 2 عددی

const String d = 'd'; // روز به صورت تک رقمی برای روز های زیر 10

const String w = 'w'; // عدد هفته از ماه را بر میگرداند

const String DD = 'DD'; // نام روز

const String D = 'D'; // نام روز

const String hh = 'hh'; // ساعت با دو رقم اگر ساعت تک رقمی باشد 0 ابتدای عدد قرار میدهد فرمت 12 ساعته

const String h = 'h'; // ساعت با تک رقم فرمت 12 ساعته

const String HH = 'HH'; // ساعت با 2 رقم فرمت 24 ساعته

const String H = 'H'; // ساعت با تک رقم فرمت 24 ساعته

const String nn = 'nn'; // نمایشه دقیقه به صورت دو رقمی

const String n = 'n'; // نمایشه دقیقه به صورت تک رقمی

const String ss = 'ss'; // نمایش ثانیه دو رقمی

const String s = 's'; // نمایش ثانیه تک رقمی

const String SSS = 'SSS'; // نمایش میلی ثانیه

const String S = 'S'; // نمایش میلی ثانیه

const String uuu = 'uuu'; // نمایش میکرو ثانیه

const String u = 'u'; // نمایش میکرو ثانیه

const String am = 'am'; // نمایش وقت به صورت کوتاه
const String AM = 'AM'; // نمایش وقت به صورت کامل



class PersianDate {

  int _year = 1;
  int _month= 1;
  int _day= 1;
  int _weekday= 1;
  int _hour= 1;
  int _minute= 1;
  int _second= 1;
  int _millisecond= 1;
  int _microsecond= 1;
  String _getDate = '';
  String _getNow = '';

  String _defualtVal = "yyyy-mm-dd hh:nn:ss SSS";

  _pDate({required String defualtFormat, required String gregorian}) {
    var now;

    if (defualtFormat != '') _defualtVal = defualtFormat;

      gregorian = gregorian.replaceAll("/", "-");
      now = DateTime.parse(gregorian);
      List list = _gregorianToJalali(now.year, now.month, now.day);
      _setWeekday = now.weekday;
      _setYear = list[0];
      _setMonth = list[1];
      _setDay = list[2];
      _setHour = now.hour;
      _setMinute = now.minute;
      _setSecond = now.second;
      _setMicrosecond = now.microsecond;
      _setMillisecond = now.millisecond;
      _getDate = _toFormat(_defualtVal);
  }

  PersianDate({required String format, required String gregorian}){
    if(format != '') {
      _defualtVal = format;
    }

    if(gregorian == ''){
      _getNow = _now();
      _getDate = _now();
    }else{
      _pDate(defualtFormat: _defualtVal,gregorian: gregorian);
    }
  }

  String get getDate => _getDate;

  String get now => _getNow;

  String _now() {
    var now = DateTime.now();
    List list = _gregorianToJalali(now.year, now.month, now.day);
    _setWeekday = now.weekday;
    _setYear = list[0];
    _setMonth = list[1];
    _setDay = list[2];
    _setHour = now.hour;
    _setMinute = now.minute;
    _setSecond = now.second;
    _setMicrosecond = now.microsecond;
    _setMillisecond = now.millisecond;
    return _toFormat(_defualtVal);
  }

  final List<String> _monthShort = const <String>[
    'فرو',
    'ارد',
    'خرد',
    'تیر',
    'مرد',
    'شهر',
    'مهر',
    'آبا',
    'آذر',
    'دی',
    'بهم',
    'اسفن'
  ];

  final List<String> _monthLong = const <String>[
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  final List<String> _dayShort = const [
    'دو',
    'سه',
    'چه',
    'پن',
    'جم',
    'شن',
    'یک',
  ];

  final List<String> _dayLong = const [
    'دوشنبه',
    'سه شنبه',
    'چهارشنبه',
    'پنج شنبه',
    'جمعه',
    'شنبه',
    'یکشنبه',
  ];

  final _shamsiHoliday = [
    "0101",
    "0102",
    "0103",
    "0104",
    "0112",
    "0113",
    "0314",
    "0315",
    "1122",
    "1229",
  ];

   _gregorianToJalali(int y, int m, int d, [String? separator]) {
    var sumMonthDay = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    var jY = 0;
    if (y > 1600) {
      jY = 979;
      y -= 1600;
    } else {
      jY = 0;
      y -= 621;
    }
    var gy = (m > 2) ? y + 1 : y;
    var day = (365 * y) +
        ((gy + 3) ~/ 4) -
        ((gy + 99) ~/ 100) +
        ((gy + 399) ~/ 400) -
        80 +
        d +
        sumMonthDay[m - 1];
    jY += 33 * (day.round() / 12053).floor();
    day %= 12053;
    jY += 4 * (day.round() / 1461).floor();
    day %= 1461;
    jY += ((day.round() - 1) / 365).floor();
    if (day > 365) day = ((day - 1).round() % 365);
    int jm;
    var jd;
    int days = day.toInt();
    if (days < 186) {
      jm = 1 + (days ~/ 31);
      jd = 1 + (days % 31);
    } else {
      jm = 7 + ((days - 186) ~/ 30);
      jd = 1 + (days - 186) % 30;
    }
    var persionDate;
    if (separator == null) {
      persionDate = [jY, jm, jd];
    } else {
      persionDate = "$jY$separator$jm$separator$jd";
    }
    return persionDate;
  }

  _jalaliToGregorian(int y, int m, int d, [String? separator]) {
    int gY;
    if (y > 979) {
      gY = 1600;
      y -= 979;
    } else {
      gY = 621;
    }

    var days = (365 * y) +
        ((y / 33).floor() * 8) +
        (((y % 33) + 3) / 4) +
        78 +
        d +
        (((m < 7) ? (m - 1) * 31 : (((m - 7) * 30) + 186)));
    gY += 400 * (days ~/ 146097);
    days %= 146097;
    if (days.floor() > 36524) {
      gY += 100 * (--days ~/ 36524);
      days %= 36524;
      if (days >= 365) days++;
    }
    gY += 4 * (days ~/ 1461);
    days %= 1461;
    gY += (days - 1) ~/ 365;

    if (days > 365) days = (days - 1) % 365;
    var gD = (days + 1).floor();
    var montDays = [
      0,
      31,
      (((gY % 4 == 0) && (gY % 100 != 0)) || (gY % 400 == 0)) ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    int i = 0;
    for (; i <= 12; i++) {
      if (gD <= montDays[i]) break;
      gD -= montDays[i];
    }
    var gregorianDate;
    if (separator == null) {
      gregorianDate = [gY, i, gD];
    } else {
      gregorianDate = "$gY$separator$i$separator$gD";
    }
    return gregorianDate;
  }


  String get weekdayname => _dayLong[weekday - 1];

  String get monthname => _monthLong[month - 1];

  int get year => _year;

  set _setYear(int value) {
    _year = value;
  }

  int get month => _month;

  set _setMonth(int value) {
    _month = value;
  }

  int get day => _day;

  set _setDay(int value) {
    _day = value;
  }

  int get weekday => _weekday;

  set _setWeekday(int value) {
    _weekday = value;
  }

  int get hour => _hour;

  set _setHour(int value) {
    _hour = value;
  }

  int get minute => _minute;

  bool get isHoliday {
    if (weekday == 5) {
      return true;
    } else if (_shamsiHoliday
        .contains("${_digits(month, 2)}${_digits(day, 2)}")) {
      return true;
    } else {
      return false;
    }
  }

  set _setMinute(int value) {
    _minute = value;
  }

  int get second => _second;

  set _setSecond(int value) {
    _second = value;
  }

  int get  microsecond => _microsecond;

  set _setMicrosecond(int value) {
    _microsecond = value;
  }

  int get millisecond => _millisecond;

  set _setMillisecond(int value) {
    _millisecond = value;
  }

  _toFormat(String format) {
    String newFormat = format;
    if (newFormat.indexOf(yyyy) != -1 || newFormat.indexOf(YYYY) != -1) {
      newFormat = newFormat.replaceFirst(yyyy, _digits(year, 4));
    }
    if (newFormat.indexOf(yy) != -1 || newFormat.indexOf(YY) != -1) {
      newFormat = newFormat.replaceFirst(yy, _digits(year % 100, 2));
    }
    if (newFormat.indexOf(mm) != -1) {
      newFormat = newFormat.replaceFirst(mm, _digits(month, 2));
    }
    if (newFormat.indexOf(m) != -1) {
      newFormat = newFormat.replaceFirst(m, month.toString());
    }
    if (newFormat.indexOf(MM) != -1) {
      newFormat = newFormat.replaceFirst(MM, _monthLong[month - 1]);
    }
    if (newFormat.indexOf(M) != -1) {
      newFormat = newFormat.replaceFirst(M, _monthShort[month - 1]);
    }
    if (newFormat.indexOf(dd) != -1) {
      newFormat = newFormat.replaceFirst(dd, _digits(day, 2));
    }
    if (newFormat.indexOf(d) != -1) {
      newFormat = newFormat.replaceFirst(d, day.toString());
    }
    if (newFormat.indexOf(w) != -1) {
      newFormat = newFormat.replaceFirst(w, ((day + 7) ~/ 7).toString());
    }
    if (newFormat.indexOf(DD) != -1) {
      newFormat = newFormat.replaceFirst(DD, _dayLong[weekday - 1]);
    }
    if (newFormat.indexOf(D) != -1) {
      newFormat = newFormat.replaceFirst(D, _dayShort[weekday - 1]);
    }
    if (newFormat.indexOf(HH) != -1) {
      newFormat = newFormat.replaceFirst(HH, _digits(hour, 2));
    }
    if (newFormat.indexOf(H) != -1) {
      newFormat = newFormat.replaceFirst(H, hour.toString());
    }
    if (newFormat.indexOf(hh) != -1) {
      newFormat = newFormat.replaceFirst(hh, _digits(hour % 12, 2));
    }
    if (newFormat.indexOf(h) != -1) {
      newFormat = newFormat.replaceFirst(h, (hour % 12).toString());
    }
    if (newFormat.indexOf(AM) != -1) {
      newFormat = newFormat.replaceFirst(
          AM, hour < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
    }
    if (newFormat.indexOf(am) != -1) {
      newFormat = newFormat.replaceFirst(am, hour < 12 ? 'ق.ظ' : 'ب.ظ');
    }
    if (newFormat.indexOf(nn) != -1) {
      newFormat = newFormat.replaceFirst(nn, _digits(minute, 2));
    }
    if (newFormat.indexOf(n) != -1) {
      newFormat = newFormat.replaceFirst(n, minute.toString());
    }
    if (newFormat.indexOf(ss) != -1) {
      newFormat = newFormat.replaceFirst(ss, _digits(second, 2));
    }
    if (newFormat.indexOf(s) != -1) {
      newFormat = newFormat.replaceFirst(s, second.toString());
    }
    if (newFormat.indexOf(SSS) != -1) {
      newFormat = newFormat.replaceFirst(SSS, _digits(millisecond, 3));
    }
    if (newFormat.indexOf(S) != -1) {
      newFormat = newFormat.replaceFirst(S, millisecond.toString());
    }
    if (newFormat.indexOf(uuu) != -1) {
      newFormat = newFormat.replaceFirst(uuu, _digits(microsecond, 2));
    }
    if (newFormat.indexOf(u) != -1) {
      newFormat = newFormat.replaceFirst(u, microsecond.toString());
    }
    return newFormat;
  }

  parse(String formattedString, [String? separator]) {
    var parse = DateTime.parse(formattedString);
    if (separator == null) {
      List parseList = _gregorianToJalali(parse.year, parse.month, parse.day);
      parseList.add(parse.hour);
      parseList.add(parse.minute);
      parseList.add(parse.second);
      return parseList;
    } else {
      return "${_gregorianToJalali(parse.year, parse.month, parse.day, separator)} ${parse.hour}:${parse.minute}:${parse.second}";
    }
  }

  gregorianToJalali(String parseDate, [String? format]) {
    var parse = DateTime.parse(parseDate);
    var jParse = _gregorianToJalali(parse.year, parse.month, parse.day);
    if (format == '') format = _defualtVal;

    String newFormat = format.toString();

    if (newFormat.indexOf(yyyy) != -1) {
      newFormat = newFormat.replaceFirst(yyyy, _digits(jParse[0], 4));
    }
    if (newFormat.indexOf(yy) != -1) {
      newFormat = newFormat.replaceFirst(yy, _digits(jParse[0] % 100, 2));
    }
    if (newFormat.indexOf(mm) != -1) {
      newFormat = newFormat.replaceFirst(mm, _digits(jParse[1], 2));
    }
    if (newFormat.indexOf(m) != -1) {
      newFormat = newFormat.replaceFirst(m, jParse[1].toString());
    }
    if (newFormat.indexOf(MM) != -1) {
      newFormat = newFormat.replaceFirst(MM, _monthLong[jParse[1] - 1]);
    }
    if (newFormat.indexOf(M) != -1) {
      newFormat = newFormat.replaceFirst(M, _monthShort[jParse[1] - 1]);
    }
    if (newFormat.indexOf(dd) != -1) {
      newFormat = newFormat.replaceFirst(dd, jParse[2].toString());
    }
    if (newFormat.indexOf(d) != -1) {
      newFormat = newFormat.replaceFirst(d, _digits(jParse[2], 2));
    }
    if (newFormat.indexOf(w) != -1) {
      newFormat = newFormat.replaceFirst(w, ((jParse[2] + 7) ~/ 7).toString());
    }
    if (newFormat.indexOf(DD) != -1) {
      newFormat = newFormat.replaceFirst(DD, _dayLong[parse.weekday - 1]);
    }
    if (newFormat.indexOf(D) != -1) {
      newFormat = newFormat.replaceFirst(D, _dayShort[parse.weekday - 1]);
    }
    if (newFormat.indexOf(HH) != -1) {
      newFormat = newFormat.replaceFirst(HH, _digits(parse.hour, 2));
    }
    if (newFormat.indexOf(H) != -1) {
      newFormat = newFormat.replaceFirst(H, parse.hour.toString());
    }
    if (newFormat.indexOf(hh) != -1) {
      newFormat = newFormat.replaceFirst(hh, _digits(parse.hour % 12, 2));
    }
    if (newFormat.indexOf(h) != -1) {
      newFormat = newFormat.replaceFirst(h, (parse.hour % 12).toString());
    }
    if (newFormat.indexOf(AM) != -1) {
      newFormat = newFormat.replaceFirst(
          AM, parse.hour < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
    }
    if (newFormat.indexOf(am) != -1) {
      newFormat = newFormat.replaceFirst(am, parse.hour < 12 ? 'ق.ظ' : 'ب.ظ');
    }
    if (newFormat.indexOf(nn) != -1) {
      newFormat = newFormat.replaceFirst(nn, _digits(parse.minute, 2));
    }
    if (newFormat.indexOf(n) != -1) {
      newFormat = newFormat.replaceFirst(n, parse.minute.toString());
    }
    if (newFormat.indexOf(ss) != -1) {
      newFormat = newFormat.replaceFirst(ss, _digits(parse.second, 2));
    }
    if (newFormat.indexOf(s) != -1) {
      newFormat = newFormat.replaceFirst(s, parse.second.toString());
    }
    if (newFormat.indexOf(SSS) != -1) {
      newFormat = newFormat.replaceFirst(SSS, _digits(parse.millisecond, 3));
    }
    if (newFormat.indexOf(S) != -1) {
      newFormat = newFormat.replaceFirst(S, parse.millisecond.toString());
    }
    if (newFormat.indexOf(uuu) != -1) {
      newFormat = newFormat.replaceFirst(uuu, _digits(parse.microsecond, 2));
    }
    if (newFormat.indexOf(u) != -1) {
      newFormat = newFormat.replaceFirst(u, parse.microsecond.toString());
    }
    return newFormat;
  }

  DateTime jalaliToGregorian(String parseDate) {
    var re = _parseFormat;
    Match match = re.firstMatch(parseDate) as Match;
    int parseIntOrZero(String matched) {
      if (matched == '') return 0;
      return int.parse(matched);
    }
    int years = int.parse(match[1].toString());
    int month = int.parse(match[2].toString());
    int day = int.parse(match[3].toString());
    int hour = parseIntOrZero(match[4].toString());
    int minute = parseIntOrZero(match[5].toString());
    int second = parseIntOrZero(match[6].toString());
    var jParse = _jalaliToGregorian(years, month, day);
    var parse = DateTime.parse("${jParse[0]}-${_digits(jParse[1], 2)}-${_digits(jParse[2], 2)} ${_digits(hour, 2)}:${_digits(minute, 2)}:${_digits(second, 2)}");
    return parse;
  }

  String _digits(int value, int length) {
    String ret = '$value';
    if (ret.length < length) {
      ret = '0' * (length - ret.length) + ret;
    }
    return ret;
  }


  static final RegExp _parseFormat = RegExp(
      r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
      r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d{1,6}))?)?)?' // Time part.
      r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$');

}
