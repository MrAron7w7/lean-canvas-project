import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '/pages/home_page/home_page.dart';
import '../pages/profile_page/profile_page.dart';

class BottonNavbar extends StatefulWidget {
  const BottonNavbar({super.key});

  @override
  State<BottonNavbar> createState() => _BottonNavbarState();
}

class _BottonNavbarState extends State<BottonNavbar> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('Create page')),
    const ProfilePage(),
  ];

  // Al precionar el navbar se va a dirigir a la pagina
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _mainPage(),
      bottomNavigationBar: _mainBottonNavBar(context),
    );
  }

  // Controlador de cada pagina
  PageView _mainPage() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: _pages,
    );
  }

  // Boton navbar de cada item o pagina
  Widget _bottomNavBarItem(
    BuildContext context, {
    required defaultIcom,
    required int page,
    required String label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _currentIndex == page ? filledIcon : defaultIcom,
              color: _currentIndex == page
                  ? const Color(0xff274690)
                  : Colors.black,
              size: 26,
            ),
            const Gap(3),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: _currentIndex == page
                    ? const Color(0xff274690)
                    : Colors.black,
                fontSize: 13,
                fontWeight:
                    _currentIndex == page ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

// Boton navbar principal
  BottomAppBar _mainBottonNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          _bottomNavBarItem(
            context,
            defaultIcom: IconlyLight.home,
            page: 0,
            label: 'Home',
            filledIcon: IconlyBold.home,
          ),
          _bottomNavBarItem(
            context,
            defaultIcom: IconlyLight.plus,
            page: 1,
            label: 'Crear',
            filledIcon: IconlyBold.plus,
          ),
          _bottomNavBarItem(
            context,
            defaultIcom: IconlyLight.profile,
            page: 2,
            label: 'Perfil',
            filledIcon: IconlyBold.profile,
          ),
        ],
      ),
    );
  }
}
