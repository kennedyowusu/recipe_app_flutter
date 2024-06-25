import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/category_controller.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/category_model.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final CategoryController categoryController = Get.put(CategoryController());
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: ProjectColors.primaryColorDark,
            ),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            final CategoryModel category = categoryController.categories[index];

            return GestureDetector(
              onTap: () {
                categoryController.setSelectedCate(index);
                recipeController.fetchRecipesByCategory(category.id!);
              },
              child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: categoryController.selectedCate.value == index
                          ? ProjectColors.primaryColor
                          : null,
                    ),
                    child: Center(
                        child: Text(
                      category.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: categoryController.selectedCate.value == index
                            ? Colors.white
                            : ProjectColors.primaryColor,
                      ),
                    )),
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
        );
      }),
    );
  }
}
