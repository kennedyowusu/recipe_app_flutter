import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/model/category_model.dart';
import 'package:recipe_app/services/category_service.dart';

class CategoryController extends GetxController {
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt selectedCate = 0.obs;

  final TextEditingController cateNameController = TextEditingController();
  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final categoryService = CategoryService();
      final CategoryResponseModel categoryResponseModel =
          await categoryService.fetchCategories(token);
      categories.assignAll(categoryResponseModel.categories ?? []);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCate(int index) {
    selectedCate.value = index;
  }

  void createCategory(String name) async {
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final categoryService = CategoryService();
      final CategoryModel categoryModel =
          await categoryService.createCategory(token, name);
      categories.add(categoryModel);
      cateNameController.clear();
      Get.back();
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
