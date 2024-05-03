import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalculationPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: CalculationSetting.values.length);

    return Scaffold(
      body: Column( // body全体をColumnでラップ
        children: <Widget>[
          TabBar( // TabBarをbodyの一部として直接配置
            controller: tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: CalculationSetting.values
                .map((setting) => Tab(text: setting.label))
                .toList(),
          ),
          Expanded( // ExpandedでTabBarViewを取り囲む
            child: TabBarView(
              controller: tabController,
              children: CalculationSetting.values
                  .map((setting) => setting.content)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

enum CalculationSetting {
  setting1,
  setting2,
  setting3,
  setting4,
  setting5;

  String get label {
    switch (this) {
      case CalculationSetting.setting1:
        return '計算設定1';
      case CalculationSetting.setting2:
        return '計算設定2';
      case CalculationSetting.setting3:
        return '計算設定3';
      case CalculationSetting.setting4:
        return '計算設定4';
      case CalculationSetting.setting5:
        return '計算設定5';
      default:
        return '';
    }
  }

  Widget get content {
    return Center(child: Text(label));
  }
}
