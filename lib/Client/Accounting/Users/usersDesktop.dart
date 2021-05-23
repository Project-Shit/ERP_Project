// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersDesktop extends StatefulWidget {
  @override
  _UsersDesktopState createState() => _UsersDesktopState();
}

class _UsersDesktopState extends State<UsersDesktop> {
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation;

  Widget dropList(List<String> list, String selected, double w) {
    return Container(
      width: w,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          filled: true,
          fillColor: SecondaryColor,
        ),
        value: selected,
        onChanged: (newValue) {
          setState(() {
            selected = newValue;
          });
        },
        items: list.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    border: Border.all(
                      color: TextColor,
                      width: 2,
                    )),
                width: width * 0.6,
                height: 900,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70,right: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.5,
                        child: TextFormField(
                          style: TextStyle(
                            color: TextColor,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            fillColor: SecondaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                new Radius.circular(
                                  10.0,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                new Radius.circular(
                                  10.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('ID'),
                              SizedBox(height: 40,),
                              labelText('Name'),
                              SizedBox(height: 40,),
                              labelText('Phone'),
                              SizedBox(height: 40,),
                              labelText('Email'),
                              SizedBox(height: 40,),
                              labelText('Password'),
                              SizedBox(height: 40,),
                              labelText('Address'),
                              SizedBox(height: 40,),
                              labelText('Department'),
                              SizedBox(height: 40,),
                              labelText('User Type'),
                            ],
                          ),
                          SizedBox(width: width * 0.04,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                              SizedBox(height: 20,),
                              dropList(_locations, _selectedLocation,width * 0.34),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          actionButtons('Apply',(){},Colors.green),
                          SizedBox(width: 80,),
                          actionButtons('Delete',(){},Colors.red.shade900),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
