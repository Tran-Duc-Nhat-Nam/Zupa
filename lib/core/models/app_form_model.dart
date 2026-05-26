abstract class AppFormModel<Params, Entity> {
  Params toParams();
  AppFormModel fromEntity(Entity entity);
}
