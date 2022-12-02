import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

usdrateshimmer(){
  return SafeArea(
    child: Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.black45,
      highlightColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, 
                itemCount: 162,
                itemBuilder: (context,index){
                  return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.black45,
                  ),
                    title:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.black45
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 70,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.black45
                          ),
                        ),
                      ],
                    ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    )
    );
}