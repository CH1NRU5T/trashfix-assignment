class TaskModel {
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;
  DateTime? completedAt;
  TaskModel({
    required this.title,
    required this.createdAt,
    required this.description,
    required this.isCompleted,
    this.completedAt,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  String toString() {
    return 'TaskModel(title: $title, description: $description, isCompleted: $isCompleted, createdAt: $createdAt, completedAt: $completedAt)';
  }
}
