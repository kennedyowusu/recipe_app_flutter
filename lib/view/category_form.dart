import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/category_controller.dart';
import 'package:recipe_app/widgets/profile_appbar.dart';

class CategoryForm extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  CategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        title: "Add New Category",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: categoryController.cateNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusColor: Colors.greenAccent,
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                hintText: 'Enter Category Name',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => categoryController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: ProjectColors.primaryColorDark,
                    )
                  : GestureDetector(
                      onTap: () {
                        categoryController.isLoading(true);
                        categoryController.createCategory(
                          categoryController.cateNameController.text,
                        );
                        categoryController.isLoading(false);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ProjectColors.primaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Add Category",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => categoryController.categories.isEmpty
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRouteName.addRecipe);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ProjectColors.primaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Add Recipe",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
