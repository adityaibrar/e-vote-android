import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/services/login_user.dart';
import 'package:android_vote/views/screen/home.dart';
import 'package:android_vote/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static String route = '/login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // void getData() async {
    //   var url = Uri.parse('http://10.0.2.2/api/data.php');

    //   var response = await http.post(url);

    //   if (response.statusCode == 200) {
    //     var data = jsonDecode(response.body);
    //     print(data['result']);
    //   }

    //   // if (data['result']['username']) {
    //   //   Navigator.push(context, Splashscreen());
    //   //   return;
    //   // }
    //   // print(data);
    // }

    Future Login() async {
      // try {
      var user = usernameController.text, pass = passwordController.text;
      var uri = Uri.parse(AppUrl.user);
      var response = await http.post(uri, headers: {
        "Accept": "application/json"
      }, body: {
        'username': user,
        'password': pass,
      });
      var data = json.encode(json.decode(response.body));
      // print(data);
      if (data.contains('Succes')) {
        AlertDialog alert = AlertDialog(
          title: Text("Berhasil Login"),
          content: Container(
            child: Text("Selamat datang"),
          ),
          actions: [
            TextButton(
              child: Text(
                "OK",
                style: subtittleTextStyle.copyWith(color: primaryColor),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoard()),
              ),
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
        return;
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Gagal Login"),
          content: Container(
            child: Text(
                "Silahkan cek kembali username dan password yang anda masukkan"),
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
        return;
      }
      // } catch (e) {
      //   print("Error" + e.toString());
      // }
    }

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
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Username",
              labelText: "Masukkan Username",
              labelStyle: new TextStyle(
                color: primaryColor,
              )),
        ),
      );
    }

    Widget passwordInput() {
      return FieldInput(
        textFormField: TextFormField(
          cursorColor: primaryColor,
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.remove_red_eye_sharp,
                color: primaryColor,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: primaryColor,
              )),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Password",
              labelText: "Masukkan Password",
              labelStyle: new TextStyle(
                color: primaryColor,
              )),
        ),
      );
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/vector.png",
                  height: 300,
                  fit: BoxFit.fill,
                ),
                Text(
                  "Welcome",
                  style: tittleTextStyle.copyWith(
                      fontSize: 35, color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Sebelum kita memilih kandidat ketua Organisasi sebaiknya kita harus Log In dahulu supaya sistem pemilihan ketua tidak ada kecurangan",
                  style: subtittleTextStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
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
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  //bagian frame
                                  Container(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius: BorderRadius.only(
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
                                              SizedBox(
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
                                                                color:
                                                                    primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                  "Masukkan username dan password anda..."),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              userInput(),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              passwordInput(),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    2 * defaultMargin,
                                                child: ElevatedButton(
                                                  onPressed: Login,
                                                  child: Text(
                                                    "LOGIN",
                                                    style: tittleTextStyle
                                                        .copyWith(
                                                            fontSize: 20,
                                                            color:
                                                                secondaryColor),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
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
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
