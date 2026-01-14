import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

class CategoryEndpoint extends Endpoint {
  
  /// Obtiene todas las categorías activas de un usuario específico.
  /// Como no hay auth, el cliente debe enviar el userId.
  Future<List<Category>> getCategories(Session session, String userId) async {
    return await Category.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isDeleted.equals(false),
      orderBy: (t) => t.name,
    );
  }

  /// Crea una nueva categoría.
  Future<void> addCategory(Session session, Category category) async {
    // Buscar categoría con el mismo nombre (activa o eliminada)
    final existing = await Category.db.findFirstRow(
      session,
      where: (t) => 
        t.userId.equals(category.userId) & 
        t.name.equals(category.name),
      // Sin filtro de isDeleted para encontrar todas
    );

    if (existing != null) {
      if (existing.isDeleted == true) {
        // Reactivar la categoría eliminada
        existing.isDeleted = false;
        existing.deletedAt = null;
        existing.color = category.color; // Actualizar color
        
        await Category.db.updateRow(session, existing);
        return;
      } else {
        // Ya existe una categoría activa con ese nombre
        throw FormatException('Ya existe una categoría con el nombre "${category.name}"');
      }
    }

    // No existe, crear nueva categoría
    category.isDeleted = false;
    category.deletedAt = null;
    
    await Category.db.insertRow(session, category);
  }

/// Actualiza una categoría existente.
Future<void> updateCategory(Session session, Category category) async {
    // Verificar si ya existe otra categoría con el mismo nombre para este usuario
    final existing = await Category.db.findFirstRow(
      session,
      where: (t) => 
        t.userId.equals(category.userId) & 
        t.name.equals(category.name) &
        t.isDeleted.equals(false) &
        t.id.notEquals(category.id), // Excluir la categoría actual
    );

    if (existing != null) {
      throw Exception('Ya existe una categoría con el nombre "${category.name}"');
    }

    await Category.db.updateRow(session, category);
  }

  /// Elimina (soft delete) una categoría por su ID.
  Future<void> deleteCategory(Session session, int id) async {
    // Primero obtenemos la categoría
    final category = await Category.db.findById(session, id);
    
    if (category != null) {
      // Marcamos como eliminada
      category.isDeleted = true;
      category.deletedAt = DateTime.now();
      
      // Actualizamos en la base de datos
      await Category.db.updateRow(session, category);
    }
  }
}