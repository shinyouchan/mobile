import 'package:eggbee/chat_list/chat_list_widget.dart';
import 'package:eggbee/index.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  final List<Widget> _tabs = [
    ChatListWidget(),
    ShopWidget(),
    FriendHouseWidget(),
    ContractWidget(),
    ProfileWidget(),
  ];

  void _onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = FriendHouseWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _tabs.elementAt(_currentIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xFFFEC11C),
          onPressed: () {
            _onTab(2);
          },
          child: Icon(FFIcons.kjunghyun2, size: 32),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(FFIcons.kbubble),
            label: '채팅'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '상점'
          ),
          BottomNavigationBarItem(
              icon: Icon(FFIcons.kjunghyun2),
              label: '홈'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),//star
              label: '계약'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '프로필'
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFFEC11C),
        unselectedItemColor: Color(0xA5000000),
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: _onTab,
        type: BottomNavigationBarType.fixed, //얘가 선택한 Item의 사이즈나 눌럿을떄 효과를 없애고 고정 시킴
      ),
    );
  }
}
