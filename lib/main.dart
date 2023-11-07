import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seensolutionshomepage/constants.dart';

import 'myCustom_Circular_Notched_Rectangle.dart';

List<Customer> list=[Customer(name: 'احمد يونس', avatar: Constants.ahmedYonisPng),Customer(name: 'محمد محمود', avatar: Constants.mohamedMahmoudPng),Customer(name: 'سارة علي ', avatar: Constants.saraAliPng),];
List<Product> productList=[Product(name: 'اسم الكتالوج', avatar: Constants.catalog1),Product(name: 'اسم الكتالوج', avatar: Constants.catalog2),Product(name: 'اسم الكتالوج ', avatar: Constants.catalog3),Product(name: 'اسم الكتالوج ', avatar: Constants.catalog4),];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kBackgroundColor,
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //floating action button position to center
      bottomNavigationBar: buildBottomAppBar(),
      body:  buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return  const SingleChildScrollView(
      child:  Column(
        children: [
          GraphWidget(),
          TwoCardsWidget(),
          CustomersWidget(),
          ProductsWidget(),

        ],
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      height: 80,
      //bottom navigation bar on scaffold
      color: const Color(0xff111b49),
      shape:  const CircularNotchedRectangle(), //shape of notch
      notchMargin: 12, //notch margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BottomAppBarSvgIcon(
            svgIcon: Constants.favSvg,
            label: 'الموارد البشرية',
            iconHeight: 25,
          ),
          const SizedBox(
            width: 120,
          ),
          BottomAppBarSvgIcon(
            svgIcon: Constants.salesSvg,
            label: 'المبيعات',
            iconHeight: 25,
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      //Floating action button on Scaffold
      backgroundColor: const Color(0xff3a56ca),
      onPressed: () {
        //code to execute on button press
      },
      child: SvgPicture.asset(
        Constants.floatingActionButtonSvg,
      ), //icon inside button
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: ColorHelper.kMainColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: SizedBox(
            width: 400,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    SvgPicture.asset(
                      Constants.drawer,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    const Column(
                      children: [
                        Text(
                          'مرحبا',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'احمد يونس ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Image.asset(Constants.png),

                    ),



                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class TwoCardsWidget extends StatelessWidget {
  const TwoCardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallCardWidget(  number: '1254', name: 'العمولة',),
          SmallCardWidget(  number: '1254', name: 'العهدة',),
        ],
      ),
    );
  }
}

class SmallCardWidget extends StatelessWidget {
  final String number;
  final String name;
  const SmallCardWidget({
    super.key, required this.number, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5),),color: Colors.white ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number,style: TextStyle(color: ColorHelper.kMainColor,fontWeight: FontWeight.bold),),
          Text(name),

        ],
      ),

      ),
    );
  }
}

class ProductsWidget extends StatelessWidget{
  const ProductsWidget({
    super.key,
  });

  @override

    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          color: Colors.white70,
          height: 200,
          width: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("المزيد",style: TextStyle(fontWeight: FontWeight.w300,color:ColorHelper.kMainColor,),),
                    Text("المنتجات",style: TextStyle(fontWeight: FontWeight.bold,color: ColorHelper.kMainColor)),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: productList.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (BuildContext context, int index) {
                      return buildProductCard(index, productList);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

  Widget buildProductCard(int index, List<Product> product) {
    return Container(
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12),),

      ),
      margin: const EdgeInsets.all(5),
      child:  Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const SizedBox(),
              // Name of person
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${product[index].name} '),
                        // Cost in USD in grey
                        Text('${index*1000} LE', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 40,
                      width: 60,
                      child: Image.asset(product[index].avatar,fit: BoxFit.contain,),
                    ),
                  ),
                ],
              ),
              // Profile avatar

            ],
          ),
          const SizedBox(height: 5,),
          const Divider(color: Colors.grey,),

        ],
      ),

    );
  }
  }

class Product {

  String name;
  String avatar;

  Product({required this.name,required this.avatar});
}


class GraphWidget extends StatelessWidget {
  const GraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400,
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height:100 ,width: 250,child: Image.asset(Constants.graphPng,fit: BoxFit.cover,),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:18.0),
                    child: Text('500,000',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
                  ),Padding(
                    padding: EdgeInsets.only(left:18.0),
                    child: Text('إجمالي التارجت',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Text('100,000 l.E',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),

            ],),



          ],
        ),
      ),
    );
  }
}

class CustomersWidget extends StatelessWidget {
  const CustomersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        color: Colors.white70,
        height: 200,
        width: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المزيد",style: TextStyle(fontWeight: FontWeight.w300,color:ColorHelper.kMainColor,),),
                  Text("العملاء",style: TextStyle(fontWeight: FontWeight.bold,color: ColorHelper.kMainColor)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: list.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, int index) {
                    return buildAvatarCard(index, list);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
Card buildCard() {
  return const Card(
    margin: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Date
        Text('2023-09-15'),

        // Name of person
        Column(
          children: [
            Text('John Doe'),
            // Cost in USD in grey
            Text('\$100', style: TextStyle(color: Colors.grey)),
          ],
        ),
        // Profile avatar
        Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: CircleAvatar(
            child: Text('A'),
          ),
        ),
      ],
    ),
  );
}
Container buildAvatarCard (int index,List<Customer> customer){

  return Container(
    decoration:  const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12),),

    ),
    margin: const EdgeInsets.all(5),
    child:  Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Date
            Text('${index+1} يونيو ',textDirection: TextDirection.rtl),
            // Name of person
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${customer[index].name} '),
                      // Cost in USD in grey
                      Text('${index*1000} LE', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                    height: 40,
                    width: 60,
                    child: Image.asset(customer[index].avatar,fit: BoxFit.contain,),
                  ),
                ),
              ],
            ),
            // Profile avatar

          ],
        ),
        const SizedBox(height: 5,),
        const Divider(color: Colors.grey,),

      ],
    ),

  );
}
class Customer {
  final String name;
  final String avatar;
  const Customer({required this.name,required this.avatar,});
}

class BottomAppBarSvgIcon extends StatelessWidget {
  final String svgIcon;
  final String label;
  final double iconHeight;
  const BottomAppBarSvgIcon({
    super.key,
    required this.svgIcon,
    required this.label,
    required this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        height: 80,
        width: 120,
        child: Column(
          children: [
            SvgPicture.asset(
              svgIcon,
              height: iconHeight,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
