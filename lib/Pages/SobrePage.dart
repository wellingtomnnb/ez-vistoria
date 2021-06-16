import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Login"),
    ),
    body: Padding(padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
            children: [
              Container(
                width: 140,
                height: 140,
                child: Icon(
                  Icons.home_work,
                  color: Colors.white,
                  size: 94.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 241, 109, 80),),
              ),

              Padding(padding: EdgeInsets.all(10),
                  child: Text('Ez Vistorias', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
              ),
              Padding(padding: EdgeInsets.all(10),
                  child: Text('A solução completa para simplificar suas vistorias de imóveis', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
              ),
              Padding(padding: EdgeInsets.only(top: 150), child: Text('Desenvolvido por:', style: TextStyle(fontSize: 17))),

              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                          width: 20,
                          height: 20,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://scontent.fvix12-1.fna.fbcdn.net/v/t1.18169-9/15337666_1236035276462738_7325961080853360953_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=dbeb18&_nc_ohc=eca5rDnS7NUAX_bUMxI&_nc_ht=scontent.fvix12-1.fna&oh=3fa47831c7d0842acd9d8cc160e70081&oe=60CD3749'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                          child: Text('Deivid G. Matos', style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQHOZHA_USpAvA/profile-displayphoto-shrink_800_800/0/1574985395625?e=1629331200&v=beta&t=NG64Fi2pCX0fjYCxA2hloRLqNva44NdmsqtznE9HHFw'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                          child: Text('Leone S. Ramos', style: TextStyle(fontSize: 15)),
                        ),
                      ]

                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                          width: 20,
                          height: 20,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://scontent.fvix12-1.fna.fbcdn.net/v/t31.18172-8/18209089_1359129717504020_5784873738359071191_o.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=uAzruRD06mIAX9Po6yH&_nc_ht=scontent.fvix12-1.fna&oh=3645557b77f81a5d613e77fb936bb3cd&oe=60ED0FC6'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                          child: Text('Wilderson Rosa', style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQEBJlSF7qmI_Q/profile-displayphoto-shrink_800_800/0/1578325372318?e=1629331200&v=beta&t=4QZzM6AOG7UivUlRvfScKVJP-hAgbPpRP1j5i91fcdA'),
                                ),
                                onTap: () async {
                                  await launch('https://www.linkedin.com/in/wellingtomnnb/');
                              },


                        )),
                        GestureDetector(
                            onTap: () async {
                              await launch('https://www.linkedin.com/in/wellingtomnnb/');
                            },
                            child: Padding(padding: EdgeInsets.all(10),
                                  child: Text('Wellington N. Braga', style: TextStyle(fontSize: 15)),
                        ))
                      ]

                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 10), child: Text('UCL 2021/1', style: TextStyle(fontSize: 17))),

            ])
      )
    )
    );
   }
}
