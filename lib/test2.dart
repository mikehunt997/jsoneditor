import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F0), // Light pink background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top navigation bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const BackButton(),
                  const SizedBox(width: 16),
                  const Text('数据统计', style: TextStyle(fontSize: 18)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Tab bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildTab('总览', isSelected: true),
                  _buildTab('流量'),
                  _buildTab('转化'),
                  _buildTab('套餐'),
                  _buildTab('员工'),
                ],
              ),
            ),

            // Date range
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '所有时间: 2023-04-16至2024-04-16',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ),

            // Statistics sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      '流量统计',
                      [
                        ['2', '总有效来源数'],
                        ['2', '有效转化来源'],
                        ['2', '来访客户'],
                        ['100', '转转转转来源'],
                        ['1000', '转转转转来源'],
                        ['10000', '转转'],
                        ['2000', '总转转'],
                        ['2000', '浏览转'],
                        ['200', '分享转'],
                      ],
                    ),
                    _buildSection(
                      '转化统计',
                      [
                        ['2', '总有效来源'],
                        ['2', '总转化来源'],
                        ['2%', '转化率'],
                        ['100', '转转转转来源'],
                        ['1000', '已转转转来源'],
                        ['10%', '转转率'],
                        ['2000', '总转转来源'],
                        ['20%', '转化率'],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<List<String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          children: items.map((item) => _buildStatItem(item[0], item[1])).toList(),
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}