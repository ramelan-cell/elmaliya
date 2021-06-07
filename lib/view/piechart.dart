import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:elmaliya/model/api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

String userid;
String in1;
String out1;
String in2;
String out2;
String in3;
String out3;
String in4;
String out4;
String in5;
String out5;
String in6;
String out6;
String in7;
String out7;
String in8;
String out8;
String in9;
String out9;
String in10;
String out10;
String in11;
String out11;
String in12;
String out12;

class PieChart2State extends State {
  int touchedIndex = -1;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (this.mounted) {
      setState(() {
        userid = preferences.getString("id");
        getData(userid);
      });
    }
  }

  getData(String userid) async {
    // print(BaseUrl.dataStatik);
    if (userid != null) {
      final response = await http.post(BaseUrl.dataStatik, body: {
        "user_id": userid,
      });
      final data = jsonDecode(response.body);
      // print(data);

      in1 = data['in1'];
      out1 = data['out1'];
      in2 = data['in2'];
      out2 = data['out2'];
      in3 = data['in3'];
      out3 = data['out3'];
      in4 = data['in4'];
      out4 = data['out4'];
      in5 = data['in5'];
      out5 = data['out5'];
      in6 = data['in6'];
      out6 = data['out6'];
      in7 = data['in7'];
      out7 = data['out7'];
      in8 = data['in8'];
      out8 = data['out8'];
      in9 = data['in9'];
      out9 = data['out9'];
      in10 = data['in10'];
      out10 = data['out10'];
      in11 = data['in11'];
      out11 = data['out11'];
      in12 = data['in12'];
      out12 = data['out12'];
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: ListView(
        children: [
          (in1 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Januari'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections1(in1, out1)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in2 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Februari'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections2(in2, out2)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in3 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Maret'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections3(in3, out3)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in4 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan April'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections4(in4, out4)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in5 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Mei'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections5(in5, out5)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in6 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Juni'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections6(in6, out6)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in7 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Juli'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections7(in7, out7)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in8 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Agustus'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections8(in8, out8)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in9 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan September'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections9(in9, out9)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in10 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Oktober'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections10(in10, out10)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in11 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan November'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections11(in11, out11)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          (in12 != '0')
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Grafik bulan Desember'),
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections12(in12, out12)),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'In',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Out',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections1(String in1, String out1) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in1),
            title: in1,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out1),
            title: out1,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections2(String in2, String out2) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in2) ?? 0,
            title: in2.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out2),
            title: out2.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections3(String in3, String out3) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in3),
            title: in3,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out3),
            title: out3,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections4(String in4, String out4) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in4),
            title: in4,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out4),
            title: out4,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections5(String in5, String out5) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in5),
            title: in5,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out5),
            title: out5,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections6(String in6, String out6) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in6),
            title: in6,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out6),
            title: out6,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections7(String in7, String out7) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in7),
            title: in7,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out7),
            title: out7,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections8(String in8, String out8) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in8),
            title: in8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out8),
            title: out8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections9(String in9, String out9) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in9),
            title: in9,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out9),
            title: out9,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections10(String in10, String out10) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in10),
            title: in10,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out10),
            title: out10,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections11(String in11, out12) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in11),
            title: in11,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out11),
            title: out11,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections12(String in12, String out12) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: double.parse(in12),
            title: in12,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: double.parse(out12),
            title: out12,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
