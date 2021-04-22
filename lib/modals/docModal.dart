class DocModal {
  final String name;
  final String category;
  final String profilepic;
  final int phno;
  final String dob;
  final String dis;
  final String address;
  final String clinicAddress;
  final String sex;
  final int regID;
  final String uid;

  DocModal(
      {this.name,
      this.category,
      this.profilepic,
      this.phno,
      this.dob,
      this.dis,
      this.address,
      this.clinicAddress,
      this.sex,
      this.regID,
      this.uid});

  factory DocModal.fromJson(Map<String, dynamic> json) {
    return DocModal(
      name: json['name'],
      category: json['category'],
      profilepic: json['profilepic'],
      phno: json['phno'],
      dob: json['dob'],
      dis: json['dis'],
      address: json['address'],
      clinicAddress: json['clinicAddress'],
      sex: json['sex'],
      regID: json['regID'],
      uid: json['uid'],
    );
  }
}
