import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'createaccoutbackend.dart';
class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPasswordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
     String firstName = ' ';
     String lastName = ' ';
     String email = ' ';
     String phone = ' ';
     String password = ' ';
     String repeatPassword = '';
    //Error Texts
    String firstNameError = '';
    String lastNameError = '';
    String passwordError = '';
    String repeatPasswordError = '';
    String emptyError = '';
    String phoneError = '';
    String emailError = '';

  @override
  Widget build(BuildContext context) {
    


     void saveInput(){
        firstName = firstNameController.text;
        lastName = lastNameController.text;
        email = emailController.text;
        phone = phoneController.text;
        password = passwordController.text;
        repeatPassword = repeatPasswordController.text;
     }
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 241, 215, 217),
      appBar: AppBar(title: const Text ('Create an Account', 
      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500, color: Colors.white,),),
      iconTheme: const IconThemeData(color: Colors.white,), 
      backgroundColor:Color(0xFFE76C78) ,),
      body:SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const SizedBox(height: 10.0),
        TextField(controller: firstNameController,
          decoration: InputDecoration(labelText: 'First Name',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250), 
          errorText: firstNameError.isEmpty ? null : firstNameError, 
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943) ,), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color(0xFFB82943), width: 1.5), ),),),

        const SizedBox(height: 25.0), //space in between
        TextField(controller: lastNameController,
          decoration: InputDecoration(labelText: 'Last Name',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250), 
          errorText: lastNameError.isEmpty ? null : lastNameError, 
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943) ,), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color(0xFFB82943), width: 1.5), ),),),

        const SizedBox(height: 25.0), //space in between
        TextField(controller: emailController,
          decoration: InputDecoration(labelText: 'Email',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250), 
          errorText: emailError.isEmpty ? null : emailError, 
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943) ,), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color(0xFFB82943), width: 1.5), ),),),
        const SizedBox(height: 3.0), //space in between
        const Align(
          alignment: Alignment.centerLeft, // Pushes the text to the left
          child: Text(
            "     Format: email@domain.com",
            style: TextStyle(
            fontSize: 11,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Color(0xFFB82943),
            ),
          ),
        ),
         const SizedBox(height: 20.0),
        TextField(controller: phoneController,
          decoration: InputDecoration(labelText: 'Phone Number',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250),  
          errorText: phoneError.isEmpty ? null : phoneError,
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943) ,), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color(0xFFB82943), width: 1.5), ),),),

        const SizedBox(height: 3.0), //space in between
        const Align(
          alignment: Alignment.centerLeft, // Pushes the text to the left
          child: Text(
            "     Format: XXX-XXX-XXXX",
            style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Color(0xFFB82943),
            ),
          ),
        ),
         const SizedBox(height: 20.0),
        TextField(controller: passwordController,
          obscureText: true, decoration: InputDecoration(labelText: 'Password',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250), 
          errorText: passwordError.isEmpty ? null : passwordError,  
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943) ,), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:   Color(0xFFB82943), width: 1.5), ),),),
      
        const SizedBox(height: 25.0), //space in between
        TextField(controller: repeatPasswordController,
          obscureText: true, decoration: InputDecoration(labelText: 'Repeat Password',
          filled: true, fillColor: Color.fromARGB(255, 255, 250, 250), 
          errorText: repeatPasswordError.isEmpty ? null : repeatPasswordError,
          floatingLabelStyle: TextStyle(
          color:  Color(0xFFB82943),), 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 139, 140, 147), width: 1.5),), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color(0xFFB82943), width: 1.5),
          ),),),
        
        const SizedBox(height:40),
        SizedBox( width: double.infinity, height: 65,
         child: ElevatedButton(onPressed:(){
            bool inputError = false; 
            saveInput();
          setState(() {
  
            for(int i = 0; i < email.length; i++ ){
              if(email[i]  == ' '){
                emailError = "Email cannot contain spaces";
                inputError = true;
                break;
              }
              else {emailError = '';}
            }
            for(int i = 0; i < phone.length; i++ ){
              if(phone[i]  == ' '){
                phoneError = "Phone cannot contain spaces";
                inputError = true;
                break;
              }
              else{phoneError = '';}
            }

            if (passwordController.text != repeatPasswordController.text) {
              repeatPasswordError = "Passwords do not match";
            } 
            else {
            repeatPasswordError = '';
            for(int i = 0; i < password.length; i++ ){
              if(password[i]  == ' '){
                passwordError = "Password cannot contain spaces";
                repeatPasswordError = "Password cannot contain spaces";
                inputError = true;
                break;
              }
              else{
                passwordError = '';
                repeatPasswordError = '';}
            }
            }
            if(phone.length == 12){
            if(phone[3]!='-' || phone[7]!='-'){
              phoneError = "Phone Number should only contain numbers and dashes";
              inputError = true;
            }
            else{phoneError = '';}

            for(int i = 0; i < phone.length; i++){
            if(i == 3 || i==7){
              i++;
            }
            int? phoneInt = int.tryParse(phone[i]);
            if (phoneInt == null){
              phoneError = "Phone Number should only contain numbers and dashes";
              inputError = true;
            }
            else{phoneError = '';}
            }}
            else{
              inputError = true;
              phoneError = "Invalid Phone Number length";
              print('phone string not long enough');
            }

            bool emailsafe = false;

            for(int i = 0; i < email.length; i++){
              if(email[i] == '@'){
                emailsafe = true;
                emailError = '';
                break;
              }
            }
            if(emailsafe == false){
                emailError = "Invalid email addresss";
                inputError = true;
              }
            if(firstName.isEmpty){
              firstNameError = "Please enter a First Name";
               inputError = true;
            }
            else{lastNameError = '';}

            if(lastName.isEmpty){
              lastNameError = "Please enter a Last Name";
               inputError = true;
            }
            else{lastNameError = '';}

            if(email.isEmpty){
              emailError = "Please enter an Email";
               inputError = true;
            }
            else{emailError = '';}

            if(password.isEmpty){
              passwordError = "Please enter a Password";
               inputError = true;
            }
            else{passwordError = '';}

             if(repeatPassword.isEmpty){
              repeatPasswordError = "Please repeat Password";
               inputError = true;
            }
            else{repeatPasswordError = '';}

            if(inputError == false){
              print('all input fields are valid!!');
             //User user1 = User(firstName, lastName, email, phone, password);
              AuthService().signup(
                email: email, password: password);
            }
            else{
              print('there is an error somewhere');
            }
        });
         },
          style: ElevatedButton.styleFrom( 
            shape: const StadiumBorder(),
            backgroundColor: Color(0xFFE76C78),),
          child: const Text('Create Account', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: .w500),)

        ),)
      ],))
      )
    );
  
  }
}
