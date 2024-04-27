import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search_assignment/api_provider/pixabay_api.dart';
import 'package:image_search_assignment/pages/search_view.dart';
import 'package:image_search_assignment/utils/colors.dart';

class ResultView extends StatefulWidget {
  final String searchTerm;
  const ResultView({Key? key, required this.searchTerm}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  late List<dynamic> _images = [];
  late int _currentIndex = 0;
  late Timer _timer;
  final api = api_provider();

  @override
  void initState() {
    super.initState();
    _fetchImages();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentIndex < _images.length - 1) {
          _currentIndex++;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _fetchImages() async {
    final Map imagesData = await api.getImagesFunc(widget.searchTerm);
    setState(() {
      _images = imagesData['hits'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchView()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            const Text(
              "Results Are ",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 75,
        backgroundColor: AppColors.darkBlue,
      ),
      backgroundColor: AppColors.blue,
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 0,
          top: 10,
          left: 15,
          right: 15,
        ),
        child: _images.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 208, 0),
                  strokeWidth: 3,
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: _currentIndex + 1,
                itemBuilder: (context, index) {
                  var src = _images[index % _images.length]['webformatURL'];
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkBlue,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        src,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
