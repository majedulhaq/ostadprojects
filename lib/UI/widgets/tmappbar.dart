import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/Screens/loginpage.dart';
import 'package:ostadprojects/UI/Utils/app_assets.dart';
import 'package:ostadprojects/UI/Utils/app_colors.dart';

class TmAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TmAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: CircleAvatar(
                  // backgroundColor: Colors.red,
                  backgroundImage: AssetImage(Assets.myphoto),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Majedul Haq',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                       
                  Text('Sylhet, Bangladesh',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
