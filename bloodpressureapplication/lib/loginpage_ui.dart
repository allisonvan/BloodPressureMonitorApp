import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloodpressureapplication/createaccountgui.dart';
import 'package:bloodpressureapplication/postloginpage.dart';


String EmailIcon = 'assets/images/email_icon.png';
String PasswordIcon = 'assets/images/password_icon.png';
String PlaceholderIcon = 'assets/images/placeholder_icon.png';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({super.key});

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email"),
        ),
      );
      return;
    }
   try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password reset email sent"),
      ),
    );
   } on FirebaseAuthException catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.code == 'invalid-email'
            ? 'Please enter a valid email'
            : 'Error sending password reset email. Please try again',
            ),
      ),
    );
   }
  }

  Future<void> _onContinue() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PostLoginPage()),
      );
    }
      on FirebaseAuthException catch (e) {
        if (!mounted) return;
        String errorMessage;
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'Please enter a valid email';
            break;
          case 'user-not-found':
            errorMessage = 'No user found with this email';
            break;
          case 'wrong-password':
            errorMessage = 'Incorrect password';
            break;
          default:
            errorMessage = 'Error signing in. Please try again';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
        finally {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        }
      }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height:double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF6B8BF),
              Color(0xFFE76C78),
              Color(0xFFB82943),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
           padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
           child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Placeholder Header.png",
                  height: size.height * 0.17,
                  fit: BoxFit.contain,
                  ),

                SizedBox(height: size.height * 0.008),
                const Text (
                  "Welcome Back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.004),
                const Text(
                  "Please, Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.025),

                //Email Field
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    if (!value.contains('@')) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/Email_Icon.jpg", width: 20),
                    ),
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color:Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.025),

                //Password Field
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/Password_Icon.jpg", width: 20),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState (
                        () => _obscurePassword = !_obscurePassword,
                      ),
                    ),
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: resetPassword,
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                //Continue Button
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _isLoading
                      ? null
                      : _onContinue,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.080,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED6675),
                      borderRadius: BorderRadius.circular(37),
                    ),

                    child: _isLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),

                SizedBox(height: size.height * 0.04),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(height: 1, color: Colors.white),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    const Expanded(
                      child: Divider(height: 1, color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.04),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const createAccount(),
                      ),
                    );
                  },
                      child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.080,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED6675),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
           ),
          ),
        ),
      ),
      ),
    );
  }
}
