import 'package:flutter/material.dart';
import 'utils/net/Api.dart';
import 'webview.dart';

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
      'img': 'http://testcdn.wanqiandaikuan.com/Fo2MtGAx6M4Ywi2vSlfLukiEkTaL',
      'url': 'http://testloanapi.wanqiandaikuan.com/mobile/xkb/index/classlist?name=%E9%80%9A%E8%BF%87%E7%8E%87%E9%AB%98',
      'text': '高通过率'
    },
    {
      'img': 'http://testcdn.wanqiandaikuan.com/Fu11L8FYhkKgahjPeu8-sxHvi7HF',
      'url': 'http://testloanapi.wanqiandaikuan.com/mobile/xkb/index/classlist?name=%E9%97%AA%E7%94%B5%E6%94%BE%E6%AC%BE',
      'text': '闪电放款'
    },
    {
      'img': 'http://testcdn.wanqiandaikuan.com/FmbEfq70ApfRVY932wD7VI9DkBXg',
      'url': 'http://testloanapi.wanqiandaikuan.com/mobile/xkb/index/classlist?name=%E5%A4%A7%E9%A2%9D%E4%BD%8E%E6%81%AF',
      'text': '大额低息'
    },
    {
      'img': 'http://testcdn.wanqiandaikuan.com/FhsIcty_gJl_cFL8XOtBg9t_7kpH',
      'url': 'http://testloanapi.wanqiandaikuan.com/mobile/xkb/index/classlist?name=%E5%88%A9%E7%8E%87%E6%9C%80%E4%BD%8E',
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
              Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                return new WebView(title: '66钱庄', url: 'http://loanapi.wanqiandaikuan.com/short/gl');
              })).then( (String result){
                //处理代码
              });
            },
            child: Container(
              child: Image.network('http://testcdn.wanqiandaikuan.com/FiqEqiZG-OKPoYbmGh7zQVhoPKlB'),
              margin: EdgeInsets.only(bottom: 10.0),
            )
          ),
          Container(
            child: Column(
              children: [
                this._buildIconList(),
                GestureDetector(
                  onTap: () {
                    Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                      return new WebView(title: '闪电放款', url: 'http://testloanapi.wanqiandaikuan.com/mobile/xkb/index/classlist?name=%E9%97%AA%E7%94%B5%E6%94%BE%E6%AC%BE');
                    })).then( (String result){
                      //处理代码
                    });
                  },
                  child: Container(
                    child: Image.network('http://testcdn.wanqiandaikuan.com/FmrIau0sUpQzKkoyHay5A1t2VmIC'),
                    margin: EdgeInsets.only(top: 10.0),
                  )
                )
              ],
            ),
            color: Colors.white,
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          this._buildLoanList()
        ]
      ),
      backgroundColor: Color(0xFFF5F5F5)
    );
  }

  // 创建icon列表
  Widget _buildIconList () {
    var list = this._iconList.map((covariant) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
              return new WebView(title: covariant['text'], url: covariant['url']);
            })).then( (String result){
              //处理代码
            });
          },
          child: Column(
            children: [
              Image.network(
                covariant['img'],
                width: 50.0,
                fit: BoxFit.fill
              ),
              Container(
                child: Text(covariant['text']),
                margin: EdgeInsets.only(top: 5.0)
              )
            ]
          ),
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