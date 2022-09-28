import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class StyledToasts extends StatefulWidget {
  const StyledToasts({Key? key}) : super(key: key);

  @override
  State<StyledToasts> createState() => _StyledToastsState();
}

class _StyledToastsState extends State<StyledToasts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Motion Toast Examples',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        toastAnimation();
                      },
                      child: const Text('Custom Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayWarningMotionToast();
                      },
                      child: const Text('Custom Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayErrorMotionToast();
                      },
                      child: const Text('Error Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayInfoMotionToast();
                      },
                      child: const Text('Info Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayDeleteMotionToast();
                      },
                      child: const Text('Delete Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayResponsiveMotionToast();
                      },
                      child: const Text('Responsive Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayCustomMotionToast();
                      },
                      child: const Text('Custom Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayCenterMotionToast();
                      },
                      child: const Text('Center Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayTopMotionToast();
                      },
                      child: const Text('Top Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayTwoColorsMotionToast();
                      },
                      child: const Text('Two-color Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displayTransparentMotionToast();
                      },
                      child: const Text('Transparent Motion Toast'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _displaySimultaneouslyToasts();
                      },
                      child: const Text('Simultaneously taosts'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toastAnimation() {
    MotionToast(
      icon: Icons.check_circle_outline,
      iconSize: 0.0,
      primaryColor: Colors.transparent,
      secondaryColor: Colors.transparent,
      animationCurve: Curves.bounceOut,
      backgroundType: BackgroundType.transparent,
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      animationDuration: const Duration(milliseconds: 1000),
      borderRadius: 4.0,
      padding: const EdgeInsets.only(top : 8.0, left: 8.0, right: 8.0),
      height: MediaQuery.of(context).size.height * 0.095,
      width: MediaQuery.of(context).size.width - 40,
      title: Row(
        children: [
          const SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Lorum Ipsum',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Example of Info Toast Lorum Ipsum',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
      description: const SizedBox(),
    ).show(context);
  }

  void _displayWarningMotionToast() {
    MotionToast(
      icon: Icons.check_circle_outline,
      primaryColor: Colors.transparent,
      secondaryColor: Colors.transparent,
      animationCurve: Curves.bounceOut,
      backgroundType: BackgroundType.transparent,
      borderRadius: 4.0,
      padding: const EdgeInsets.only( top : 8.0, left: 8.0, right: 8.0),
      height: MediaQuery.of(context).size.height * 0.095,
      iconSize: 0,
      width: MediaQuery.of(context).size.width - 40,
      title: Row(
        children: [
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Lorum Ipsum',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Example of Info Toast Lorum Ipsum',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
      description: const SizedBox(),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      position: MotionToastPosition.top,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
  }

  void _displayErrorMotionToast() {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Please enter your name'),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }

  void _displayInfoMotionToast() {
    MotionToast.info(
      title: const Text(
        'Info Motion Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      position: MotionToastPosition.center,
      description: const Text('Example of Info Toast'),
    ).show(context);
  }

  void _displayDeleteMotionToast() {
    MotionToast.delete(
      title: const Text(
        'Deleted',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('The item is deleted'),
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
    ).show(context);
  }

  void _displayResponsiveMotionToast() {
    MotionToast(
      icon: Icons.rocket_launch,
      primaryColor: Colors.purple,
      title: const Text(
        'Custom Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text(
        'Hello my name is Flutter dev',
      ),
    ).show(context);
  }

  void _displayCustomMotionToast() {
    MotionToast(
      icon: Icons.alarm,
      primaryColor: Colors.pink,
      title: const Text(
        'New bugatti',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Image.network(
        'https://media.wired.com/photos/5d56e7a245517600087f90a3/master/pass/Transpo_bugatti_02_CD_3I4-FRONT.jpg',
        width: 100,
        height: 100,
      ),
    ).show(context);
  }

  void _displayCenterMotionToast() {
    MotionToast(
      icon: Icons.alarm,
      primaryColor: Colors.deepOrange,
      title: const Text(
        'Center Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      width: 350,
      height: 150,
      description: const Text(
        'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In vitae turpis massa sed elementum tempus egestas sed sed.',
      ),
      //description: "Center displayed motion toast",
      position: MotionToastPosition.center,
    ).show(context);
  }

  void _displayTopMotionToast() {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.deepOrange,
      title: const Text('Top Motion Toast'),
      description: const Text('Another motion toast example'),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      width: 350,
      height: 100,
      padding: const EdgeInsets.only(
        top: 30,
      ),
    ).show(context);
  }

  void _displayTwoColorsMotionToast() {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.orange[500]!,
      secondaryColor: Colors.grey,
      backgroundType: BackgroundType.solid,
      title: const Text(
        'Two Color Motion Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Another motion toast example'),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      width: 350,
      height: 100,
    ).show(context);
  }

  void _displayTransparentMotionToast() {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.grey[400]!,
      secondaryColor: Colors.yellow,
      backgroundType: BackgroundType.transparent,
      title: const Text(
        'Two Color Motion Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Another motion toast example'),
      position: MotionToastPosition.center,
      width: 350,
      height: 100,
    ).show(context);
  }

  void _displaySimultaneouslyToasts() {
    MotionToast.warning(
      title: const Text(
        'Warning Motion Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('This is a Warning'),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Please enter your name'),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
      width: 300,
      height: 80,
    ).show(context);
  }
}