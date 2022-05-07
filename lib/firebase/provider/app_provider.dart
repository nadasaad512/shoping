import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_store/firebase/data/auth_fire.dart';
import 'package:shopping_store/firebase/data/firestore_helper.dart';
import 'package:shopping_store/firebase/modules/gd_user.dart';
import 'package:shopping_store/firebase/modules/product_model.dart';
import 'package:shopping_store/test/add_product.dart';
import 'package:shopping_store/ui/screens/mainScreen.dart';
import 'package:shopping_store/ui/screens/widgt/ExplorScreen/Gadgets/Gadgetsscreen.dart';
import 'package:shopping_store/ui/screens/widgt/ExplorScreen/explorscreen.dart';
import 'package:shopping_store/ui/screens/widgt/favirate.dart';
import 'package:shopping_store/ui/welcom/logain.dart';
import 'package:shopping_store/ui/welcom/sign.dart';
import '../../router_helper.dart';

class AppProvider extends ChangeNotifier {



  AppProvider() {
    getAllProducts();
    getAllCarts();
    getAllCash();

  }
  GdUser loggedUser;
  bool emailpasserror=false;
  bool forgeterror=false;
  bool card=false;
  bool isfav=true;
  File file;
  String imageUrl;
  List<Product> allProducts;
  List<Product> allCart;
  List<Product> allCash;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  ImageSource imageSource;

  register(GdUser gdUser) async {
    try {
      String userId = await AuthHelper.authHelper.createNewAccount(gdUser.email, gdUser.password);
      gdUser.id = userId;
      await FirestoreHelper.firestoreHelper.createUserInFs(gdUser);
      this.loggedUser = gdUser;
      RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
      this.nameController=SignUpScreen().nameController;

    } on Exception catch (e) {
      // TODO
    }
  }
  getUserFromFirebase() async {
    try{
      String userId = FirebaseAuth.instance.currentUser.uid;
      this.loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
      emailpasserror=false;
      notifyListeners();
    }on Exception catch (e) {
      emailpasserror=true;
      notifyListeners();
    }
  }
  login(String email, String password) async {

    try {
      UserCredential userCredential = await AuthHelper.authHelper.signIn(email, password);
      await getUserFromFirebase();
      RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
      this.emailController.text=email;
      emailpasserror=false;
      notifyListeners();
    } on Exception catch (e) {
      //emailpasserror=true;
      notifyListeners();
    }
  }

  name(String naaame){
    this.nameController.text=naaame;
    notifyListeners();
    print(";lkjf");
  }
  selectSource(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Selecr the image source',
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    this.imageSource = ImageSource.camera;
                    pickNewImage();
                    Navigator.pop(context);
                  },
                  child: Text('Camera')),
              TextButton(
                  onPressed: () {
                    this.imageSource = ImageSource.gallery;
                    pickNewImage();
                    Navigator.pop(context);
                  },
                  child: Text('Gallery')),
            ],
          );
        });
  }
  pickNewImage() async {
    XFile xFile = await ImagePicker().pickImage(source: this.imageSource);
    this.file = File(xFile.path);
    notifyListeners();

  }
  pickNewImage1() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  forgetPassword(String email) async {
    try{
      AuthHelper.authHelper.forgetPassword(email);
    } on Exception catch (e){

      forgeterror=true;
      notifyListeners();
    }

  }




  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //    final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
  //   final credential =await GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken,);
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   notifyListeners();
  // }
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }



  logOut() async {
    this.loggedUser = null;
    await AuthHelper.authHelper.logout();

  RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
  }
  addProduct() async {
    String imageUrl = await FirestoreHelper.firestoreHelper.uploadImage(this.file);



    Product product = Product(
        name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text)
    );
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);

    await getAllProducts();
    RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(GadgetsScreen());
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    imageUrl=null;
    notifyListeners();
   // Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context).pop();
  }
  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
  }



  editProduct(String productiD) async {

    if (file != null) {
      this.imageUrl = await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Product product = Product(
        id: productiD,
        name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.editProduct(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }


  goToEditProduct(Product product) {
    this.file = null;
    this.imageUrl = product.imageUrl;
    this.nameController.text = product.name;
    this.descriptionController.text = product.description;
    this.priceController.text = product.price.toString();

    notifyListeners();

    RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(AddNewProduct(isForEdit: true, productId: product.id,));
  }

  goToCart(Product product) async{

    this.nameController.text = product.name;
    this.descriptionController.text = product.description;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    this.isfav = product.iscard;

    await FirestoreHelper.firestoreHelper.addProductToCart(product);

    await getAllCarts();
    notifyListeners();

     RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(AddNewProduct(isForEdit: true, productId: product.id,));

  }
  getAllCarts() async {
    this.allCart = await FirestoreHelper.firestoreHelper.getAllCarts();
    notifyListeners();
    if(this.allCart!=null){
      print("done");
    }

  }
  cardProduct(String productiD) async {

    if (file != null) {
      this.imageUrl = await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Product product = Product(
        id: productiD,
        name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addProductToCart(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }
  deleteCart(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteCart(productiD);
    getAllCarts();
  }
  getAllCash() async {
    this.allCash = await FirestoreHelper.firestoreHelper.getAllCash();
    notifyListeners();
    if(this.allCart!=null){
      print("done");
    }

  }
  goToCash(Product product) async{

    this.nameController.text = product.name;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    await FirestoreHelper.firestoreHelper.addProductTocash(product);
    await getAllCash();
    notifyListeners();
     //RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(AddNewProduct(isForEdit: true, productId: product.id,));

  }
  cashProduct(String productiD) async {

    if (file != null) {
      this.imageUrl = await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Product product = Product(
        id: productiD,
        name: nameController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addProductTocash(product);
    getAllCash();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }
  deleteCash(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteCash(productiD);
    getAllCash();
  }
  deleteProduct(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteProruct(productiD);
    getAllProducts();
  }
}
