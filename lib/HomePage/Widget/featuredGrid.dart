//
// import 'package:flutter/material.dart';
// import 'package:flutter/physics.dart';
// import '../constants/constantText.dart';
// import '../constants/constantsColor.dart';
// import '../constants/constantsImage.dart';
//
// class FeaturedSection extends StatelessWidget {
//   const FeaturedSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     final titleSize = size.width * 0.045;
//     final padding = size.width * 0.04;
//
//     final featuredKeys = FeaturedText.featuredItems.keys.toList();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: padding, bottom: padding * 0.5),
//           child: Text(
//             FeaturedText.featuredSectionTitle,
//             style: TextStyle(
//               fontSize: titleSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.symmetric(
//             horizontal: padding,
//             vertical: padding * 0.5,
//           ),
//           itemCount: featuredKeys.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 2.0,
//             mainAxisSpacing: padding * 0.75,
//             crossAxisSpacing: padding * 0.75,
//           ),
//           itemBuilder: (context, index) {
//             final key = featuredKeys[index];
//             return FeatureCard(
//               title: FeaturedText.getTitle(key),
//               subtitle: FeaturedText.getSubtitle(key),
//               imagePath: _getImagePath(key),
//               gradientColors: AppColors.gradients[key]!,
//
//               bordercolor: AppColors.primaryColors[key] ?? Colors.black,
//               onTap: () => Navigator.pushNamed(context, '/$key'),
//             );
//           },
//         ),
//
//       ],
//     );
//   }
//
//   String _getImagePath(String key) {
//     switch (key) {
//       case 'askExpert':
//         return AppImages.askExpert;
//       case 'internship':
//         return AppImages.internship;
//       case 'status':
//         return AppImages.status;
//       case 'freshers':
//         return AppImages.freshers;
//       case 'hiremi360':
//         return AppImages.hiremi360;
//       case 'experience':
//         return AppImages.experience;
//       default:
//         return '';
//     }
//   }
// }
//
//
//
//
//
// class FeatureCard extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final List<Color> gradientColors;
//   final VoidCallback onTap;
//   final Color bordercolor;
//
//   const FeatureCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//     required this.gradientColors,
//     required this.onTap,
//     required this.bordercolor,
//   });
//
//   @override
//   _FeatureCardState createState() => _FeatureCardState();
// }
//
// class _FeatureCardState extends State<FeatureCard> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _springAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Animation controller for the slide animation and spring animation
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     // Slide animation to move cards from left and right
//     final slideTween = Tween<Offset>(
//       begin: Offset(-1.0, 0),  // Left for the left card
//       end: Offset.zero,        // To original position
//     );
//     _slideAnimation = slideTween.animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//
//     // Spring animation for the spring-like effect
//     final springSimulation = SpringSimulation(
//       SpringDescription.withDampingRatio(
//         mass: 1.0,           // Mass of the spring
//         stiffness: 100.0,    // Stiffness of the spring
//         //damping: 1.0,        // Damping ratio (controls the bounce)
//       ),
//       0.0,                  // Initial position (rest position)
//       1.0,                  // End position (fully stretched)
//       0.0,                  // Initial velocity
//     );
//
//     // Use the spring simulation for animation
//     _springAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.5, 1.0, curve: Curves.elasticOut),
//       ),
//     );
//
//     // Start the animations after the widget is built
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     final titleSize = size.width * 0.032;
//     final subtitleSize = size.width * 0.025;
//     final imageHeight = size.width * 0.18;
//     final padding = size.width * 0.04;
//
//     return InkWell(
//       onTap: widget.onTap,
//       borderRadius: BorderRadius.circular(size.width * 0.03),
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return SlideTransition(
//             position: _slideAnimation,
//             child: Transform.scale(
//               scale: _springAnimation.value,  // Apply spring effect to scale
//               child: child,
//             ),
//           );
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: widget.bordercolor,
//             ),
//             gradient: LinearGradient(
//               colors: widget.gradientColors,
//               stops: const [0.4, 0.8, 0.9],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(size.width * 0.03),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       widget.title,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: titleSize,
//                         color: const Color(0xFF333333),
//                       ),
//                     ),
//                     SizedBox(height: size.width * 0.01),
//                     Text(
//                       widget.subtitle,
//                       style: TextStyle(
//                         fontSize: subtitleSize,
//                         color: Colors.grey[700],
//                         height: 1.2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Image.asset(
//                   widget.imagePath,
//                   scale: imageHeight,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:pre_dashboard/HomePage/Widget/popupmsg.dart';
import 'package:pre_dashboard/HomePage/screens/askExpertScreen.dart';
import '../constants/constantText.dart';
import '../constants/constantsColor.dart';
import '../constants/constantsImage.dart';

class FeaturedSection extends StatelessWidget {
  // const FeaturedSection({super.key});
  final bool isVerified;

  const FeaturedSection({Key? key, required this.isVerified}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final titleSize = size.width * 0.045;
    final padding = size.width * 0.04;

    final featuredKeys = FeaturedText.featuredItems.keys.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: padding, bottom: padding * 0.5),
          child: Text(
            FeaturedText.featuredSectionTitle,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: padding * 0.5,
          ),
          itemCount: featuredKeys.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.0,
            mainAxisSpacing: padding * 0.75,
            crossAxisSpacing: padding * 0.75,
          ),
          itemBuilder: (context, index) {
            final key = featuredKeys[index];
            return FeatureCard(
              title: FeaturedText.getTitle(key),
              subtitle: FeaturedText.getSubtitle(key),
              imagePath: _getImagePath(key),
              gradientColors: AppColors.gradients[key]!,
              bordercolor: AppColors.primaryColors[key] ?? Colors.black,
              onTap: () {
                // if (key == 'askExpert') {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => AskExpertPage()),
                //   );
                //   print('ask expert');
                // }
                // else
                //   {
                //     showCustomPopup(context);
                //
                //   }
                if (isVerified) {
                  switch (key) {
                    case 'askExpert':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to AskExpertPage');
                      break;
                    case 'internship':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to InternshipPage');
                      break;
                    case 'status':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to StatusPage');
                      break;
                    case 'freshers':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to FreshersPage');
                      break;
                    case 'hiremi360':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to HireMi360Page');
                      break;
                    case 'experience':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskExpertPage()),
                      );
                      print('Navigating to ExperiencePage');
                      break;
                    default:
                      print('Unknown key: $key');
                      break;
                  }
                  print("Value of isVerified $isVerified");
                } else {
                  showCustomPopup(context);
                  print("Value of isVerified $isVerified");
                }
              },
              index: index, // Pass the index to FeatureCard
            );
          },
        ),
      ],
    );
  }

  String _getImagePath(String key) {
    switch (key) {
      case 'askExpert':
        return AppImages.askExpert;
      case 'internship':
        return AppImages.internship;
      case 'status':
        return AppImages.status;
      case 'freshers':
        return AppImages.freshers;
      case 'hiremi360':
        return AppImages.hiremi360;
      case 'experience':
        return AppImages.experience;
      default:
        return '';
    }
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final Color bordercolor;
  final int index; // Add index parameter

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.gradientColors,
    required this.onTap,
    required this.bordercolor,
    required this.index, // Add index to the constructor
  });

  @override
  _FeatureCardState createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _springAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for the slide animation and spring animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Duration for the animation
    );

    // Set the slide direction based on the index
    final slideTween = Tween<Offset>(
      begin: widget.index.isEven
          ? Offset(-1.0, 0)
          : Offset(1.0, 0), // Use left for even, right for odd
      end: Offset.zero, // To original position
    );
    _slideAnimation = slideTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Spring animation for the spring-like effect with a more dramatic bounce
    final springSimulation = SpringSimulation(
      SpringDescription(
        mass: 2.0, // Increased mass for slower bounce
        stiffness: 200.0, // Higher stiffness for a more pronounced bounce
        damping: 2.0, // Increased damping to simulate a bounce back
      ),
      0.0, // Initial position (rest position)
      1.0, // End position (fully stretched)
      0.0, // Initial velocity
    );

    // Use the spring simulation for animation
    _springAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Introduce delay for the animation sequence based on the row index
    Future.delayed(Duration(milliseconds: widget.index * 300), () {
      _controller.forward(); // Trigger animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final titleSize = size.width * 0.032;
    final subtitleSize = size.width * 0.024;
    final imageHeight = size.width * 0.18;
    final padding = size.width * 0.04;

    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(size.width * 0.03),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: Transform.scale(
              scale: _springAnimation.value, // Apply spring effect to scale
              child: child,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: padding, vertical: padding * 0.75),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.bordercolor,
            ),
            gradient: LinearGradient(
              colors: widget.gradientColors,
              stops: const [0.4, 0.8, 0.9],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(size.width * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: titleSize,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: size.width * 0.01),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: subtitleSize,
                        color: Colors.grey[700],
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  widget.imagePath,
                  scale: imageHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
