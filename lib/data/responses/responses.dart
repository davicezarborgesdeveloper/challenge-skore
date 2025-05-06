class HomeResponse {
  final List<Discipline>? discipline;
  HomeResponse({
    this.discipline,
  });

  factory HomeResponse.fromJson(List<dynamic> json) {
    return HomeResponse(
        discipline:
            List<Discipline>.from(json.map((x) => Discipline.fromJson(x))));
  }
}

class Discipline {
  final String? companyId;
  final DateTime? createdAt;
  final String? name;
  final String? id;
  final DisciplineStatus? status;
  final Summary? summary;
  Discipline({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'companyId': companyId,
      'createdAt': createdAt,
      'name': name,
      'id': id,
      'status': status,
      'summary': summary?.toJson(),
    };
  }

  factory Discipline.fromJson(Map<String, dynamic> map) {
    return Discipline(
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['created_at'] ?? 0) as int)
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      status: map['status'] != null
          ? switch (map['status']) {
              'COMPLETED' => DisciplineStatus.completed,
              'IN_PROGRESS' => DisciplineStatus.inProgress,
              'NOT_STARTED' => DisciplineStatus.notStarted,
              _ => DisciplineStatus.notStarted
            }
          : null,
      summary: map['summary'] != null
          ? Summary.fromJson(map['summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Summary {
  int percentage;
  Summary(this.percentage);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'percentage': percentage,
    };
  }

  factory Summary.fromJson(Map<String, dynamic> map) {
    return Summary(
      (map['percentage'] ?? 0) as int,
    );
  }
}

enum DisciplineStatus {
  completed,
  inProgress,
  notStarted,
}
