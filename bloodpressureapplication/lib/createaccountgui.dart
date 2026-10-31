import 'package:flutter/material.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPasswordController = TextEditingController();
     String firstName = ' ';
     String lastName = ' ';
     String email = ' ';
     String password = ' ';
     String repeatPassword = '';

     void saveInput(){
        firstName = firstNameController.text;
        lastName = lastNameController.text;
        email = emailController.text;
        password = passwordController.text;
        repeatPassword = repeatPasswordController.text;
     }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 249, 242),
      appBar: AppBar(title: const Text ('Create an Account', style: TextStyle(fontSize: 22.0,),), backgroundColor: const Color.fromARGB(255, 163, 47, 61) ,),
      body:SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(children: [

        TextField(controller: firstNameController,
          decoration: InputDecoration(labelText: 'First Name',
          floatingLabelStyle: TextStyle(
          color:  Color.fromARGB(255, 163, 47, 61) ,), 
          border: OutlineInputBorder(), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color.fromARGB(255, 163, 47, 61), width: 1.5), ),),),

        const SizedBox(height: 20.0), //space in between
        TextField(controller: lastNameController,
          decoration: InputDecoration(labelText: 'Last Name',
          floatingLabelStyle: TextStyle(
          color:  Color.fromARGB(255, 163, 47, 61) ,), 
          border: OutlineInputBorder(), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color.fromARGB(255, 163, 47, 61), width: 1.5), ),),),

        const SizedBox(height: 20.0), //space in between
        TextField(controller: emailController,
          decoration: InputDecoration(labelText: 'Email', 
          floatingLabelStyle: TextStyle(
          color:  Color.fromARGB(255, 163, 47, 61) ,), 
          border: OutlineInputBorder(), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color.fromARGB(255, 163, 47, 61), width: 1.5), ),),),
      
        const SizedBox(height: 20.0), //space in between
        TextField(controller: passwordController,
          obscureText: true, decoration: InputDecoration(labelText: 'Password', 
          floatingLabelStyle: TextStyle(
          color:  Color.fromARGB(255, 163, 47, 61) ,), 
          border: OutlineInputBorder(), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color.fromARGB(255, 163, 47, 61), width: 1.5), ),),),
      
        const SizedBox(height: 20.0), //space in between
        TextField(controller: repeatPasswordController,
          obscureText: true, decoration: InputDecoration(labelText: 'Repeat Password',
          floatingLabelStyle: TextStyle(
          color:  Color.fromARGB(255, 163, 47, 61) ,), 
          border: OutlineInputBorder(), 
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:  Color.fromARGB(255, 163, 47, 61), width: 1.5), ),),),
        const SizedBox(height:24),
        SizedBox( width: double.infinity, height: 50,
         child: ElevatedButton(onPressed:(){
            bool inputError = false; 
            saveInput();

            if(firstName.isEmpty || lastName.isEmpty  || email.isEmpty || password.isEmpty || repeatPassword.isEmpty){
            inputError = true;
            }
            for(int i = 0; i < firstName.length; i++ ){
              if(firstName[i]  == ' '){
                inputError = true;
                break;
              }
            }
            for(int i = 0; i < lastName.length; i++ ){
              if(lastName[i]  == ' '){
                inputError = true;
                break;
              }
            }
            for(int i = 0; i < email.length; i++ ){
              if(email[i]  == ' '){
                inputError = true;
                break;
              }
            }
            for(int i = 0; i < password.length; i++ ){
              if(password[i]  == ' '){
                inputError = true;
                break;
              }
            }
            for(int i = 0; i < repeatPassword.length; i++ ){
              if(repeatPassword[i]  == ' '){
                inputError = true;
                break;
              }
            }
            if(password != repeatPassword){
              inputError = true;
            }
            if(inputError == false){
              print('all input fields are valid!!');
            }
            else{
              print('there is an error somewhere');
            }

         },
          style: ElevatedButton.styleFrom( 
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 116, 12, 12),),
          child: const Text('Create Account', style: TextStyle(fontSize: 18, color: Colors.white),)

        ),)
      
      ],))
      )
    );
  
  }
}

