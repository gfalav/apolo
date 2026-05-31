import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _setupFcm();
  }

  Future<void> _setupFcm() async {
    // 1. Solicitar permisos (Crucial para iOS y Android 13+)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permiso concedido por el usuario');
    }

    // 2. Obtener el token del dispositivo (opcional, para enviarlo a tu backend)
    String? token = await _fcm.getToken();
    this.token.value = token ?? '';
    print("FCM Token: $token");

    // 3. Manejar mensajes en PRIMER PLANO (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('----------------------------------------------------------------');
      print('----------------------------------------------------------------');
      print('Mensaje recibido en primer plano: ${message.notification?.title}');

      // Aquí puedes usar el snackbar de GetX para mostrar una notificación interna
      Get.snackbar(
        message.notification?.title ?? 'Nueva notificación',
        message.notification?.body ?? '',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 4),
      );
    });

    // 4. Manejar clics cuando la app está en SEGUNDO PLANO (Background)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('----------------------------------------------------------------');
      print('----------------------------------------------------------------');
      print('El usuario tocó la notificación en segundo plano');
      _handleNotificationClick(message);
    });

    // 5. Manejar clics si la app estaba COMPLETAMENTE CERRADA (Terminated)
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      print('----------------------------------------------------------------');
      print('----------------------------------------------------------------');
      print('La app se abrió desde una notificación cerrada');
      _handleNotificationClick(initialMessage);
    }
  }

  // Función para navegar usando GetX según los datos de la notificación
  void _handleNotificationClick(RemoteMessage message) {
    // Puedes enviar datos personalizados en el "payload" (data) de Firebase
    if (message.data['screen'] == 'chat') {
      Get.toNamed('/chat', arguments: message.data['chatId']);
    } else {
      Get.toNamed('/notifications');
    }
  }
}
