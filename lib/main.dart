import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/loan.dart';
import 'package:flutter_app/webview.dart';
import 'package:dio/dio.dart';
import 'utils/net/Http.dart';
import 'utils/net/Api.dart';
import 'utils/toast/toast.dart';

void main() {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest:(RequestOptions options){
      options.headers['auth'] = '18d68c';
      options.headers['sdk'] = 'qbb';
      options.headers['system'] = 'ios';
      options.headers['version'] = '1.0.0';
      return options; //continue
    },
    onResponse:(Response response) {
      if (response.data['errno'] != 0) {
        ToastH.error(response.data['errmsg']);
        if (response.data['errno'] == 2001) {
          // Navigator.pushNamed(context, '/login');
        }
      }
      return response; // continue
    },
    onError: (DioError e) {
      ToastH.error('网络错误');
    }
  ));
  // 获取配置
  ApiInterface.getConfig().then((res){
    print(res);
  });
  runApp(MyApp());
}
//运行首页
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyMainState();
  }
}

class MyMainState extends State<MyApp> {
  // 默认索引第一个tab
  int _tabIndex = 0;

  // 页面内容
  var _body;

  // 底部菜单栏数组
  var tabList = [
    {
      'icon': 'static/images/tabbar/tabbar_homepage_normal@3x.png',
      'activeIcon': 'static/images/tabbar/tabbar_homepage_select@3x.png',
      'title': '首页'
    },
    {
      'icon': 'static/images/tabbar/tabbar_loan_normal@3x.png',
      'activeIcon': 'static/images/tabbar/tabbar_loan_select@3x.png',
      'title': '借款'
    },
    {
      'icon': 'static/images/tabbar/tabbar_recommend_normal@3x.png',
      'activeIcon': 'static/images/tabbar/tabbar_recommend_select@3x.png',
      'title': '推荐'
    },
    {
      'icon': 'static/images/tabbar/tabbar_mine_normal@3x.png',
      'activeIcon': 'static/images/tabbar/tabbar_mine_select@3x.png',
      'title': '我的'
    }
  ];

  // 路由map
  Map<String, WidgetBuilder> _routes = {

  };



  void initData() {
    // 先那一次数据，把accesstoken放到内存
    // ParamsUtils.getParams();
    _body = IndexedStack(
      children: <Widget>[
        Home(),
        Loan(),
        Text('3'),
        Text('4')
      ],
      index: _tabIndex,
    );
  }

  // 获取BottomNavigationBarItem
  List<BottomNavigationBarItem> getBottomNavigationBarItem() {
    return tabList.map((covariant){
      return BottomNavigationBarItem(
          icon: Image.asset(
              covariant['icon'],
              width: 20.0,
              height: 20.0
          ),
          activeIcon: Image.asset(
              covariant['activeIcon'],
              width: 20.0,
              height: 20.0
          ),
          title: Container(
              child: Text(covariant['title']),
              margin: EdgeInsets.only(top: 4.0)
          )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color(0xFF63CA6C)),
      routes: _routes,
      home: Scaffold(
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: getBottomNavigationBarItem(),
          currentIndex: _tabIndex,
          selectedFontSize: 12.0,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xFF509EF3),
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        )
      )
    );
  }

  @override
  didChangeDependencies () {
    super.didChangeDependencies();
    print(123);
  }
}