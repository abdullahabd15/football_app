class CountriesResponse {
  List<Country> countries;

  CountriesResponse({this.countries});

  CountriesResponse.fromMap(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries.add(new Country.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Country {
  String nameEn;
  bool isLoading;

  Country({this.nameEn, this.isLoading});

  Country.fromMap(Map<String, dynamic> json) {
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    return data;
  }
}