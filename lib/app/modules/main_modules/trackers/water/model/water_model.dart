class Water {
  final int? id;
  final int? userId;
  final int? waterGlass;
  final String? date;
  final String? time;

  Water({
    this.id,
    this.userId,
    this.waterGlass,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userId,
      'waterglass': waterGlass,
      'date': date,
      'time': time,
    };
  }

  static Water fromMap(Map<String, dynamic> map) {
    return Water(
      id: map['id'],
      userId: map['userid'],
      waterGlass: map['waterglass'],
      date: map['date'],
      time: map['time'],
    );
  }
}