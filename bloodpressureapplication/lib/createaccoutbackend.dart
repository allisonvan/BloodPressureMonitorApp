class User{
  String firstName = 'null';
  String lastName = 'null';
  String email = 'null';
  String phone = 'null';
  String password = 'null';
  //contructor
  User(String firstName, String lastName, String email, String phone, String password){
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phone = phone;
    this.password = password;
  }
}