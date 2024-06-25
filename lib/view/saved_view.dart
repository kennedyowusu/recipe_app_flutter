import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/constants/images.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';

class SavedRecipeView extends StatelessWidget {
  SavedRecipeView({super.key});

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Get.offAllNamed(AppRouteName.entry);
          },
        ),
        title: const Text(
          "Saved Recipes",
          style: TextStyle(
            color: ProjectColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: ProjectColors.primaryColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  recipeController.savedRecipes.length.toString(),
                  style: const TextStyle(
                    color: ProjectColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            recipeController.savedRecipes.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            ProjectImages.empty,
                            height: 200,
                            width: 200,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "No saved recipes yet!",
                            style: TextStyle(
                              color: ProjectColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: recipeController.savedRecipes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final RecipeModel savedRecipe =
                          recipeController.savedRecipes[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: savedRecipe.image != null
                                    ? NetworkImage(savedRecipe.image!)
                                    : const AssetImage(
                                        ProjectImages.splash,
                                      ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        savedRecipe.name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        savedRecipe.cuisine!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    right: 10,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.watch,
                                          size: 16,
                                          color: CupertinoColors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${savedRecipe.cookTimeMinutes.toString()} Mins",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.white
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: IconButton(
                                            splashRadius: 10,
                                            color: ProjectColors.primaryColor,
                                            style: IconButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            onPressed: () {},
                                            icon: const Center(
                                              child: Icon(
                                                Icons.check_circle,
                                                color:
                                                    ProjectColors.primaryColor,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 1,
                                    right: 10,
                                    child: Container(
                                      height: 20,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: ProjectColors.primaryColorDark
                                            .withGreen(200),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 16,
                                            color:
                                                ProjectColors.primaryColorDark,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${savedRecipe.rating!.toInt()}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: CupertinoColors.white
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
