class TimelineHeader {
  int year;
  int count;

  TimelineHeader({this.year, this.count});

  String getYearString() {
    return year.toString();
  }

  String getCountString() {
    return count.toString();
  }

  factory TimelineHeader.setFromJSON(Map<String, dynamic> json) {
    return TimelineHeader(year: json["year"], count: json["count"]);
  }
}
