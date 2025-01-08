import 'package:flutter/material.dart';
import 'registration_step1.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.36), // Black color with 0.36 opacity
              BlendMode.darken, // Blend mode to apply the color filter
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if it's a web layout
            bool isWeb = constraints.maxWidth > 600;

            return Center(
              child: Container(

                width: isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth,
                decoration: BoxDecoration(
                  color: isWeb?Colors.white:Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize:isWeb? MainAxisSize.min:MainAxisSize.max,
                  children: [
                    isWeb?SizedBox(height: 10,):const Spacer(),
                    if(isWeb )Center(
                      child:  Image.asset(
                        "assets/logo.png",
                        width:110,
                        height: 116,
                      ),
                    ),
                    isWeb ? SizedBox(height: 20,):const Spacer(),
                    Text(
                      "RSS \nVisitor Management System",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isWeb ? 32 : 28,
                        color:isWeb? Colors.black: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    !isWeb? const Spacer():const SizedBox(height: 20),
                    Text(
                      "Streamline your visitor experience with ease and security.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: isWeb ? 26 : 24,
                        color:isWeb? Colors.black: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    isWeb?const SizedBox(height: 30,):const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(237, 27, 36, 1),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Border radius
                          side: const BorderSide(
                            color: Colors.white, // Border color
                            width: 2, // Border width
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationStep1()),
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    isWeb?const SizedBox(height: 20,):const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
Route _createSlideRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const RegistrationStep1(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start offscreen (right side)
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 500),
  );
}
