import 'package:graphql/client.dart';


class GraphQl {
  GraphQLClient getClient() {
    {
      final Link _link = HttpLink(
        'https://api.github.com/graphql',
        defaultHeaders: {
          'Authorization': 'Bearer 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',
        },
      );

      return GraphQLClient(
        /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(),
        link: _link,
      );
    }
  }

}
