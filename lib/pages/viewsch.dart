import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/services/services.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTutorSch extends StatefulWidget {
  String teacherEmail;
  ViewTutorSch(this.teacherEmail);
  @override
  _ViewTutorSchState createState() => _ViewTutorSchState();
}

class _ViewTutorSchState extends State<ViewTutorSch> {
  TextEditingController messageController = TextEditingController();
  String message;
  Stream<QuerySnapshot> mon;
  Stream<QuerySnapshot> tus;
  Stream<QuerySnapshot> wen;
  Stream<QuerySnapshot> thr;
  Stream<QuerySnapshot> fri;
  Stream<QuerySnapshot> sa;
  Stream<QuerySnapshot> sunday;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Service().getMon(widget.teacherEmail).then((value) {
      setState(() {
        mon = value;
      });
    });
    Service().getTus(widget.teacherEmail).then((value) {
      setState(() {
        tus = value;
      });
    });
    Service().getWen(widget.teacherEmail).then((value) {
      setState(() {
        wen = value;
      });
    });
    Service().getThr(widget.teacherEmail).then((value) {
      setState(() {
        thr = value;
      });
    });
    Service().getFri(widget.teacherEmail).then((value) {
      setState(() {
        fri = value;
      });
    });
    Service().getSunSa(widget.teacherEmail).then((value) {
      setState(() {
        sa = value;
        sunday = value;
      });
    });
    // Service().getSa("z@gmail.commo@gmail.com").then((value) {
    //   setState(() {
    //     sunday = value;
    //   });
    // });
  }

  Color color = Color(0xFF4AC8EA);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('View Time Slot'),
        centerTitle: true,
        backgroundColor: color,
      ),
      //
      body: Container(
          child: StreamBuilder6(
        streams: Tuple6(mon, tus, wen, thr, fri, sunday),
        builder: (context, snapshot) {
          if (snapshot.item1.data == null ||
              snapshot.item2.data == null ||
              snapshot.item3.data == null ||
              snapshot.item4.data == null ||
              snapshot.item4.data == null ||
              snapshot.item4.data == null ||
              snapshot.item5.data == null ||
              snapshot.item6.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.item1.data.documents.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text('Monday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item1.data.documents[index]
                                                .data["monday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item1
                                                .data
                                                .documents[index]
                                                .data["monday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          ///////////////////////////////a//////This wrap for Tuesday///////////////////////
                          Text('Tuesday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item2.data.documents[index]
                                                .data["tuesday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item2
                                                .data
                                                .documents[index]
                                                .data["tuesday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ////////////////
                          Divider(),
                          /////////////////////////////////////This wrap for Wednesday///////////////////////
                          Text('Wednesday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item3.data.documents[index]
                                                .data["wednesday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item3
                                                .data
                                                .documents[index]
                                                .data["wednesday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          /////////////////////////////////////This wrap for Thrusday///////////////////////
                          Text('Thrusday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item4.data.documents[index]
                                                .data["thrusday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item4
                                                .data
                                                .documents[index]
                                                .data["thrusday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          /////////////////////////////////////This wrap for Thrusday///////////////////////
                          Text('Friday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item5.data.documents[index]
                                                .data["friday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item5
                                                .data
                                                .documents[index]
                                                .data["friday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Divider(),
                          /////////////////////////////////////This wrap for Thrusday///////////////////////
                          Text('Saturday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["saturday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["saturday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          /////////////////////////////////////This wrap for Thrusday///////////////////////
                          Text('Sunday Availability',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][0] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][0]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][1] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][1]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][2] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][2]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][3] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][3]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][4] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][4]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][5] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][5]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][6] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][6]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][7] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][7]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][8] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][8]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][9] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][9]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][10] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][10]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][11] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][11]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][12] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][12]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                    SizedBox(width: 5),
                                    snapshot.item6.data.documents[index]
                                                .data["sunday"][13] ==
                                            null
                                        ? SizedBox.shrink()
                                        : FilterChip(
                                            label: Text(snapshot
                                                .item6
                                                .data
                                                .documents[index]
                                                .data["sunday"][13]),
                                            labelStyle: TextStyle(
                                                color: Colors.pink[300],
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            selected: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xffededed),
                                            onSelected: (isSelected) {},
                                            selectedColor: Color(0xffeadffd),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
