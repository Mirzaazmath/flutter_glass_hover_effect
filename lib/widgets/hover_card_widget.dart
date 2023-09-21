import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/text_utlis.dart';
class HoverCardWidget extends StatefulWidget {
  final String image;
  final String title;
  final String slogan;
  final String description;

  const HoverCardWidget({super.key,required this.image,required this.title,required this.slogan,required this.description});

  @override
  State<HoverCardWidget> createState() => _HoverCardWidgetState();
}

class _HoverCardWidgetState extends State<HoverCardWidget> with SingleTickerProviderStateMixin {
  /// CREATING THE ANIMATION CONTROLLER TO CONTROLLER ANIMATION
  late final AnimationController _controller=AnimationController(vsync: this,duration: const  Duration(milliseconds: 300));
  /// CREATING THE ANIMATION WHICH WE WANT
  /// HERE WE ARE CREATING THE OFFSET ANIMATION
  /// AND WE ARE USING TWEEN TO DEFINE WE TO BEGIN AND END THE ANIMATION
  late final Animation<Offset> _animation = Tween<Offset>(

    begin: const Offset(1.1, 0),
    end: Offset.zero,
  ).animate(
    /// DEFINING THE CURVE
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );
  @override
  Widget build(BuildContext context) {
    /// USING THE MOUSE REGION TO KNOW THE HOVER OF THE MOUSE
    return  MouseRegion(
      /// AS SOON AS THE CURSUR ENTER THE REGION WE ARE STARTING THE ANIMATION
      /// _controller.forward(),
      /// AND VISE VERSA
      onEnter: (event) => _controller.forward(),
      onExit: (event) => _controller.reverse(),
      /// ClipRRect AND  clipBehavior: Clip.hardEdge, TO HIDE THE ON HOVER PART  WHICH ARE DISPLAYING BY DEFAULT
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 320,
          width: 220,

          /// USING THE STACK
          child: Stack(
            children: [
              /// IMAGE CONTAINER
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    image: DecorationImage(
                        image: AssetImage(widget.image),fit: BoxFit.cover
                    )
                ),
              ),
              /// ON HOVER WIDGET WITH BLUR AND DETAILS
              /// USING SlideTransition WIDGET TO ANIMATE THE SLIDE EFFECT ON HOVER
              SlideTransition(
                /// HERE WE ARE ASSIGNING THE POSITION VIA OFFSET USING ANIMATED OFFSET
                position: _animation,
                /// ClipRRect AND  clipBehavior: Clip.hardEdge, TO HIDE THE ON HOVER PART  WHICH ARE DISPLAYING BY DEFAULT
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  /// BackdropFilter USING THE WIDGET FOR ADDING THE BACKGROUND BLUR EFFECT
                  child: BackdropFilter(
                    ///ImageFilter.blur(sigmaX: 6,sigmaY: 6), HERE WE ARE DEFINING THE BLUR , HOW MUCH BLUR WE WANT
                    filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// SPACER
                          const Spacer(),
                          /// TITLE
                          TextUtil(text: widget.title,weight: true,),
                          const   SizedBox(height: 10,),
                          /// SLOGAN
                          TextUtil(text: widget.slogan,size:14, weight: true,),
                          const   SizedBox(height: 10,),
                          /// DESCRIPTION
                          TextUtil(text: widget.description,size: 12,  weight: true,),
                          /// TITLE
                          const Spacer(),
                          /// CUSTOM BUTTON
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              height: 35,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(colors: [
                                   Colors.red,
                                    Colors.orange,
                                  ])),
                              alignment: Alignment.center,
                              child:   TextUtil(text: "Discover More",size: 12,weight: true,),),
                          ),
                          const Spacer(),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
             /// THIS WIDGET IS ONLY FOR BORDER
              /// YOU CAN USE IT OR NOT ITS UPTO YOU
              /// IgnorePointer THIS WIDGET IS USED TO IGNORE ANY HOVER OR TAP ETC
              /// WE ARE USING THE IgnorePointer BECAUSE IT IS THE TOP LAYER OF THE STACK AND ALL THE STUFF IS
              /// HAPPENING IN THE MIDDLE LAYER THATS WHY
             IgnorePointer(
               child:  Container(
                 height: 320,
                 width: 220,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(color: Colors.white,width: 4)
                 ),

               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
