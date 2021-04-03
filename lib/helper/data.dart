import 'package:livingmaples_news/models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();


  //General
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General" ;
  categoryModel.imageUrl = "https://pittnews.com/wp-content/uploads/2020/01/O_Politic-900x600.jpg";
  category.add(categoryModel);


  //Health
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health" ;
  categoryModel.imageUrl = "https://www.expatica.com/app/uploads/sites/3/2019/11/Health-Insurance-Quotes-1920x1080.jpg" ;
  category.add(categoryModel);

  //Business
   categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business" ;
  categoryModel.imageUrl = "http://labizagent.com/wp-content/uploads/2020/04/cropped-libaze-agent-logo.png" ;
  category.add(categoryModel);

  //Sports
   categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports" ;
  categoryModel.imageUrl = "https://www.namedsport.com/en/pub/media/wysiwyg/namedsport/SPORT_SQUADRA_mobile.jpg" ;
  category.add(categoryModel);

  //Technology
   categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology" ;
  categoryModel.imageUrl = "https://www.universal-rights.org/wp-content/uploads/2019/09/30212411048_2a1d7200e2_z-1.jpg" ;
  category.add(categoryModel);


return category;
}
