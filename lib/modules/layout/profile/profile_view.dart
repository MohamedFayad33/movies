import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/constant/constant/constant.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/presentation/manger/bloc/available_now_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int selectedAvatarIndex = 0;

  final List<String> images = [
    Assets.boyAvatar,
    Assets.womanAvatar,
    Assets.girlAvatar,
    Assets.manAvatar,
    Assets.avatar1,
    Assets.avatar2,
    Assets.avatar3,
    Assets.avatar4,
    Assets.avatar5,
    Assets.avatar6,
    Assets.avatar7,
    Assets.avatar8,
    Assets.avatar9,
  ];

  void _pickAvatar() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatarIndex = index;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedAvatarIndex == index
                          ? Colors.yellow
                          : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(images[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Pick Avatar",
          style: TextStyle(color: Color(0xFFF6BD00)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: InkWell(
                onTap: _pickAvatar,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(images[selectedAvatarIndex]),
                ),
              ),
            ),
            const SizedBox(height: 35),

            CustomTextFormField(
              prefixIcon: Icon(Icons.person),
              hintText: 'my name ',
            ),
            CustomTextFormField(
              prefixIcon: Icon(Icons.phone),
              hintText: 'my phone',
            ),

            const Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                height: 55.7,
                decoration: BoxDecoration(
                  color: const Color(0xFFE82626),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 19),
            InkWell(
              onTap: () {},
              child: Container(
                height: 55.7,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6BD00),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Update Data",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    List<MovieEntity> movies = context.read<AvailableNowBloc>().myMovies;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
        elevation: 0,
        toolbarHeight: 96,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.list, color: Colors.amber, size: 26),
                SizedBox(height: 4),
                Text(
                  "Watch List",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            SizedBox(width: 120),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.folder, color: Colors.amber, size: 26),
                SizedBox(height: 4),
                Text(
                  "History",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: 40,
                  child: Divider(thickness: 2, color: Colors.amber),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 14,
            childAspectRatio: 122 / 179.584,
          ),
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index], index: index);
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatefulWidget {
  final MovieEntity movie;
  final int index;

  const MovieCard({Key? key, required this.movie, required this.index})
    : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isHovered
                        ? Colors.amber.withOpacity(0.5)
                        : Colors.grey[800]!,
                    width: isHovered ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[900],
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.movie.imageUrl ?? Constant.ifImageNull,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder();
                      },
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 3.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "7.7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.star, color: Colors.amber, size: 11),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[800]!, Colors.grey[900]!],
        ),
      ),
      child: const Center(
        child: Icon(Icons.movie_outlined, size: 40, color: Colors.white54),
      ),
    );
  }
}
