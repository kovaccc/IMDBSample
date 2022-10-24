import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'config.dart';

void main() {
  patrolTest(
    'taps around',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.release;
        if (release == "12") {
          // button left to home
          await $.native.pressRecentApps();
          await $.native.pressDoubleRecentApps();

          // press home
          await $.native.pressHome();

          // enable and disable bluetooth manually
          await $.native.openQuickSettings();
          await $.native.tap(Selector(text: 'Bluetooth'));
          await $.native.tap(Selector(text: 'Off'));
          await Future.delayed(const Duration(seconds: 2));
          await $.native.tap(Selector(text: 'On'));
          await $.native.tap(Selector(text: 'Done'));
          await $.native.pressBack();
          await $.native.pressBack();

          // enable and disable airplane mode
          // does not work, can't find Flight mode text even though
          // it is on screen
          // await $.native.openQuickSettings();
          // await $.native.tap(Selector(text: 'Flight mode'));
          // await $.native.tap(Selector(text: 'Off'));
          // await Future.delayed(const Duration(seconds: 2));
          // await $.native.tap(Selector(text: 'On'));
          // await $.native.tap(Selector(text: 'Done'));
          // await $.native.pressBack();
          // await $.native.pressBack();

          // enable and disable location
          // does not work because location is on second page in quick settings
          // await $.native.openQuickSettings();
          // await $.native.tap(Selector(text: 'Location'));
          // await $.native.tap(Selector(text: 'Off'));
          // await Future.delayed(const Duration(seconds: 2));
          // await $.native.tap(Selector(text: 'On'));
          // await $.native.tap(Selector(text: 'Done'));
          // await $.native.pressBack();
          // await $.native.pressBack();
        }
      }
      if (Platform.isIOS) {
        // enable and disable bluetooth with API
        await $.native.enableBluetooth();
        await Future.delayed(const Duration(seconds: 2));
        await $.native.disableBluetooth();

        // enable and disable Airplane mode with API
        await $.native.enableAirplaneMode();
        await Future.delayed(const Duration(seconds: 2));
        await $.native.disableAirplaneMode();
      }

      if (Platform.isIOS) {
        await $.native.closeHeadsUpNotification();
      }

      await $.native.openNotifications();
      final notifications = await $.native.getNotifications();
      $.log('Found ${notifications.length} notifications');
      notifications.forEach($.log);
      // from bottom to top on Android
      await $.native.tapOnNotificationByIndex(0);

      await $.native.enableWifi();
      await Future.delayed(const Duration(seconds: 2));
      await $.native.disableWifi();
      await Future.delayed(const Duration(seconds: 2));
      await $.native.enableWifi();

      await $.native.enableCellular();
      await $.native.disableCellular();
      await $.native.enableCellular();

      await $.native.enableDarkMode();
      await $.native.disableDarkMode();
      await $.native.enableDarkMode();

      await $.native.openApp(appId: "com.matej.imdb_sample.imdb_sample");
      await Future.delayed(const Duration(seconds: 6));
    },
  );
}
