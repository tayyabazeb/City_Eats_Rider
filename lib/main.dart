import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/app/app.bottomsheets.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/constants/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///disable landscape mood
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

AudioPlayer player = AudioPlayer();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final log = getLogger('main');
  await Firebase.initializeApp();

  const alarmAudioPath = "mp3/custom_sound.mp3";
  player.play(AssetSource(alarmAudioPath));
  log.i('Handling a background message: ${message.messageId}');
  log.i('Notification Message is: ${message.toMap()}');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        initialRoute: Routes.startupView,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        theme: AppThemes().lightTheme,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
        builder: (context, child) {
          // FlutterError.onError;
          // return Container();
          return child ?? Container();
        },
      ),
    );
  }
}
