class Food {
  final int? id;
  final int? userId;
  final String? foodName;
  final String? unit;
  final String? date;
  final String? time;

  Food({
    this.id,
    this.userId,
    this.foodName,
    this.unit,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userId,
      'foodname': foodName,
      'unit': unit,
      'date': date,
      'time': time,
    };
  }

  static Food fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'],
      userId: map['userid'],
      foodName: map['foodname'],
      unit: map['unit'],
      date: map['date'],
      time: map['time'],
    );
  }
}
