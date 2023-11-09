import 'package:elkopra/constant/r.dart';
import 'package:elkopra/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isEnabled = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 79,
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  color: R.colors.text_bold,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Please use the account you have to login at elKopra apps',
              style: TextStyle(
                  fontSize: 14,
                  color: R.colors.text_thin,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 14,
                  color: R.colors.text_normal,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: R.colors.text_thin),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: 14,
                  color: R.colors.text_normal,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: isEnabled == false
                            ? Colors.transparent
                            : R.colors.primary,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: isEnabled == false
                                ? R.colors.grey
                                : R.colors.primary)),
                    child: isEnabled == false
                        ? const SizedBox()
                        : const Icon(
                            Icons.check_rounded,
                            size: 12,
                            color: Colors.white,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Remind me',
                  style: TextStyle(
                      fontSize: 14,
                      color: R.colors.text_normal,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                TextButton(
                  onPressed: (() {}),
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        fontSize: 14,
                        color: R.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: R.colors.primary,
                ),
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register new account ?  ',
                    style: TextStyle(
                        fontSize: 14,
                        color: R.colors.text_normal,
                        fontWeight: FontWeight.w400)),
                TextButton(
                  onPressed: (() {}),
                  child: Text(
                    'Click Here',
                    style: TextStyle(
                        fontSize: 14,
                        color: R.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
