import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/constants/images.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/details_sub.dart';
import 'package:recipe_app/widgets/divider.dart';
import 'package:recipe_app/widgets/profile_appbar.dart';
import 'package:recipe_app/widgets/save_delete_recipe.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.recipe});

  final RecipeModel recipe;
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Details",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: recipe.image != null
                        ? NetworkImage(recipe.image!)
                        : const AssetImage(
                            ProjectImages.splash,
                          ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
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
                              "${recipe.cookTimeMinutes.toString()} Mins",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SaveDeleteButton(recipe: recipe),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 1,
                        right: 10,
                        child: Container(
                          height: 20,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: ProjectColors.primaryColor.withGreen(200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: ProjectColors.primaryColorDark,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${recipe.rating!.toInt()}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white.withOpacity(0.7),
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
            const SizedBox(height: 10),
            Text(
              recipe.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
                fontSize: 17,
              ),
            ),
            Text(
              recipe.cuisine!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            detailsSub(),
            const SizedBox(height: 10),
            const ProjectDivider(),
            const Center(
              child: Text(
                "Ingredients",
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ProjectDivider(),
            const SizedBox(height: 15),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recipe.ingredients!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: CupertinoColors.systemGrey,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Icon(
                            FontAwesomeIcons.bowlFood,
                            color: ProjectColors.primaryColor.withOpacity(0.5),
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          recipe.ingredients![index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
