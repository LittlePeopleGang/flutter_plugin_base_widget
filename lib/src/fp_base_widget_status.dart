import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_base_widget/src/fp_theme_config.dart';

enum FPWidgetStatus { normal, loading, error, empty }

abstract class FPBaseWidgetStatus {
  State _fpState;

  FPWidgetStatus _status = FPWidgetStatus.normal;

  get status => _status;

  void initStatus(State state, BuildContext context) {
    _fpState = state;
  }

  // public method
  setStatus(FPWidgetStatus fpstatus) {
    _fpState.setState(() {
      _status = fpstatus;
    });
  }

  // override method
  Widget fpEmptyWidget(BuildContext context) {
    if (FPThemeConifg.emptyConifg != null) {
      return FPThemeConifg.emptyConifg(context);
    }
    return new Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            setEmptyImage() != null
                ? setEmptyImage()
                : new Image.asset('images/tt_refresh_loading_logo.png'),
            new SizedBox(
              height: 6,
            ),
            new Text(
              setEmptyDes() != null ? setEmptyDes() : '为啥是空的呢',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Color(0xff9a9ea1),
                  fontSize: 13.5,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  //子类复写此方法
  Image setEmptyImage() {
    return FPThemeConifg.emptyImage;
  }

  //子类复写此方法
  String setEmptyDes() {
    return FPThemeConifg.emptyText;
  }

  Widget fpErrorWidget(BuildContext context) {
    if (FPThemeConifg.errorConifg != null) {
      return FPThemeConifg.errorConifg(context);
    }
    return new Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            setErrorImage() != null
                ? setErrorImage()
                : new Image.asset('images/tt_refresh_loading_logo.png'),
            new Text(
              setErrorDes() != null ? setErrorDes() : '请哦，网络出现了一些问题',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Color(0xff9a9ea1),
                  fontSize: 13.5,
                  fontWeight: FontWeight.normal),
            ),
            new SizedBox(
              height: 15,
            ),
            new GestureDetector(
              onTap: reloadCallback,
              child: new Container(
                height: 25,
                width: 100,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                  border: new Border.all(color: Color(0xff969696), width: 1),
                ),
                child: Center(
                  child: new Text(
                    '重新加载',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Color(0xff969696),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //子类复写此方法
  Image setErrorImage() {
    return FPThemeConifg.errorImage;
  }

  //子类复写此方法
  String setErrorDes() {
    return FPThemeConifg.emptyText;
  }

  //子类复写此方法
  void reloadCallback() {}

  Widget fpLoadingWidget(BuildContext context) {
    if (FPThemeConifg.loadingConifg != null) {
      return FPThemeConifg.loadingConifg(context);
    }
    return new Container(
        child: new Center(
      child: new CupertinoActivityIndicator(),
    ));
  }
}
