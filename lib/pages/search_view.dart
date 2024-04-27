import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_search_assignment/pages/result_view.dart';
import 'package:image_search_assignment/utils/colors.dart';
import 'package:image_search_assignment/widgets/AppButton.dart';
import 'package:image_search_assignment/widgets/AppInputField.dart';

class SearchView extends StatelessWidget {
  TextEditingController inputText = TextEditingController();
  SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Search ",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: AppColors.darkBlue,
      ),
      backgroundColor: AppColors.blue,
      body: Container(
        margin: const EdgeInsets.all(15),
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Find Your Desier Image Here \n Just type and search",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.w700),
            ),
            AppInputField(
              textController: inputText,
            ),
            AppButton(
              text: "Search",
              size: 18,
              func: () {
                if (!inputText.text.isEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultView(searchTerm: inputText.text);
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Image Name'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
