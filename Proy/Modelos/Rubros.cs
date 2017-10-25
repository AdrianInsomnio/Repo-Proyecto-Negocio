public class Rubros 
{
	public int CodigoRubro { get; set; }
	public string DescripcionRubro { get; set; }
  public	Rubros( int codigo,string descripcion)
  {
  	CodigoRubro = codigo;
  	DescripcionRubro=descripcion;

  }
}