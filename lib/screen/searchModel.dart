class SearchModel {
  int id;
  String name;
  String status;
  String address;
  String taxPayerType;
  String businessType;
  String dateOfReg;

  SearchModel(
      {this.id,
        this.name,
        this.status,
        this.address,
        this.taxPayerType,
        this.businessType,
        this.dateOfReg});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    address = json['address'];
    taxPayerType = json['tax_payer_type'];
    businessType = json['business_type'];
    dateOfReg = json['date_of_reg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['address'] = this.address;
    data['tax_payer_type'] = this.taxPayerType;
    data['business_type'] = this.businessType;
    data['date_of_reg'] = this.dateOfReg;
    return data;
  }
}
