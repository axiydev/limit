import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:limit/models/time_model.dart';
import 'package:limit/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String id='home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin{
  List<Tme> _mymodel=new List.from({
    Tme(time: '12:10',act: 'salom sdjhfdg'),
  });
  List lt=new List();
  AnimationController _controller;
  Animation _animation;
  Animation _anim;
  Animation _anim1;
  var timeController=new TextEditingController();
  var wordController=new TextEditingController();
  DateTime time=new DateTime.now();
  bool isFull=true;
  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation=CurvedAnimation(parent: _controller,curve: Curves.easeIn);
    _animation.addListener(() {
      setState((){
        time=new DateTime.now();
      });
    });
    _anim=Tween(begin:2.0,end:0.0).animate(_controller)..addListener(() {
      setState(() {
      });
    })..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _controller.repeat();
      }
    });
    _animation.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _controller.repeat();
      }
    });
    _anim1=Tween<Size>(begin: Size(15,15),end:Size(25,25)).animate(CurvedAnimation(parent:_controller,curve: Curves.easeIn,))..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _controller.repeat();
      }
    });
    _controller.forward();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  void _simpleDialog(){
    String time=timeController.text.toString().trim();
    String word=wordController.text.toString().trim();
    showDialog(
        context:context,
        builder:(BuildContext context){
          return SimpleDialog(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: Colors.white.withOpacity(0.9),
            title:Text('This is simple dialog'),
            children: [
              //bu yerga istagan widgetimizni qo`yishimiz mumkin
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                      hintText: 'hh:mm',
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2,color:Colors.red,),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: wordController,
                  decoration: InputDecoration(
                    hintText: 'mashg`ulot',
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),
                  ),
                ),
              ),
              SimpleDialogOption(
                child:Icon(Icons.add),
                onPressed: ()async{
                  if(time.isEmpty || word.isEmpty){
                    Utils.showToast(text:'qaytadan kiriting');
                  }else if(time.isNotEmpty && word.isNotEmpty){
                    setState(()async{
                      _mymodel.add(new Tme(time: time.toString(),act:word));
                    });
                    Utils.showToast(text:'vaqt qo`shildi');
                    await Navigator.of(context).pop(HomeScreen.id);
                  }
                },
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
         child:Stack(
           children:[
             Container(
               decoration: BoxDecoration(
                 image:DecorationImage(
                   image: AssetImage('assets/image/ic_image1.png'),
                   fit:BoxFit.cover,
                 ),
               ),
             ),
             SingleChildScrollView(
               child:Column(
                 children: [
                   Container(
                     width: double.infinity,
                     height:MediaQuery.of(context).size.width*0.5,
                     child: Row(
                       children: [
                         Expanded(
                           flex: 6,
                           child:Center(
                             child:Container(
                               height: MediaQuery.of(context).size.width*0.2,
                               padding:EdgeInsets.all(10),
                               decoration:BoxDecoration(
                                 color:Colors.blue.withOpacity(0.3),
                                 borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(MediaQuery.of(context).size.width*0.07),
                                   bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.07),
                                 ),
                               ),
                               child:Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   AnimatedBuilder(
                                     animation: _anim1,
                                     builder: (context,ch){
                                       return Text('\u{1f319} \u{1f559}',style:TextStyle(fontSize: _anim1.value.height));
                                     },
                                   ),
                                   SizedBox(width: 10,),
                                   Transform(
                                     alignment: FractionalOffset.center,
                                     transform: Matrix4.identity()..setEntry(3,2,0.002)..rotateX(3.14*_anim.value),
                                     child: Text('Time',style:TextStyle(fontSize: 25,color:Colors.white,fontWeight: FontWeight.bold)),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                         Spacer(flex: 1,),
                         Expanded(flex: 3,
                           child:Center(
                             child:Container(
                               height:MediaQuery.of(context).size.width*0.2,
                               decoration:BoxDecoration(
                                   color:Color.fromRGBO(244, 244, 248,1),
                                   borderRadius: BorderRadius.only(topLeft:Radius.circular(MediaQuery.of(context).size.width*0.07 ),bottomLeft:Radius.circular(MediaQuery.of(context).size.width*0.07))
                               ),
                               child:Center(
                                 child:AnimatedBuilder(
                                   animation: _animation,
                                   builder:(ctx,ch)=>Text('$time'.substring(10,22),style:TextStyle(color:Colors.black,fontSize:18,fontWeight: FontWeight.bold)),
                                 ),
                               ),
                             ),
                           )
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width:MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                     padding:EdgeInsets.all(20),
                     decoration: BoxDecoration(
                       color:Colors.white.withOpacity(0.5),
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                     ),
                       child:Container(
                         height: double.infinity,
                         width: double.infinity,
                         child:ListView(
                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           children:_mymodel.map((i) =>_myWidgetOne(i)).toList(),
                         ),
                       ),
                     ),
                 ],
               ),
             ),
             _myNavigationBar(),

           ],
         ),
      ),
    );
  }
  Widget _myNavigationBar(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: double.infinity,
        color:Colors.transparent,
        margin:EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child:Container(
          height: 60,
          width:double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Expanded(child: IconButton(
                icon:Icon(Icons.timelapse),
                onPressed: (){
                },
              ),),
              Expanded(
                child:GestureDetector(
                  onTap: (){
                    _simpleDialog();
                  },
                  child:Container(
                    height:55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:Theme.of(context).primaryColor,
                    ),
                    child:Icon(Icons.add,color:Colors.white),
                  ),
                )
              ),
              Expanded(
                child:IconButton(
                  icon:Icon(Icons.circle),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  Widget _myWidgetOne(Tme tme){
    return  Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      child:Row(
        children:[
          Expanded(
            flex: 3,
            child:Container(
              height: 60,
              decoration:BoxDecoration(
                color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Center(
                child:Text(tme.time,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.white)),
              ),
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
              flex: 14,
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Expanded(
                    flex: 8,
                    child:Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color:Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Center(
                        child:Text(tme.act,style:TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    )
                  ),
                  Expanded(
                    flex:2,
                    child:IconButton(
                      icon:Icon(Icons.delete),
                      onPressed: (){
                        setState((){
                          _mymodel.remove(tme);
                          // Utils.showAlert(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}