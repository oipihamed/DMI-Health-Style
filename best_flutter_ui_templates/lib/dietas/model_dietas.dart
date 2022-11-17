class Dietas{
  String nombreDieta="";
  String rutaImagen="";
  String Alimento="";
  String calorias = "";
  int porcion =0;
  String tipoHorario ="";
  String descripcion ="";
  String estado="";

  Dietas(this.nombreDieta,this.rutaImagen,this.calorias,this.tipoHorario,this.descripcion,this.estado);

  static List<Dietas> dietas(){
    return [Dietas("Dieta1", "/fitness_app/breakfast.png", " Calorías recomendadas: 400 ","Desayuno","Agua + Zumo de naranja + Porridge de bebida de arroz con copos de avena finos, pasas y manzana pelada troceada","Activo"),
    Dietas("Dieta2", "/fitness_app/lunch.png", "Calorías recomendadas: 600 ",  "Almuerzo", "Agua + Crema de calabaza con picatostes de pan tostado + Espaguetis con atún al natural y orégano + Melocotón en almíbar", "Activo"),
    Dietas("Dieta3", "/fitness_app/dinner.png", "Calorías recomendadas: 500 ",  "Cena", "Agua + Sopa de arroz con zanahoria + Lubina con patatas al horno + Compota de pera, manzana y galleta María", "Activo")

    ];
  }

}

