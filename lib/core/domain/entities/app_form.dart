abstract class AppForm<Params, Entity> {
  Params toParams();
  AppForm fromEntity(Entity entity);
}
