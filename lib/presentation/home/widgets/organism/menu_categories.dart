import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/category/category_bloc.dart';
import '../category_button.dart';

class MenuCategories extends StatefulWidget {
  const MenuCategories({super.key});

  @override
  State<MenuCategories> createState() => _MenuCategoriesState();
}

class _MenuCategoriesState extends State<MenuCategories> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(const CategoryEvent.getCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...categories.map((category) => Flexible(
                    child: CategoryButton(
                      imagePath:
                          '${Variables.imageUrl}/categories/${category.image!}',
                      label: category.name!,
                      onPressed: () {},
                    ),
                  ))
            ],
          ),
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        );

        // return Row(
        //   children: [
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuBestseller.path,
        //         label: 'Bestseller',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuFlashsale.path,
        //         label: 'Flashsale',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuToprated.path,
        //         label: 'Toprated',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuMore.path,
        //         label: 'More',
        //         onPressed: () {},
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
