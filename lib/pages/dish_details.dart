import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/models.dart';

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
                        color: Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          '${widget.dish.price.toInt()} DH',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    // Description
                    Text(
                      widget.dish.description,
                      style: Theme.of(context).textTheme.bodySmall,
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