import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/services/login.dart';
import 'package:android_vote/views/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String route = '/login';

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Getexten auth = Getexten();
  var isObsecure = true;
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget userInput() {
      return FieldInput(
        textFormField: TextFormField(
          controller: usernameController,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Username",
            labelText: "Masukkan Username",
            labelStyle: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    Widget passwordInput() {
      return FieldInput(
        textFormField: TextFormField(
          cursorColor: primaryColor,
          controller: passwordController,
          obscureText: isObsecure,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              // color: primaryColor,
              child: Icon(
                isObsecure ? Icons.visibility : Icons.visibility_off,
                size: 20,
                color: primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: primaryColor,
            )),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Password",
            labelText: "Masukkan Password",
            labelStyle: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            const SizedBox(
              height: 45,
            ),
            Image.asset(
              "assets/images/vector.png",
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style:
                  tittleTextStyle.copyWith(fontSize: 35, color: secondaryColor),
              textAlign: TextAlign.center,
            ),
            Text(
              "Sebelum anda memilih calon ketua osis setidaknya anda telah berpikir siapa yang layak untuk menjadi ketua di periode berikutnya.",
              style: subtittleTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 51,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  //untuk menampilkan modal form login
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              //bagian frame
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40))),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //untuk isi yang ada didalam frame
                                        children: [
                                          //jarak
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Welcome...",
                                                    style: tittleTextStyle
                                                        .copyWith(
                                                            fontSize: 20,
                                                            color: primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Text(
                                              "Masukkan username dan password anda..."),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          userInput(),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          passwordInput(),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin,
                                            child: ElevatedButton(
                                              // onPressed: Login,
                                              onPressed: () {
                                                auth.logIn(
                                                    usernameController.text,
                                                    passwordController.text);
                                              },
                                              child: Text(
                                                "LOGIN",
                                                style: tittleTextStyle.copyWith(
                                                    fontSize: 20,
                                                    color: secondaryColor),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(
                  "CONTINUE",
                  style: tittleTextStyle.copyWith(
                      fontSize: 25, color: secondaryColor),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
