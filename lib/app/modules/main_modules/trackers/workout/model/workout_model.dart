class Workout {
  final int? id;
  final int? userId;
  final String? workoutName;
  final String? time;
  final String? date;

  Workout({
    this.id,
    this.userId,
    this.workoutName,
    this.time,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userId,
      'workoutname': workoutName,
      'time': time,
      'date': date,
    };
  }

  static Workout fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      userId: map['userid'],
      workoutName: map['workoutname'],
      time: map['time'],
      date: map['date'],
    );
  }
}
