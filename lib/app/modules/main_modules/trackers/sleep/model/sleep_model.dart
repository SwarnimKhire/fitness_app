class Sleep {
  final int? id;
  final int? userId;
  final String? sleepTime;
  final String? wakeUpTime;
  final String? date;
  final String? time;

  Sleep({
    this.id,
    this.userId,
    this.sleepTime,
    this.wakeUpTime,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userId,
      'sleeptime': sleepTime,
      'wakeup_time': wakeUpTime,
      'date': date,
      'time': time,
    };
  }

  static Sleep fromMap(Map<String, dynamic> map) {
    return Sleep(
      id: map['id'],
      userId: map['userid'],
      sleepTime: map['sleeptime'],
      wakeUpTime: map['wakeup_time'],
      date: map['date'],
      time: map['time'],
    );
  }
}
