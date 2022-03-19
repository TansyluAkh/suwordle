
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Spelling extends StatefulWidget {
  final items;
  final tatcategory;

  const Spelling({ this.items, this.tatcategory});

  @override
  _SpellingState createState() => _SpellingState();
}

class _SpellingState extends State<Spelling> {
  var blucolor = Color(0xff044b93);
  var buttonColor = Color(0xff044b93);
  var scoreColor = Color(0xff044b93);
  int score = 0;
  int i = 0;
  bool iscorrect = false;
  String choosenAnswer = '';
  int currentQuestion = 1;
  final double height = 45.0;
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

  get result => buttonColor;

  @override
  void initState() {
    super.initState();
    amtQuestions = widget.items != null ? widget.items.length : 0;
    words = widget.items.keys.toList();
    words.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    _textController.text;
    return  Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.orange),
              shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text( 'SUword',
                        textAlign: TextAlign.center,
                        style: _style.copyWith(color: Color(0xff044b93), fontSize: 32),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       // Icon(Icons.favorite_rounded,
                    //       //     color: Colors.orange,
                    //       //     size: screenheight * 0.045),
                    //       Text(' ' + score.toString(),
                    //           style: TextStyle(
                    //               color: Colors.orange,
                    //               fontWeight: FontWeight.bold,
                    //               fontFamily: 'Montserrat',
                    //               fontSize: 22)),
                    //     ])
                    )]),
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
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: screenheight*0.15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children:getkey('_ _ _ _ _'.split(' '),  screenwidth/6,  screenwidth/6, TextAlign.center)),

                        // Container(
                        //     width: screenwidth,
                        //     child: TextFormField(
                        //       controller: _textController,
                        //       onChanged: (val) {
                        //         choosenAnswer = val;
                        //       },
                        //       textCapitalization: TextCapitalization.characters,
                        //       readOnly: true,
                        //       maxLength: words[i].length,
                        //       showCursor: false,
                        //       textAlign: TextAlign.center,
                        //       autocorrect: false,
                        //       style: TextStyle(
                        //         fontSize: 25.0,
                        //         color: Color(0xff044b93),
                        //         letterSpacing: 5.0,
                        //       ),
                        //       decoration: InputDecoration(
                        //         suffixIcon: IconButton(
                        //           iconSize: 30,
                        //           onPressed: clearLast,
                        //           icon: Icon(Icons.backspace_rounded,
                        //               size: 35, color: Color(0xff044b93)),
                        //         ),
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderRadius: BorderRadius.circular(45),
                        //           borderSide: BorderSide(
                        //             color: Color(0xff044b93),
                        //             width: 5.0,
                        //           ),
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderRadius: BorderRadius.circular(45),
                        //           borderSide: BorderSide(
                        //             color: Color(0xff044b93),
                        //             width: 5.0,
                        //           ),
                        //         ),
                        //       ),
                        //     )),
                        Column( mainAxisSize: MainAxisSize.max,children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: getkey('Q W E R T Y U I O P'.split(' '),
                                screenwidth/11, screenwidth/12, TextAlign.center),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getkey('A S D F G H J K L'.split(' '),
                                  screenwidth/11, screenwidth/12, TextAlign.center)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: getkey('Z X C V B N M'.split(' '),
                                screenwidth/11, screenwidth/12,TextAlign.center),
                          ),
                         SizedBox(
                            height: 5.0,
                          ),
                        ]),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     ElevatedButton.icon(
                        //       style: ElevatedButton.styleFrom(
                        //           primary: Color(0xff044b93),
                        //           shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //                   Radius.circular(45))),
                        //           minimumSize: Size(
                        //               screenwidth * 0.35, screenheight * 0.07),
                        //           textStyle: _style.copyWith(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.normal)),
                        //       icon: Icon(Icons.skip_next_rounded,
                        //           size: screenheight * 0.05),
                        //       label: Text(
                        //         'Башка\nсорау',
                        //         overflow: TextOverflow.ellipsis,
                        //         maxLines: 3,
                        //       ),
                        //       onPressed: () {
                        //         _textController.clear();
                        //         onSkip();
                        //       },
                        //     ),
                        //     ElevatedButton.icon(
                        //       style: ElevatedButton.styleFrom(
                        //           primary: Color(0xff044b93).withOpacity(1),
                        //           shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //                   Radius.circular(45))),
                        //           minimumSize: Size(
                        //               screenwidth * 0.35, screenheight * 0.07),
                        //           textStyle: _style.copyWith(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.normal)),
                        //       icon: Icon(Icons.check_box_rounded,
                        //           size: screenheight * 0.05),
                        //       onPressed: () {
                        //         choosenAnswer = _textController.text;
                        //         checkanswer(screenheight, screenwidth);
                        //         _textController.clear();
                        //       },
                        //       label: Text(
                        //         'Җавап\nбир',
                        //         overflow: TextOverflow.ellipsis,
                        //         maxLines: 3,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ]),
                )));
  }

  void onpressedButton(String k) {
    if (k == 'бушлык') {
      _textController.text += ' ';
    } else {
      _textController.text += k;
    }
  }

  void clearLast() {
    if (_textController.text.length > 0) {
      _textController.text =
          _textController.text.substring(0, _textController.text.length - 1);
    }
  }

  void clearAll() {
    _textController.clear();
  }

  void onSkip() {
    setState(() {
      score = score - 1;
    });
    nextquestion();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void nextquestion() async {
    setState(() {
      if (i < amtQuestions - 1) {
        currentQuestion++;
        i++;
      }
    });
  }

  void checkanswer(screenheight, screenwidth) {
    print(choosenAnswer);
    if (choosenAnswer.toLowerCase() == words[i].toLowerCase()) {
      score = score + 1;
      iscorrect = true;
    } else {
      iscorrect = false;
    }
    ;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            backgroundColor: iscorrect
                ? Colors.green.withOpacity(0.8)
                : Colors.orange.withOpacity(0.8),
            content: iscorrect
                ? Text("Җавабың дөрес - ${choosenAnswer.toUpperCase()}!",
                style: TextStyle(color: Color(0xff044b93), fontSize: 20))
                : Text("Җавабың ялгыш, дөресе - ${words[i].toUpperCase()} ",
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
                        // if (i < amtQuestions - 1){
                        // try {await player.setUrl(widget.items[words[i+1]]);
                        // } on Exception catch (_){('no audio');}}
                        setState(() {
                          if (i < amtQuestions - 1) {
                            currentQuestion++;
                            i++;
                            Navigator.of(context).pop();
                          }
                          // else {Navigator.of(context).pushReplacement(MaterialPageRoute(
                          // builder: (context) => QuizResultScreen(
                          // result: score,
                          // qnum: amtQuestions,
                          // tatcategory: widget.tatcategory,
                          // ),
                          // ));
                          // }
                        });
                      }))
            ]));
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   player.dispose();
  // }

  List<Widget> getkey(letters, height, width, textAlign) {
    List<Widget> arr = [];
    letters.forEach((l) {
      arr.add(
        Container(
            margin: EdgeInsets.all(margin),
            height: height,
            width: width,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff044b93).withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  )),
              onPressed: () {
                onpressedButton(l.toLowerCase());
              },
              child: Text(
                l,
                textAlign: TextAlign.center,
                style: TextStyle(color: fontColor, fontSize: fontSize),
              ),
            )),
      );
    });
    return arr;
  }
}
