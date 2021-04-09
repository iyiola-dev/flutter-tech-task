class Ingredient {
  String title;
  String useBy;
  bool isSelected = false;
  bool isExpired = false;
  Ingredient({this.title, this.useBy, this.isSelected, this.isExpired});

  Ingredient.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    useBy = json['use-by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['use-by'] = this.useBy;
    return data;
  }
}
