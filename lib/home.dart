import 'package:flutter/material.dart';
import 'utils/net/Api.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState(){
    ApiInterface.getHomeTop().then((res){
      print(res);
    });
    return HomeState();
  }
}

class HomeState extends State<Home> {
  // 图标列表数据
  final _iconList = [
    {
      'url': 'https://file.iviewui.com/asd/asd-i-2.png',
      'text': '高通过率'
    },
    {
      'url': 'https://file.iviewui.com/asd/asd-i-2.png',
      'text': '闪电放款'
    },
    {
      'url': 'https://file.iviewui.com/asd/asd-i-2.png',
      'text': '大额低息'
    },
    {
      'url': 'https://file.iviewui.com/asd/asd-i-2.png',
      'text': '信用卡'
    }
  ];

  final _loanList = [
    {
      'name': '今日爆款',
      'list': []
    },
    {
      'name': '今日爆款',
      'list': []
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('首页', style: TextStyle(
            color: Color(0xFF333333)
          ))
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF)
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Container(
              child: Image.network('https://file.iviewui.com/asd/asd-i-2.png'),
              margin: EdgeInsets.only(bottom: 10.0),
            )
          ),
          Container(
            child: Column(
              children: [
                this._buildIconList(),
                Container(
                  child: Image.network('https://file.iviewui.com/asd/asd-i-2.png'),
                  margin: EdgeInsets.only(top: 10.0),
                )
              ],
            ),
            color: Colors.white,
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          this._buildLoanList(),
          Image.network('https://file.iviewui.com/asd/asd-i-2.png')
        ]
      ),
      backgroundColor: Color(0xFFF5F5F5)
    );
  }

  // 创建icon列表
  Widget _buildIconList () {
    var list = this._iconList.map((covariant) {
      return Expanded(
        child: Column(
          children: [
            Image.network(
              covariant['url'],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.fill
            ),
            Container(
              child: Text(covariant['text']),
              margin: EdgeInsets.only(top: 5.0)
            )
          ]
        ),
        flex: 1
      );
    }).toList();
    return Row(
      children: list
    );
  }

  Widget _buildLoanList () {
    var list = this._loanList.map((covariant){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 14.0,
                      width: 2.0,
                      color: Color(0xFFFE5031),
                      margin: EdgeInsets.only(right: 5.0),
                    ),
                    Text(
                      covariant['name'],
                      style: TextStyle(color: Color(0xFF666666), fontSize: 14.0, height: 1.0)
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    width: 0.5,
                    color: Color(0xFFE5E5E5)
                  ))
                )
              ),
              padding: EdgeInsets.only(left: 15.0, right: 15.0)
            ),
            Container(
              child: Center(
                child: Text('查看更多贷款', style: TextStyle(fontSize: 14.0, color: Color(0xFF4674DB))),
              ),
              height: 50.0,
            )
          ]
        ),
        margin: EdgeInsets.only(bottom: 10.0),
        color: Colors.white
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: list
    );
  }
}