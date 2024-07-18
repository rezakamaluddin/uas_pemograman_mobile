import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nftdua/presentation/pages/discover_page.dart';
// ignore: unused_import
import 'package:nftdua/presentation/pages/sign_up_page.dart';
import 'package:nftdua/presentation/widgets/button_widget.dart';
import 'package:nftdua/presentation/widgets/input_widget.dart';
import 'package:nftdua/presentation/widgets/page_widget.dart';
import 'package:http/http.dart';
import 'dart:convert';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _body(),

              // Sign in
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
                },
                child: Text(
                  'Create new account',
                  style: GoogleFonts.inter(
                      color: const Color(0xFF909FB4), fontSize: 16),
                ),
              )
            ]),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(children: [
        // Title
        const Gap(60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Start Collecting Amazing Artworks',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: const Color(0xFF0D1220),
                fontSize: 26,
                fontWeight: FontWeight.w600,
                height: 36 / 26),
          ),
        ),
        const Gap(40),

        // Form
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(children: [
            const InputWidget(
              lable: 'Email',
            ),
            const InputWidget(
              lable: 'Password',
              isPassword: true,
            ),

            // Action
            const Gap(10),
            Builder(builder: (context) {
              return ButtonWidget(
                text: 'Sign In',
                isFullWidth: true,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const DiscoverPage(),
                  ));
                },
              );
            })
          ]),
        )
      ]),
    );
  }
}


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {
    
    try{
      
Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email' : 'eve.holt@reqres.in',
          'password' : 'cityslicka'
        }
      );

      if(response.statusCode == 200){
        
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password'
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

