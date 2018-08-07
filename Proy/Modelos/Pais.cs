public class Pais 
{
	public int CodigoPais { get; set; }
	public string DescripcionPais { get; set; }

	public Pais(int codigo,string desc)
	{
		CodigoPais = codigo;
		DescripcionPais= desc;
	}
  
}