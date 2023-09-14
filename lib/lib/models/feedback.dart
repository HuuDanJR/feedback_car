


class FeedBack {
    final bool status;
    final String message;
    final int totalResult;
    final List<FeedBackData> data;

    FeedBack({
        required this.status,
        required this.message,
        required this.totalResult,
        required this.data,
    });

    factory FeedBack.fromJson(Map<String, dynamic> json) => FeedBack(
        status: json["status"],
        message: json["message"],
        totalResult: json["totalResult"],
        data: List<FeedBackData>.from(json["data"].map((x) => FeedBackData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalResult": totalResult,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class FeedBackData {
    final String id;
    final String datumId;
    final String driver;
    final int star;
    final String content;
    final List<String> experience;
    final String status;
    final String createdAt;
    final int v;

    FeedBackData({
        required this.id,
        required this.datumId,
        required this.driver,
        required this.star,
        required this.content,
        required this.experience,
        required this.status,
        required this.createdAt,
        required this.v,
    });

    factory FeedBackData.fromJson(Map<String, dynamic> json) => FeedBackData(
        id: json["_id"],
        datumId: json["id"],
        driver: json["driver"],
        star: json["star"],
        content: json["content"],
        experience: List<String>.from(json["experience"].map((x) => x)),
        status: json["status"],
        createdAt: json["createdAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "driver": driver,
        "star": star,
        "content": content,
        "experience": List<dynamic>.from(experience.map((x) => x)),
        "status": status,
        "createdAt": createdAt,
        "__v": v,
    };
}
