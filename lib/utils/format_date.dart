class FormatDate {
  static format(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
}
