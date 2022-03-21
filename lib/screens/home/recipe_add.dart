import 'package:asad_crew/models/recipe.dart';
import 'package:asad_crew/services/auth.dart';
import 'package:asad_crew/services/recipe.dart';
import 'package:asad_crew/util/constants.dart';
import 'package:asad_crew/util/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRecipe extends StatefulWidget {
  AddRecipe();
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  //This key is used to ID the form
  //Associate our form with this global (form state) key
  final _formKey = GlobalKey<FormState>();
  //Bool for tracking loading state
  bool loading = false;
  //Define service instance for Auth
  final RecipeService _recipeService = RecipeService();

  // Text field state
  String recipe_name = "";
  String recipe_difficulty = "0";
  String recipe_servings = "0";
  String recipe_ingredients = "";
  String recipe_instructions = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    //To be able to add app bar at the top
    //If loading is true then show loading widget, otherwise show the form
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            backgroundColor: Colors.grey[400],
            //Removes drop shadow
            elevation: 0.0,
            title: Text('Sign in to Asad Crew')),
        resizeToAvoidBottomInset: false, // set it to false
        body: SingleChildScrollView(
            child: Container(
                //Padding for the container - symmetric is top and bottom are the same, left and right are the same
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        //Decorate the text form with hints and focus styling
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Recipe name'),
                        validator: (value) =>
                            value!.isEmpty ? "Enter a recipe name" : null,
                        onChanged: (value) => {
                          setState(
                            () => recipe_name = value,
                          )
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        //Decorate the text form with hints and focus styling
                        decoration: textInputDecoration.copyWith(
                            hintText:
                                'recipe difficulty'), //password so will not show
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) => {
                          setState(
                            () => recipe_difficulty = value,
                          )
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        //Decorate the text form with hints and focus styling
                        decoration: textInputDecoration.copyWith(
                            hintText:
                                'recipe servings'), //password so will not show
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) => {
                          setState(
                            () => recipe_servings = value,
                          )
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        //Decorate the text form with hints and focus styling
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Recipe ingredients'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (value) =>
                            value!.isEmpty ? "Enter ingredients" : null,
                        onChanged: (value) => {
                          setState(
                            () => recipe_ingredients = value,
                          )
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        //Decorate the text form with hints and focus styling
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Recipe instructions'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (value) =>
                            value!.isEmpty ? "Enter instructions" : null,
                        onChanged: (value) => {
                          setState(
                            () => recipe_instructions = value,
                          )
                        },
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            //Only if validate returns null from validators in form will this be valid
                            if (_formKey.currentState!.validate()) {
                              //not sure if null or user so dynamic
                              Recipe recipe = Recipe(
                                  null,
                                  recipe_name,
                                  int.parse(recipe_difficulty),
                                  int.parse(recipe_servings),
                                  recipe_ingredients,
                                  recipe_instructions);
                              dynamic result =
                                  await _recipeService.addRecipe(recipe);
                              if (result == null) {
                                setState(() => {
                                      //Set state error message
                                      error = "invalid user credentials",
                                      //Set loading state to false
                                      loading = false
                                    });
                              } else {
                                print(result);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink[400]),
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          )),
                      Text(error,
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 14.0))
                    ],
                  ),
                ))));
  }
}
