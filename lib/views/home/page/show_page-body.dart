import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/controller/exhibitions_controller.dart';
import 'package:museum_resource_center/models/exhibitions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/views/show/show_events_output.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/dimensions.dart';
import '../../../widget/big-text-widget.dart';

class ShowPageBody extends StatefulWidget {
  const ShowPageBody({Key? key}) : super(key: key);

  @override
  _ShowPageBodyState createState() => _ShowPageBodyState();
}

class _ShowPageBodyState extends State<ShowPageBody> {
  ExhibitionsController exhibitionsController =
      Get.put(ExhibitionsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExhibitionsController>(
        init: ExhibitionsController(),
        builder: (evt) {
          if (evt.isDataLoading.value ||
              exhibitionsController.exhibitions == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: exhibitionsController.exhibitions!.length >= 10
                      ? 20
                      : exhibitionsController.exhibitions!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildShowItem(
                      exhibitionsController.exhibitions![index],
                    );
                  }));
        });
    ;
  }

  Widget _buildShowItem(ExhibitionsModel exhibitions) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowEventsOutput(
                      exhibitionsModel: exhibitions,
                    )));
      },
      child: Container(
        height: Dimensions.height220,
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              width: Dimensions.width172,
              height: Dimensions.height208,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Ima
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  // Image radius
                  child: Image.network(
                    exhibitions.img!,
                    fit: BoxFit.cover,
                    headers: const {
                      'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                    },
                    height: Dimensions.height158,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.8),
                        highlightColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: Dimensions.width152,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/picture.png');
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.height55,
                  width: Dimensions.width172 + 5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius10),
                        topRight: Radius.circular(Dimensions.radius10),
                        bottomRight: Radius.circular(Dimensions.radius10),
                        bottomLeft: Radius.circular(Dimensions.radius10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      exhibitions.name ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
