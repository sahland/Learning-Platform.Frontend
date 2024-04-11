import 'package:flutter/material.dart';

import '../../base_container.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 75,
            backgroundColor: theme.primaryColor,
            bottom: PreferredSize(
              child: SearchButton(),
              preferredSize: const Size.fromHeight(60),),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return BaseContainer (
                        width: 80,
                        bordRadius: 6,
                        horIndent: 5,
                        vertIndent: 0,
                        color: Color(0xFF181818),
                        child: SizedBox(
                          child: Text('Tag',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      );
                    }

                ),
              )
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const KnitwitCoursesList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {},
      ),
    );
  }
}

class KnitwitCoursesList extends StatelessWidget {
  const KnitwitCoursesList({super.key});

  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final tags = List.generate(4, (index) => BaseContainer(
        width: 45,
        bordRadius: 100,
        horIndent: 0,
        vertIndent: 0,
        color: Color(0xFF404040),
        child: Center(
          child: Text(
            'Tag',
            style: TextStyle(
                color: Color(0xFFA4ACC3),
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500
            ),
          ),
        )
    ));
    return BaseContainer(
        color: theme.primaryColor,
        width: double.infinity,
        horIndent: 0,
        vertIndent: 0,
        bordRadius: 8,
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 64,
              height: 64,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/64x64"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  'Test text.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  children: tags.map((e) => Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: e,
                  )).toList(),
                )
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_sharp))
          ],
        )
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity,
        margin:
        EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFF32363F),
            borderRadius: BorderRadius.circular(118)
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Color(0xFFECECEC),
            ),
            SizedBox(width: 10),
            Text('Поиск...',
              style: TextStyle(
                  color: Color(0xFFA4ACC3),
                  fontSize: 20
              ),
            ),
          ],
        )
    );
  }
}