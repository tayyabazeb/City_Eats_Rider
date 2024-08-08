// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationService {
  // final _localStorageService = locator<LocalStorageService>();
  final _dialogService = locator<DialogService>();
  final log = getLogger('NotificationService');
  final _fcm = FirebaseMessaging.instance;
  static AudioPlayer player = AudioPlayer();

  String? fcmToken;

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String type = '';
  // int orderId = 0;
  late OrderModel order;
  // int? chatUserId;

  final BehaviorSubject<ReceivedNotification>
      didReceivedLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  ///init local notification
  _initFlutterLocalNotificationPlugin() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'default',
        'High Importance Notifications',
        importance: Importance.high,
        description: "This is ewanc channel",
        playSound: true,
        enableLights: true,
      );
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      ///init android settings
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings("@mipmap/ic_launcher");

      ///init ios settings
      final DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            _onDidReceiveLocalNotification(
          id,
          title ?? "",
          body ?? "",
          payload ?? "",
        ),
      );

      ///init settings
      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      ///init local notification plugin
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) async =>
            _onNotificationClick(payload),
      );

      ///create channel
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      ///set options
      await _fcm.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
    }
  }

  ///
  ///Initializing Notification services that includes FLN, ANDROID NOTIFICATION CHANNEL setting
  ///FCM NOTIFICATION SETTINGS, and also listeners for OnMessage and for onMessageOpenedApp
  ///
  initConfigure() async {
    log.d("@initFCMConfigure/started");
    await _initFlutterLocalNotificationPlugin();
    askPermission();

    ///now finally get the token from
    await _fcm.getToken().then((token) {
      log.wtf("FCM TOKEN IS ===>$token");
      fcmToken = token;
    });

    ///
    /// When the app is in terminated state and user clicks on notification
    ///
    _fcm.getInitialMessage().then((message) {
      if (message != null) {
        log.wtf('I am invoked from terminated state');
        // log.wtf('Notification Message is: ${message.toMap()}');
        // orderId = int.parse(message.data['order_id'].toString());
        getLogger("Notification")
            .wtf(jsonDecode(message.data['order'])['address']);
        type = message.data['type'];
        order = OrderModel.fromJson(jsonDecode(message.data['order']));
        order.isManual = type == "manual";

        // _goToOrderScreen();
        showDialog();
      }
    });

    ///
    /// When app is in foreground state and user receives notification
    ///
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log.wtf('@onMessage');
      // RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      if (!kIsWeb) {
        /// if user is not in the chat screen
        getLogger("Notification").wtf(message.data['type']); //manual
        getLogger("Notification")
            .wtf(jsonDecode(message.data['order'])['address']);
        // getLogger("Notification").wtf(
        //     OrderModel.fromJson(jsonDecode(message.data['order'])).toJson());
        type = message.data['type'];
        order = OrderModel.fromJson(jsonDecode(message.data['order']));
        order.isManual = type == "manual";

        // handleNotification(message);
        if (!isDialogOpen) {
          const alarmAudioPath = "mp3/custom_sound.mp3";
          player.play(AssetSource(alarmAudioPath));
          // player.stop();
          showDialog();
        }
      }
    });

    ///
    /// When app is in background(opened) and user clicks on notification
    ///
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log.wtf('I am invoked from background state');
      type = message.data['type'];
      order = OrderModel.fromJson(jsonDecode(message.data['order']));
      order.isManual = type == "manual";
      showDialog();
    });
  }

  bool isDialogOpen = false;

  showDialog() async {
    isDialogOpen = true;

    ///IF manual THEN can't reject
    await _dialogService.showCustomDialog(
      variant: DialogType.incomnigrequest,
      title: 'Error',
      description: "",
      data: order,
    );
    isDialogOpen = false;
  }

  /// get fcm token
  Future<String?> getFcmToken() async {
    return await _fcm.getToken();
  }

  askPermission() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    log.d('User granted permission: ${settings.authorizationStatus}');
  }

  // handleNotification(RemoteMessage message) {
  //   log.wtf('@handleNotification');
  //   // if (message.notification != null) {
  //   //   orderId = int.parse(message.data['order_id'].toString());
  //   // _showLocalNotification(message.notification!);
  //   showDialog();
  //   // }
  // }

  // _goToOrderScreen() {
  //   // locator<NavigationService>().navigateToMyOrdersView();
  //   // locator<NavigationService>().navigateToOrderDetailView(orderId: orderId);
  // }

  // /// show local notification (Heads up notification)
  // void _showLocalNotification(RemoteNotification notification) {
  //   log.wtf("@_showLocalNotification");
  //   flutterLocalNotificationsPlugin.show(
  //     notification.hashCode,
  //     notification.title,
  //     notification.body,
  //     NotificationDetails(
  //       iOS: DarwinNotificationDetails(subtitle: channel.description),
  //       android: AndroidNotificationDetails(
  //         channel.id,
  //         channel.name,
  //         onlyAlertOnce: true,
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         channelDescription: channel.description,
  //         icon: "@mipmap/ic_launcher",
  //         styleInformation: BigTextStyleInformation(
  //           // message.data['body'],
  //           notification.body ?? 'Body Text',
  //           // contentTitle: message.data['title'],
  //           contentTitle: notification.title ?? 'Title Text',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    ReceivedNotification receivedNotification = ReceivedNotification(
        id: id, title: title, body: body, payload: payload);
    didReceivedLocalNotificationSubject.add(receivedNotification);
  }

  /// Executes when user clicks on notification in foreground state
  void _onNotificationClick(NotificationResponse payload) {
    log.wtf('Tapped on notification in foreground state');
    // _goToOrderScreen();
    showDialog();
    // _decrementNotificationCounter();
  }

  // ///increment counter
  // void _incrementNotificationCount() {
  //   log.d("@ incrementNotificationCount ");
  //   //shared preferences count increment
  //   _localStorageService.setNotificationsCount =
  //       _localStorageService.notificationsCount + 1;
  //   //notify in provider
  //   notificationCounterValueNotifier.value++;
  //   // ignore: invalid_use_of_protected_member
  //   notificationCounterValueNotifier.notifyListeners();
  // }

  // ///decrement counter
  // void _decrementNotificationCounter() {
  //   log.d("@ incrementNotificationCount ");
  //   //shared preferences count increment
  //   _localStorageService.setNotificationsCount =
  //       _localStorageService.notificationsCount - 1;
  //   //notify in provider
  //   notificationCounterValueNotifier.value--;
  //   // ignore: invalid_use_of_protected_member
  //   notificationCounterValueNotifier.notifyListeners();
  // }
}

//define a global variable for notification count
// ValueNotifier<int> notificationCounterValueNotifier =
//     ValueNotifier(locator<LocalStorageService>().getNotificationsCount);

class ReceivedNotification {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;

  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });
}
