import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toty/db/dbModels/Attendance.dart';

class AttendanceRepository {
  String collectionName = 'attendances';
  Firestore _db;
  CollectionReference attendances;

  AttendanceRepository() {
    _db = Firestore.instance;
    attendances = _db.collection(this.collectionName);
  }

  /// Adds an attendance to the db
  Future<void> createAttendance(Attendance attendance) async {
    return await attendances.add(attendance.toJson());
  }

  /// Updates attendance data
  Future<void> updateAttendance(Attendance attendance) async {
    return await attendances
        .document(attendance.attendanceId)
        .setData(attendance.toJson(), merge: true);
  }

  /// Deletes an attendance
  Future<void> deleteAttendance(String attendanceId) {
    return attendances.document(attendanceId).delete();
  }

  /// Gets a list of attendance for the given uid
  Stream<List<Attendance>> getAttendancesForUser(String uid) {
    return attendances.where('userId', isEqualTo: uid).snapshots().map(
          (snap) => snap.documents
              .map((e) => Attendance.fromJson(e.documentID, e.data))
              .toList(),
        );
  }

  /// Gets a list of attendance for the given matchId
  Stream<List<Attendance>> getAttendancesForMatch(String matchId) {
    return attendances.where('matchId', isEqualTo: matchId).snapshots().map(
        (snap) => snap.documents
            .map((e) => Attendance.fromJson(e.documentID, e.data))
            .toList());
  }
}
