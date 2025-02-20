import 'package:flutter/material.dart';

class DataStatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据统计'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildTabBar(),
            SizedBox(height: 16.0),
            _buildStatisticsCard('流量统计', [
              ['2', '发布卡券活动'],
              ['2', '发布大转盘活动'],
              ['2', '发布直播'],
              ['100', '转发数'],
              ['1000', '转发领取'],
              ['10000', '播放数'],
              ['2000', '点赞数'],
              ['200', '评论数'],
              ['200', '分享数'],
            ]),
            SizedBox(height: 16.0),
            _buildStatisticsCard('转化统计', [
              ['2', '发布卡券'],
              ['2', '领取优惠券'],
              ['2%', '领取率'],
              ['100', '转发领取'],
              ['100%', '已领取率'],
              ['10%', '使用率'],
              ['2000', '延期数'],
              ['20%', '作废率'],
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('总览',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        Text('流量'),
        Text('转化'),
        Text('套餐'),
        Text('员工'),
      ],
    );
  }

  Widget _buildStatisticsCard(String title, List<List<String>> data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[index][0],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data[index][1]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
