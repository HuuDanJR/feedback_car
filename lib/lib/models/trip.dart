
class TripModel {
    final bool status;
    final String message;
    final DataTrip data;

    TripModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        status: json["status"],
        message: json["message"],
        data: DataTrip.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DataTrip {
    final String id;
    final String feedbackId;
    final String driver;
    final String customerName;
    final String customerNumber;
    final String from;
    final String to;
    final DateTime createdAt;
    final int v;

    DataTrip({
        required this.id,
        required this.feedbackId,
        required this.driver,
        required this.customerName,
        required this.customerNumber,
        required this.from,
        required this.to,
        required this.createdAt,
        required this.v,
    });

    factory DataTrip.fromJson(Map<String, dynamic> json) => DataTrip(
        id: json["_id"],
        feedbackId: json["feedback_id"],
        driver: json["driver"],
        customerName: json["customer_name"],
        customerNumber: json["customer_number"],
        from: json["from"],
        to: json["to"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "feedback_id": feedbackId,
        "driver": driver,
        "customer_name": customerName,
        "customer_number": customerNumber,
        "from": from,
        "to": to,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
