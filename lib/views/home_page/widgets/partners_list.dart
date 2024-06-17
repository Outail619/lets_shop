import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_styles.dart';

class PartnerList extends StatefulWidget {
  final void Function(String) filterPartner;
  final List<String> partners;
  const PartnerList(
      {super.key, required this.filterPartner, required this.partners});

  @override
  State<StatefulWidget> createState() => PartnerListState();
}

class PartnerListState extends State<PartnerList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: widget.partners.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabAlignment: TabAlignment.center,
      automaticIndicatorColorAdjustment: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: const Color.fromARGB(255, 241, 178, 151),
      isScrollable: true,
      onTap: (value) => widget.filterPartner(widget.partners[value]),
      tabs: widget.partners
          .map(
            (partner) => Tab(
              child: Text(
                partner,
                style: AppStyles.title14,
              ),
            ),
          )
          .toList(),
    );
  }
}
