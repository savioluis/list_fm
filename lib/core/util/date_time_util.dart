class DateTimeUtil {
  static const List<String> _months = [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro",
  ];

  static String getMonthName(int month) {
    return _months[month - 1];
  }

  static DateTime fromUnixTime(int unix) {
    late int ms;
    if (unix.abs() < 1000000000000) {
      ms = unix * 1000;
    } else if (unix.abs() < 1000000000000000) {
      ms = unix;
    } else {
      ms = (unix / 1000).round();
    }
    final dtUtc = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
    return dtUtc;
  }
}
