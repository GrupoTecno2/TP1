class Estados{
  
  // --------------------------PROPIEDADES (variables)---------------------------
 
  String estado;   // estado
  
  //ARREGLOS
  FiguraBase figuraBase;
  FiguraNegra figuraNegra;
  FiguraColores figuraColores;
  // Llamar las instancias del arrayList de las figuras 
  
  
   Estados() {
     //PARA MODIFICAR SI SON ARRAYLIST
     estado = "inicio" ;
     figuraBase = new FiguraBase();
     figuraNegra = new FiguraNegra();
     figuraColores = new FiguraColores();
       
   }
  
  
  
  
  
  
  
}
