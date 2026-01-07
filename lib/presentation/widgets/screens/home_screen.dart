import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Logo Placeholder
            Icon(Icons.school, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text(
              'SkillUp Libya',
              style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Search Bar
            _buildSearchBar(),
            const SizedBox(height: 20),

            // 2. Hero Section / Banner
            _buildPromoBanner(),
            const SizedBox(height: 25),

            // 3. Section Title
            _buildSectionHeader(title: 'المسارات الشائعة', onSeeAll: () {}), // Trending Paths
            const SizedBox(height: 10),
            
            // 4. Categories (Tech, Business, Data...)
            _buildCategoriesList(),
            const SizedBox(height: 25),

            // 5. Popular Courses Section
            _buildSectionHeader(title: 'أحدث الدورات', onSeeAll: () {}),
            const SizedBox(height: 10),
            _buildCourseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'ماذا تريد أن تتعلم اليوم؟', // "What do you want to learn today?"
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF673AB7), Color(0xFF512DA8)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 30,
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طور مهاراتك للمستقبل',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'دورات معتمدة من شركات عالمية مثل IBM و Microsoft',
                    style: GoogleFonts.cairo(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -10,
            bottom: -10,
            child: Icon(
              Icons.computer,
              size: 100,
              color: Colors.white.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onSeeAll,
          child: const Text('عرض الكل'),
        ),
      ],
    );
  }

  Widget _buildCategoriesList() {
    final categories = ['الذكاء الاصطناعي', 'علوم البيانات', 'الأمن السيبراني', 'الحوسبة السحابية'];
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Chip(
            label: Text(categories[index]),
            backgroundColor: index == 0 ? const Color(0xFF673AB7) : Colors.white,
            labelStyle: TextStyle(color: index == 0 ? Colors.white : Colors.black),
            side: const BorderSide(color: Colors.grey, width: 0.5),
          );
        },
      ),
    );
  }

  Widget _buildCourseList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _CourseCard(index: index);
      },
    );
  }
}

class _CourseCard extends StatelessWidget {
  final int index;
  const _CourseCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), // Adjusted for RTL
                bottomRight: Radius.circular(12),
              ),
              image: const DecorationImage(
                // Placeholder Image
                image: NetworkImage('https://placehold.co/100x100/png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'دورة الذكاء الاصطناعي للمبتدئين', // "AI for beginners"
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  const Text('مقدم من: IBM', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' 4.8 ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      Spacer(),
                      Text('مجاني', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}