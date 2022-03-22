import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Spelling extends StatefulWidget {
  final items;
  final tatcategory;

  const Spelling({this.items, this.tatcategory});

  @override
  _SpellingState createState() => _SpellingState();
}

class _SpellingState extends State<Spelling> {
  var today = 'cream';
  var letterColors = {};
  bool iscorrect = false;
  String choosenAnswer = '';
  final double height = 45.0;
  var currenttext = [
    '_',
    '_',
    '_',
    '_',
    '_',
  ];
  var currentindex = 0;
  final double width = 45.0;
  final double margin = 2;
  final color = Color(0xff044b93);
  final Color fontColor = Colors.white;
  final double fontSize = 18.0;
  final _style = const TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
    fontSize: 18,
    color: Color(0xff044b93),
  );

  final TextEditingController _textController = TextEditingController();

  int amtQuestions = 0;
  List words = [];
  var updatebtns;


  @override
  void initState() {
    super.initState();
    amtQuestions = widget.items != null ? widget.items.length : 0;
    words = widget.items.keys.toList();
    words.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    updatebtns = getinput(currenttext, TextAlign.center,
        42.0, letterColors, MediaQuery.of(context).size.width);
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.orange),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SUword',
                  textAlign: TextAlign.center,
                  style:
                      _style.copyWith(color: Color(0xff044b93), fontSize: 32),
                )
              ]),
        ),
        backgroundColor: Colors.white,
        body: Container(
            height: screenheight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://urban.tatar/bebkeler/tatar/assets/terrazo.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.dstATop),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5, vertical: screenheight * 0.15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: updatebtns),
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: getkey(
                            'Q W E R T Y U I O P'.split(' '),
                            screenwidth / 11,
                            screenwidth / 12,
                            TextAlign.center,
                            0.85),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getkey(
                              'A S D F G H J K L'.split(' '),
                              screenwidth / 11,
                              screenwidth / 12,
                              TextAlign.center,
                              0.85)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getkey(
                              'Z X C V B N M'.split(' '),
                              screenwidth / 11,
                              screenwidth / 12,
                              TextAlign.center,
                              0.85)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: color.withOpacity(1),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(45))),
                                    minimumSize: Size(
                                        screenwidth * 0.3, screenheight * 0.05),
                                    textStyle: _style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                                icon: Icon(Icons.check_box_rounded,
                                    size: screenheight * 0.035),
                                onPressed: () {
                                  choosenAnswer = currenttext.join('');
                                  checkanswer(screenheight, screenwidth);
                                  // clearAll();
                                },
                                label: Text(
                                  'Enter',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: color.withOpacity(1),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(45))),
                                    minimumSize: Size(
                                        screenwidth * 0.15, screenheight * 0.05),
                                    textStyle: _style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),

                                onPressed: () {
                                  clearLast();
                                  // clearAll();
                                },
                                child: Text(
                                  '⌫',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ))
                          ])
                    ]),
                  ]),
            )));
  }

  void onpressedButton(String k) {
    setState(() {
      currenttext[currentindex] = k.toLowerCase();
      currentindex += 1;
    });
  }

  void clearLast() {
    if (currenttext.length > 0) {
      setState(() {
        currenttext[currentindex-1] = '_';
        currentindex-=1;
        updatebtns = getinput(currenttext, TextAlign.center,
            42.0, letterColors, MediaQuery.of(context).size.width);});
    }
  }

  void clearAll() {
    setState(() {
      currenttext = [
        '_',
        '_',
        '_',
        '_',
        '_',
      ];
    });
  }
  
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  

  void checkanswer(screenheight, screenwidth) {
    setState(() {updatebtns = getinput(currenttext, TextAlign.center,
        42.0, letterColors, MediaQuery.of(context).size.width);});
    print(choosenAnswer);
    if (choosenAnswer.toLowerCase() == today.toLowerCase()) {
      iscorrect = true;
    } else {
      var ind = 0;
      currenttext.forEach((element) {
        if (element == today[ind]){
          letterColors[element] = Colors.green;
        }
        else{
          if (today.contains(element)){
            letterColors[element] = Colors.yellow;
          }
          else{
            letterColors[element] = Colors.grey;
          }
        }
        ind +=1;
      });
      iscorrect = false;
    }
    ;
    if(iscorrect) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: iscorrect
                    ? color.withOpacity(0.8)
                    : Colors.red.withOpacity(0.8),
                content: iscorrect
                    ? Text("Guessed right - ${choosenAnswer.toUpperCase()}!",
                        style: TextStyle(color: Colors.white, fontSize: 20))
                    : Text("Guessed wrong - ${today} ",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                actions: <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios_rounded,
                              size: screenheight * 0.035,
                              color:
                                  iscorrect ? Color(0xff044b93) : Colors.white),
                          onPressed: () async {
                            setState(() {

                              }
                            );
                          }))
                ]));
    }
  }

  List<Widget> getkey(letters, height, width, textAlign, opacity,
      {fonts = 12.0, last = false}) {
    List<Widget> arr = [];
    letters.forEach((l) {
      arr.add(
        Container(
            margin: EdgeInsets.all(margin),
            height: height,
            width: width,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff044b93).withOpacity(opacity),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  )),
              onPressed: () {
                onpressedButton(l.toLowerCase());
              },
              child: Text(
                l,
                textAlign: TextAlign.center,
                style: TextStyle(color: fontColor, fontSize: fonts),
              ),
            )),
      );
    });
    return arr;
  }

}

  List<Widget> getinput(letters, TextAlign center, double fonts, Map letterColors, width) {
    List<Widget> arr = [];
    letters.forEach((l) {
      arr.add(
        Container(
            margin: EdgeInsets.all(3),
            height: width / 6,
            width: width /8,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: letterColors[l] != null? letterColors[l] : Color(0xff044b93),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  )),
              onPressed: () {
              },
              child: Text(
                l,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: fonts),
              ),
            )),
      );
    });
  return arr;}
