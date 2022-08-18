import 'package:flutter/material.dart';
import 'package:flutter_project/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google_SignIn'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.Email,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.only(top: 10),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.Password,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      contentPadding: EdgeInsets.only(top: 10)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.createtoken();
                      },
                      child: const Text("Check Token"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: controller.signUp,
                      child: const Text("Signup"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: controller.signIn,
                      child: const Text("SignIn"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login With google"),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () => controller.signInWithGoogle(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 3,
                        onPrimary: Colors.white,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Image(
                        image: AssetImage("Images/google .png"),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => controller.clickFbButton(),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(Icons.facebook_sharp),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: controller.phoneNumberController,
                          decoration: const InputDecoration(
                              labelText: 'Phone number (+xx xxx-xxx-xxxx)'),
                        ),
/*
                         Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            alignment: Alignment.center,
                            child: RaisedButton(child: Text("Get current number"),
                                onPressed: () => {
                                  controller.phoneNumberController.text
                                },
                                color: Colors.greenAccent[700]),
                          ),
*/
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          alignment: Alignment.center,
                          child: RaisedButton(
                            color: Colors.greenAccent[400],
                            child: const Text("Get OTP"),
                            onPressed: () async {
                              controller.verifyPhoneNumber();
                            },
                          ),
                        ),
                        TextFormField(
                          controller: controller.smsController,
                          decoration: const InputDecoration(
                              labelText: 'Verification OTP'),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.center,
                          child: RaisedButton(
                              color: Colors.greenAccent[200],
                              onPressed: () async {
                                controller.signInWithPhoneNumber();
                              },
                              child: const Text("Sign in")),
                        ),
                        Shimmer(
                          color: Colors.grey[300]!,
                          // This is the default value
                          colorOpacity: 1,
                          // This is the default value
                          enabled: true,

                          // This is the default value
                          direction: const ShimmerDirection.fromLTRB(),
                          // This is the ONLY required parameter
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.MAP_VIEW);
                            },
                            child: const Text(
                              "Go to next page",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              controller.onPresseds();
                              Get.toNamed(Routes.IMAGEUPLOAD);
                            },
                            child: controller.isLoading.value
                                ? const Text('Submit')
                                : StreamBuilder<Object>(
                                    stream: null,
                                    builder: (context, snapshot) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ],
                                      );
                                    }),),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
