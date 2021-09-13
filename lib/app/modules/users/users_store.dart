import 'package:graphql/client.dart' as GraphQL;
import 'package:mobx/mobx.dart';
import 'package:search_gitgraphql/app/models/user.dart';
import 'package:search_gitgraphql/app/network/graph_ql_client.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStoreBase with _$UsersStore;
abstract class _UsersStoreBase with Store {

  late GraphQL.GraphQLClient _client;

  late ObservableList<User> ?users = ObservableList<User>();

  late GraphQL.QueryResult _result;

  late String searchString;

  _UsersStoreBase() {
    this._client = GraphQl().getClient();
  }

  final String readUser = """
    query ReadUser(\$user: String) {
      user: user(login: \$user) {
        starredRepositories(first: 10) {
          totalCount
        }
        avatarUrl
        bio
        email
        url
        login
        name
        location
      }
    }
  """;

  GraphQL.FetchMoreOptions getFetchMoreOptions() {
    return GraphQL.FetchMoreOptions(
        updateQuery: (previousResultData, fetchMoreResultData) {
          final List<dynamic> users = [
            ...previousResultData?['search']['edges'] as List<dynamic>,
            ...fetchMoreResultData?['search']['edges'] as List<dynamic>
          ];
          fetchMoreResultData?['search']['edges'] = users;

          return fetchMoreResultData;
        },
    );
  }

  GraphQL.QueryOptions getQueryOptions(String value) {
    return GraphQL.QueryOptions(
      document: GraphQL.gql(
        r'''
            query ReadUser($queryString: String!) {
                search(query: $queryString, first: 20, type: USER) {
                edges {
                  node {
                    ... on User {
                        avatarUrl
                        bio
                        email
                        url
                        login
                        name
                        location
                        starredRepositories(first: 10) {
                          totalCount
                        }
                    }
                  }
                }
              }
            }
        ''',
      ),
      variables: {
        'queryString': value,
      },
    );
  }

  @action
  Future fetchUsers(String value) async {
    users?.clear();
    searchString = value;

    GraphQL.QueryResult result = await _client.query(getQueryOptions(value));

    this._result = result;

    result.data!['search']['edges'].forEach((user) {
      users!.add(User.toObject(user['node']));
    });
  }

   @action
  Future fetchMoreUsers() async {

    GraphQL.QueryResult result = await  _client.fetchMore(getFetchMoreOptions(), originalOptions: getQueryOptions(searchString), previousResult: _result);

    result.data!['search']['edges'].forEach((user) {
      users!.add(User.toObject(user['node']));
    });
  }
}
