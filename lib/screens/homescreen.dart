import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apicodes/model/detailsdata.dart';
import '../helperservices/helper.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Post>? posts;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Post? posts = await HelperService().getPosts();
    if (posts == null)
      setState(() {
        isloaded = false;
      });
    else {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("cccc"),
      ),
      body: Visibility(
        visible: isloaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) =>
                Text(posts![index].data!.toString())),
      ),
    ));
  }
}
