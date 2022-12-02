import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_paisa/src/core/enum/box_types.dart';
import 'package:hive/hive.dart';

import '../../../core/common.dart';
import '../../../service_locator.dart';
import 'setting_option.dart';

class DynamicColorSwitchWidget extends StatefulWidget {
  const DynamicColorSwitchWidget({Key? key}) : super(key: key);

  @override
  DynamicColorSwitchWidgetState createState() =>
      DynamicColorSwitchWidgetState();
}

class DynamicColorSwitchWidgetState extends State<DynamicColorSwitchWidget> {
  final Box<dynamic> settings =
      locator.get<Box<dynamic>>(instanceName: BoxType.settings.stringValue);
  late bool isDynamic = settings.get(
    dynamicColorKey,
    defaultValue: false,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsOption(
      title: AppLocalizations.of(context)!.dynamicColorLabel,
      trailing: Switch(
        value: settings.get(
          dynamicColorKey,
          defaultValue: false,
        ),
        onChanged: (value) {
          settings.put(dynamicColorKey, value);
          setState(() {});
        },
      ),
    );
  }
}
