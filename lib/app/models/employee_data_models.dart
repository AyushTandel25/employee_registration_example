const String tableName = "employee_table";

class EmployeeData {
  final int? id;
  final String? name;
  final int? age;
  final String? mobileNumber;
  final String? email;
  final String? address;
  final String? state;
  final String? country;
  final String? pincode;
  final String? password;
  final String? createdDate;

  EmployeeData({
    this.id,
    this.name,
    this.age,
    this.mobileNumber,
    this.email,
    this.address,
    this.state,
    this.country,
    this.pincode,
    this.password,
    this.createdDate,
  });

  Map<String, dynamic> toJson() => {
        EmployeeFields.id: id,
        EmployeeFields.name: name,
        EmployeeFields.age: age,
        EmployeeFields.mobileNumber: mobileNumber,
        EmployeeFields.email: email,
        EmployeeFields.password: password,
        EmployeeFields.address: address,
        EmployeeFields.state: state,
        EmployeeFields.country: country,
        EmployeeFields.pincode: pincode,
        EmployeeFields.createdDate: createdDate,
      };

  static EmployeeData fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json[EmployeeFields.id],
        name: json[EmployeeFields.name],
        age: json[EmployeeFields.age],
        mobileNumber: json[EmployeeFields.mobileNumber],
        email: json[EmployeeFields.email],
        password: json[EmployeeFields.password],
        address: json[EmployeeFields.address],
        state: json[EmployeeFields.state],
        country: json[EmployeeFields.country],
        pincode: json[EmployeeFields.pincode],
        createdDate: json[EmployeeFields.createdDate],
      );

  EmployeeData copy({
    int? id,
    String? name,
    int? age,
    String? mobileNumber,
    String? email,
    String? address,
    String? state,
    String? country,
    String? pincode,
    String? password,
    String? createdDate,
  }) {
    return EmployeeData(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      state: state ?? this.state,
      country: country ?? this.country,
      pincode: pincode ?? this.pincode,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}

class EmployeeFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String age = 'age';
  static const String mobileNumber = 'mobileNumber';
  static const String email = 'email';
  static const String address = 'address';
  static const String state = 'state';
  static const String country = 'country';
  static const String pincode = 'pincode';
  static const String password = 'password';
  static const String createdDate = 'createdDate';

  static final List<String> values = [
    id,
    name,
    age,
    mobileNumber,
    email,
    address,
    state,
    createdDate,
    country,
    pincode,
    password,
    createdDate
  ];
}
