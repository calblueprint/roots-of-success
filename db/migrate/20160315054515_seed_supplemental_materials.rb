class SeedSupplementalMaterials < ActiveRecord::Migration
  def change
    SupplementalMaterial.create!(
      name: "Helpful video",
      content: "[Click here](https://youtu.be/6lutNECOZFw)",
      classroom: Classroom.first,
    )
    SupplementalMaterial.create!(
      name: "Helpful video 2",
      content: "[Click me](https://youtu.be/o8E-2jeQ8M0)",
      classroom: Classroom.first,
    )
  end
end
