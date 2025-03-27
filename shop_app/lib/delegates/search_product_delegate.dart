import 'package:flutter/material.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/widgets/atoms/product/product_list_data.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
       onPressed: () => this.query = '',
       icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => this.close(context, null),
        icon: const Icon(Icons.arrow_back_ios)
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if ( query.trim().length == 0 ) {
      return const Center(
        child: Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Resultados'),
            subtitle:
            Text('Por el momento no hay resultados...'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      );
    }

    return FutureBuilder<List<ProductEntity>>(
        future: ProductController().filterProduct(this.query),
        initialData: [],
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final transactions = (snapshot.data ?? [])
                .toList()
                .map<ProductListDataWidget>((t) => ProductListDataWidget(
              id: t.id.toString(),
              date: t.date.toString(),
              amount: t.amount.toString(),
              currency: "${t.price}",
              concept: t.name.toString(),
            ));
            return SingleChildScrollView(
              child: Column(
                children: transactions.toList(),
              ),
            );
          }
          return Container(
            child: CircularProgressIndicator(value: 1,),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Card(
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text('Sugerencias'),
          subtitle:
          Text('Por el momento no hay sugerencia...'),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
        ),
      ),
    );
  }


  
}