public class Configuracion 
{
	public int CodigoConfiguracion { get; set; }
	public string Valor { get; set; }
	public string Descripcion { get; set; }

	public Configuracion(int codigo,string val,string desc)
	{
		CodigoConfiguracion=codigo;
		Valor= val;
		Descripcion = desc;
	}

  
}