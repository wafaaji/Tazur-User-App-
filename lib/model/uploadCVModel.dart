class UploadCVModel {
  final String message;
  final String cvFile;

  UploadCVModel({
    required this.message,
    required this.cvFile,
  });

  factory UploadCVModel.fromJson(Map<String, dynamic> json) {
    return UploadCVModel(
      message: json['message'],
      cvFile: json['cv_file'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['cv_file'] = this.cvFile;
    return data;
  }
}
