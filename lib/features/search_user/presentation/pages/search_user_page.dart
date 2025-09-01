import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/widgets/listfm_text_field.dart';
import 'package:list_fm/features/search_user/presentation/stores/search_user_state.dart';
import 'package:list_fm/features/search_user/presentation/stores/search_user_store.dart';
import 'package:list_fm/features/search_user/presentation/widgets/home_app_bar.dart';
import 'package:list_fm/features/search_user/presentation/widgets/initial_display_widget.dart';
import 'package:list_fm/features/search_user/presentation/widgets/not_found_display_widget.dart';
import 'package:list_fm/features/search_user/presentation/widgets/user_card.dart';
import 'package:list_fm/injections.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key});

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final searchUserStore = getIt<SearchUserStore>();

  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Observer(
        builder: (context) {
          final state = searchUserStore.state;
          log(state.toString());

          if (state is SearchUserFailureState) {
            return Center(
              child: Text("Erro: ${state.error?.response?.data['message']} / ${state.error?.response?.data['error']}"),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  thickness: 0.1,
                  color: context.lightGreyColor,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 18, right: 18),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListFMTextField(
                        controller: searchController,
                        hintText: 'Digite o nome do usuário...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () async {
                            final searchText = searchController.value.text;
                            if (searchText.isEmpty) return;

                            await searchUserStore.fetchUser(searchText);
                            searchController.clear();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Ink(
                            height: 48,
                            decoration: BoxDecoration(
                              color: context.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: (state is SearchUserSuccessState && state.isLoadingMore)
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        color: context.onPrimaryColor,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Icon(
                                      Icons.search,
                                      color: context.onPrimaryColor,
                                      size: 32,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (state is SearchUserInitialState)
                state.searchNotFound
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: Scaffold.of(context).appBarMaxHeight!,
                          ),
                          child: NotFoundDisplayWidget(isCentered: true),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: Scaffold.of(context).appBarMaxHeight!,
                          ),
                          child: InitialDisplayWidget(),
                        ),
                      ),

              if (state is SearchUserSuccessState) ...[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 36,
                      bottom: 24,
                      left: 18,
                      right: 18,
                    ),
                    child: SizedBox(
                      child: ListView.separated(
                        clipBehavior: Clip.hardEdge,
                        itemCount: state.users!.length + (state.searchNotFound ? 1 : 0) + (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < state.users!.length) {
                            final user = state.users![index];
                            return UserCard(
                              name: user.name,
                              imageUrl: user.imageUrl,
                              registeredDate: user.memberSince,
                              onPressed: () {},
                            );
                          }

                          final extraIndex = index - state.users!.length;

                          if (state.searchNotFound && extraIndex == 0) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 24,
                                ),
                                child: NotFoundDisplayWidget(isCentered: false),
                              ),
                            );
                          }

                          if (state.isLoadingMore && extraIndex == (state.searchNotFound ? 1 : 0)) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 18),
                                child: CircularProgressIndicator(
                                  color: context.secondaryColor,
                                ),
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 21),
                      ),
                    ),
                  ),
                ),
              ],

              if (state is SearchUserLoadingState)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 36,
                      bottom: Scaffold.of(context).appBarMaxHeight!,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.secondaryColor,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
