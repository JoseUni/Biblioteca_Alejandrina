
package model;


import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.library.Articulo;
import model.library.ArticuloPrestado;
import model.library.Libro;
import model.library.Pelicula;
import model.library.Persona;
import model.library.Revista;
import oracle.jdbc.OracleTypes;



public class InformationStore {
    private Connection _Conection;
    //Inserciones ======================================================================================
    public void initConection() {
        try {
        Class.forName("oracle.jdbc.OracleDriver"); 
        String BaseDeDatos = "jdbc:oracle:thin:@EverestXP:1521:DEMO";  
        _Conection = DriverManager.getConnection(BaseDeDatos, "Alejandria","Alejandria");    
        
        if (_Conection != null) {
            System.out.println("Conexion exitosa!");
        } else {
            System.out.println("Conexion fallida!");
        }
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    public void insertarLibros(Libro pLibro){
        try {
           
            CallableStatement sentencia=_Conection.prepareCall("{call ADDARTICULOLIBRO(?,?,?,?,?,?,?)}");
            //título
            sentencia.setString(1, pLibro.getTitulo());
            //calificación
            sentencia.setInt(2, pLibro.getCalificacion());
            //imagen
            sentencia.setString(3, pLibro.getImagenPortada());
            //Cantidad Total
            sentencia.setInt(4, pLibro.getCantidadTotal());
            //autor
            sentencia.setString(5, pLibro.getAutor());
            //editorial
            sentencia.setString(6, pLibro.getEditorial());
            //Edicion
            sentencia.setString(7, pLibro.getEdicion());
            // Ejecuta el procedimiento almacenado
            sentencia.execute();
            }
         catch (SQLException e) {
            e.printStackTrace();
            
        }        
    }
    
    public void insertarPeliculas(Pelicula pPelicula){
        try {
           
            CallableStatement sentencia=_Conection.prepareCall("{call ADDARTICULOPELICULA(?,?,?,?,?,?,?)}");
            //título
            sentencia.setString(1, pPelicula.getTitulo());
            //calificación
            sentencia.setInt(2, pPelicula.getCalificacion());
            //imagen
            sentencia.setString(3, pPelicula.getImagenPortada());
            //Cantidad Total
            sentencia.setInt(4, pPelicula.getCantidadTotal());
            //Director
            sentencia.setString(5, pPelicula.getDirector());
            //Fecha de estreno
            sentencia.setDate(6, pPelicula.getFechaEstreno());
            //Empresa
            sentencia.setString(7, pPelicula.getEmpresa());
            // Ejecuta el procedimiento almacenado
            sentencia.execute();
            }
         catch (SQLException e) {
            e.printStackTrace();
            
        }        
    }
    
    public void insertarRevistas(Revista pRevista){
        try {
           
            CallableStatement sentencia=_Conection.prepareCall("{call ADDARTICULOREVISTA(?,?,?,?,?,?,?)}");
            //título
            sentencia.setString(1, pRevista.getTitulo());
            //calificación
            sentencia.setInt(2, pRevista.getCalificacion());
            //imagen
            sentencia.setString(3, pRevista.getImagenPortada());
            //Cantidad Total
            sentencia.setInt(4, pRevista.getCantidadTotal());
            //Fecha Salida
            sentencia.setDate(5, pRevista.getFechaSalida());
            //editorial
            sentencia.setString(6, pRevista.getEditorial());
            // Ejecuta el procedimiento almacenado
            sentencia.execute();
            }
         catch (SQLException e) {
            e.printStackTrace();
            
        }        
    }
    //falta implementar
    public void insertarPersonas(Persona pPersona){
    
    }
    //falta implementar
    public void insertarPrestacion(ArticuloPrestado pArticuloPrestado){
    
    }
    
    //Consultas ======================================================================================
    //falta implementar
    public ArrayList<Articulo> consultaArticulosNoPrestado(){return null;
}
    //falta implementar
    public ArrayList<Articulo> consultaArticulosPrestado(){return null;
}
    //falta implementar
    public ArrayList<Persona> consultaPersonas(){return null;
}
    //falta implementar
    public ArrayList<Pelicula> consultaPeliculas(){return null;
}
    //falta implementar
    public ArrayList<Revista> consultaRevistas(){return null;
}
    
    public ArrayList<Libro> consultaLibros() throws ClassNotFoundException {
            ArrayList<Libro> resultado=new ArrayList<>();
            try {
                CallableStatement sentencia=_Conection.prepareCall("{?=call Consulta_Libros()}");
                sentencia.registerOutParameter(1, OracleTypes.CURSOR);                           
                //sentencia.setString(2,cliente1);                                            
                sentencia.executeQuery();//Realizar la llamada
                System.out.println("Objeto: " + sentencia);
                ResultSet datoRecibido = (ResultSet)sentencia.getObject (1);
                Libro nuevoLibro;
                while (datoRecibido.next ()){
                    nuevoLibro=new Libro();
                    nuevoLibro.setIDgeneral(datoRecibido.getInt ("IDGENERAL"));
                    nuevoLibro.setTitulo(datoRecibido.getString ("TITULO"));
                    nuevoLibro.setCalificacion(Integer.parseInt(datoRecibido.getString ("CALIFICACION")));
                    nuevoLibro.setImagenPortada(datoRecibido.getString ("IMAGENPORTAD"));
                    nuevoLibro.setTipoArticulo(Integer.parseInt(datoRecibido.getString ("TIPART")));
                  
                    resultado.add(nuevoLibro);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }        return resultado;
    }
    
    //Modificaciones==================================================================================
    public void ModificarLibro(Libro pLibro){
    
    }
    
    public void ModificarPelicula(Pelicula pPelicula){
    
    }
    
    public void ModificarRevista(Revista pRevista){
    
    }
    
    //Getters
    public Connection getConection() {
        return _Conection;
    }
    
}
