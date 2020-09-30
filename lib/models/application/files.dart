class Files {
  int id;
  String name;
  String fileName;
  String mimeType;
  int size;
  String createdAt;
  String description;
  String url;
  bool selected = false;

  Files({
    this.id,
    this.name,
    this.fileName,
    this.mimeType,
    this.size,
    this.createdAt,
    this.description,
    this.url,
  });

  Files.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap["id"],
        name = jsonMap["name"] ?? "",
        fileName = jsonMap["file_name"] ?? "",
        mimeType = jsonMap["mime_type"] ?? "",
        size = jsonMap["size"] ?? 0,
        createdAt = jsonMap["created_at"] ?? "",
        description = jsonMap["description"] ?? "",
        url = jsonMap["url"] ?? "";

  Map<String, dynamic> toJson() =>
      {"file": fileName, "description": description};
}
