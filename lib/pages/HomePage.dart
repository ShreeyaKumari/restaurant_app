import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/models.dart';
import 'package:restaurant_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'Tous';

  // Menu enrichi avec plus de plats et nouvelles catégories
  List<Dish> dishes = [
    // PIZZAS (7 types)
    Dish(
      name: 'Pizza Margherita',
      description: 'Tomates fraîches, mozzarella di bufala et basilic',
      price: 85.0,
      imageUrl: 'assets/images/pizza.jpg',
      category: 'Pizzas',
      likes: 15,
      dislikes: 2,
      comments: [
        Comment(author: 'Marie', text: 'Délicieuse et authentique!', date: DateTime.now()),
      ],
    ),
    Dish(
      name: 'Pizza Quatre Fromages',
      description: 'Mozzarella, gorgonzola, parmesan et chèvre',
      price: 95.0,
      imageUrl: 'assets/images/pizza_quatre_fromages.jpg',
      category: 'Pizzas',
      likes: 22,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Pizza Pepperoni',
      description: 'Pepperoni épicé et mozzarella fondante',
      price: 90.0,
      imageUrl: 'assets/images/pizza_pepperoni.jpg',
      category: 'Pizzas',
      likes: 18,
      dislikes: 3,
      comments: [],
    ),
    Dish(
      name: 'Pizza Végétarienne',
      description: 'Légumes grillés, champignons et olives',
      price: 88.0,
      imageUrl: 'assets/images/pizza_vegetarienne.jpg',
      category: 'Pizzas',
      likes: 12,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Pizza Fruits de Mer',
      description: 'Crevettes, moules et calamars',
      price: 120.0,
      imageUrl: 'assets/images/pizza_fruits_mer.jpg',
      category: 'Pizzas',
      likes: 25,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Pizza Orientale',
      description: 'Merguez, poivrons et harissa',
      price: 98.0,
      imageUrl: 'assets/images/pizza_orientale.jpg',
      category: 'Pizzas',
      likes: 20,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Pizza Royale',
      description: 'Jambon, champignons et œuf',
      price: 105.0,
      imageUrl: 'assets/images/pizza_royale.jpg',
      category: 'Pizzas',
      likes: 16,
      dislikes: 0,
      comments: [],
    ),

    // BURGERS (7 types)
    Dish(
      name: 'Burger Classique',
      description: 'Steak de bœuf, salade et tomate',
      price: 75.0,
      imageUrl: 'assets/images/burger.jpg',
      category: 'Burgers',
      likes: 22,
      dislikes: 3,
      comments: [
        Comment(author: 'Paul', text: 'Excellent burger!', date: DateTime.now()),
        Comment(author: 'Sophie', text: 'Très bon rapport qualité-prix', date: DateTime.now()),
      ],
    ),
    Dish(
      name: 'Burger Cheese',
      description: 'Double steak et double fromage',
      price: 85.0,
      imageUrl: 'assets/images/burger_cheese.jpg',
      category: 'Burgers',
      likes: 28,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Burger Chicken',
      description: 'Escalope de poulet grillée',
      price: 70.0,
      imageUrl: 'assets/images/burger_chicken.jpg',
      category: 'Burgers',
      likes: 19,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Burger Fish',
      description: 'Filet de poisson pané',
      price: 78.0,
      imageUrl: 'assets/images/burger_fish.jpg',
      category: 'Burgers',
      likes: 14,
      dislikes: 4,
      comments: [],
    ),
    Dish(
      name: 'Burger Végétarien',
      description: 'Steak végétal et avocat',
      price: 68.0,
      imageUrl: 'assets/images/burger_vegetarien.jpg',
      category: 'Burgers',
      likes: 11,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Burger BBQ',
      description: 'Steak de bœuf et sauce BBQ',
      price: 88.0,
      imageUrl: 'assets/images/burger_bbq.jpg',
      category: 'Burgers',
      likes: 24,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Burger Royal',
      description: 'Triple steak, fromage et bacon',
      price: 95.0,
      imageUrl: 'assets/images/burger_royal.jpg',
      category: 'Burgers',
      likes: 30,
      dislikes: 3,
      comments: [],
    ),

    // TAJINES (6 types)
    Dish(
      name: 'Tajine Poulet aux Olives',
      description: 'Poulet mijoté aux olives vertes',
      price: 110.0,
      imageUrl: 'assets/images/tajine_poulet_olives.jpg',
      category: 'Tajines',
      likes: 35,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Tajine Agneau aux Pruneaux',
      description: 'Agneau fondant aux pruneaux',
      price: 130.0,
      imageUrl: 'assets/images/tajine_agneau_pruneaux.jpg',
      category: 'Tajines',
      likes: 28,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Tajine Bœuf aux Légumes',
      description: 'Bœuf mijoté avec légumes',
      price: 120.0,
      imageUrl: 'assets/images/tajine_boeuf_legumes.jpg',
      category: 'Tajines',
      likes: 22,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Tajine Poisson aux Légumes',
      description: 'Poisson frais aux légumes',
      price: 125.0,
      imageUrl: 'assets/images/tajine_poisson.jpg',
      category: 'Tajines',
      likes: 18,
      dislikes: 3,
      comments: [],
    ),
    Dish(
      name: 'Tajine Kefta aux Œufs',
      description: 'Boulettes de viande aux œufs',
      price: 105.0,
      imageUrl: 'assets/images/tajine_kefta.jpg',
      category: 'Tajines',
      likes: 26,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Tajine Végétarien',
      description: 'Légumes de saison mijotés',
      price: 85.0,
      imageUrl: 'assets/images/tajine_vegetarien.jpg',
      category: 'Tajines',
      likes: 15,
      dislikes: 1,
      comments: [],
    ),

    // COUSCOUS (5 types)
    Dish(
      name: 'Couscous Royal',
      description: 'Agneau, poulet et merguez',
      price: 140.0,
      imageUrl: 'assets/images/couscous_royal.jpg',
      category: 'Couscous',
      likes: 42,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Couscous Agneau',
      description: 'Agneau tendre aux légumes',
      price: 125.0,
      imageUrl: 'assets/images/couscous_agneau.jpg',
      category: 'Couscous',
      likes: 31,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Couscous Poulet',
      description: 'Poulet fermier aux légumes',
      price: 115.0,
      imageUrl: 'assets/images/couscous_poulet.jpg',
      category: 'Couscous',
      likes: 28,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Couscous Végétarien',
      description: 'Légumes variés et pois chiches',
      price: 95.0,
      imageUrl: 'assets/images/couscous_vegetarien.jpg',
      category: 'Couscous',
      likes: 19,
      dislikes: 3,
      comments: [],
    ),


    // BOISSONS (8 types)
    Dish(
      name: 'Eau Minérale Sidi Ali',
      description: 'Eau minérale naturelle (50cl)',
      price: 12.0,
      imageUrl: 'assets/images/eau_sidi_ali.jpg',
      category: 'Boissons',
      likes: 8,
      dislikes: 0,
      comments: [],
    ),
    Dish(
      name: 'Coca-Cola',
      description: 'Boisson gazeuse (33cl)',
      price: 15.0,
      imageUrl: 'assets/images/coca_cola.jpg',
      category: 'Boissons',
      likes: 12,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Jus d\'Orange Frais',
      description: 'Jus d\'orange pressé (25cl)',
      price: 20.0,
      imageUrl: 'assets/images/jus_orange.jpg',
      category: 'Boissons',
      likes: 18,
      dislikes: 0,
      comments: [],
    ),
    Dish(
      name: 'Thé à la Menthe',
      description: 'Thé vert traditionnel',
      price: 18.0,
      imageUrl: 'assets/images/the_menthe.jpg',
      category: 'Boissons',
      likes: 25,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Café Espresso',
      description: 'Café espresso italien',
      price: 15.0,
      imageUrl: 'assets/images/cafe_espresso.jpg',
      category: 'Boissons',
      likes: 14,
      dislikes: 2,
      comments: [],
    ),
    Dish(
      name: 'Limonade Maison',
      description: 'Limonade artisanale',
      price: 22.0,
      imageUrl: 'assets/images/limonade.jpg',
      category: 'Boissons',
      likes: 16,
      dislikes: 0,
      comments: [],
    ),
    Dish(
      name: 'Smoothie Fruits Rouges',
      description: 'Mélange de fruits rouges (30cl)',
      price: 35.0,
      imageUrl: 'assets/images/smoothie_fruits_rouges.jpg',
      category: 'Boissons',
      likes: 21,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Lassi à la Mangue',
      description: 'Boisson au yaourt et mangue',
      price: 28.0,
      imageUrl: 'assets/images/lassi_mangue.jpg',
      category: 'Boissons',
      likes: 13,
      dislikes: 2,
      comments: [],
    ),

    // DESSERTS (3 types)
    Dish(
      name: 'Tiramisu',
      description: 'Dessert italien au café',
      price: 45.0,
      imageUrl: 'assets/images/tiramisu.jpg',
      category: 'Desserts',
      likes: 18,
      dislikes: 0,
      comments: [],
    ),
    Dish(
      name: 'Baklava',
      description: 'Pâtisserie orientale aux amandes',
      price: 35.0,
      imageUrl: 'assets/images/baklava.jpg',
      category: 'Desserts',
      likes: 22,
      dislikes: 1,
      comments: [],
    ),
    Dish(
      name: 'Crème Brûlée',
      description: 'Crème vanillée caramélisée',
      price: 40.0,
      imageUrl: 'assets/images/creme_brulee.jpg',
      category: 'Desserts',
      likes: 19,
      dislikes: 0,
      comments: [],
    ),
  ];

  List<String> categories = ['Tous', 'Vos plats préférés', 'Pizzas', 'Burgers', 'Tajines', 'Couscous', 'Boissons', 'Desserts'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Dish> getFilteredDishes() {
    if (selectedCategory == 'Tous') {
      return dishes;
    } else if (selectedCategory == 'Vos plats préférés') {
      List<Dish> likedDishes = dishes.where((dish) => dish.likes > 0).toList();
      likedDishes.sort((a, b) => b.likes.compareTo(a.likes));
      return likedDishes;
    }
    return dishes.where((dish) => dish.category == selectedCategory).toList();
  }

  void _showDishDetails(BuildContext context, Dish dish) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DishDetailsDialog(
          dish: dish,
          onLike: () => _onLike(dish),
          onDislike: () => _onDislike(dish),
          onAddComment: (comment) => _onAddComment(dish, comment),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Barre des catégories avec noms centrés (sans tabAlignment)
          Container(
            color: AppColors.darkgreen,
            child: SafeArea(
              child: Container(
                height: 60,
                width: double.infinity,
                child: Center(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: AppColors.textLight,
                    unselectedLabelColor: AppColors.textLight.withOpacity(0.7),
                    indicatorColor: AppColors.yellow,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: categories.map((category) => Tab(text: category)).toList(),
                    onTap: (index) {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          // Contenu principal
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                List<Dish> filteredDishes = category == 'Tous'
                    ? dishes
                    : category == 'Vos plats préférés'
                    ? getFilteredDishes()
                    : dishes.where((dish) => dish.category == selectedCategory).toList();

                return Container(
                  padding: EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 cartes par ligne comme dans l'image de référence
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85, // Ratio similaire à l'image de référence
                    ),
                    itemCount: filteredDishes.length,
                    itemBuilder: (context, index) {
                      return ReferenceDishCard(
                        dish: filteredDishes[index],
                        onTap: () => _showDishDetails(context, filteredDishes[index]),
                        onLike: () => _onLike(filteredDishes[index]),
                        onDislike: () => _onDislike(filteredDishes[index]),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onLike(Dish dish) {
    setState(() {
      dish.likes++;
    });
  }

  void _onDislike(Dish dish) {
    setState(() {
      dish.dislikes++;
    });
  }

  void _onAddComment(Dish dish, String commentText) {
    setState(() {
      dish.comments.add(Comment(
        author: 'Utilisateur',
        text: commentText,
        date: DateTime.now(),
      ));
    });
  }
}

// Widget pour les cartes selon l'image de référence
class ReferenceDishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  ReferenceDishCard({
    required this.dish,
    required this.onTap,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    dish.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Infos du plat
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    dish.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${dish.price.toInt()} DH',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onLike,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${dish.likes}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          GestureDetector(
                            onTap: onDislike,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_down,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${dish.dislikes}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dialogue pour afficher les détails du plat
class DishDetailsDialog extends StatefulWidget {
  final Dish dish;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final Function(String) onAddComment;

  DishDetailsDialog({
    required this.dish,
    required this.onLike,
    required this.onDislike,
    required this.onAddComment,
  });

  @override
  _DishDetailsDialogState createState() => _DishDetailsDialogState();
}

class _DishDetailsDialogState extends State<DishDetailsDialog> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.60,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image du plat
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 190,
                width: double.infinity,
                child: Image.asset(
                  widget.dish.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant,
                        size: 40,
                        color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nom et prix
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.dish.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.dish.price.toInt()} DH',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    // Description
                    Text(
                      widget.dish.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textDark,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 12),
                    // Boutons like/dislike
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            widget.onLike();
                            setState(() {});
                          },
                          icon: Icon(Icons.thumb_up, size: 16),
                          label: Text('${widget.dish.likes}'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            widget.onDislike();
                            setState(() {});
                          },
                          icon: Icon(Icons.thumb_down, size: 16),
                          label: Text('${widget.dish.dislikes}'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Champ pour ajouter un commentaire
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Ajouter un commentaire...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_commentController.text.trim().isNotEmpty) {
                              widget.onAddComment(_commentController.text.trim());
                              _commentController.clear();
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.send, color: AppColors.green),
                        ),
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 12),
                    // Section commentaires
                    Text(
                      'Commentaires',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Liste des commentaires
                    if (widget.dish.comments.isNotEmpty)
                      Column(
                        children: widget.dish.comments.map((comment) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.author,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  comment.text,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    else
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Aucun commentaire pour le moment',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Bouton fermer
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Fermer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}

