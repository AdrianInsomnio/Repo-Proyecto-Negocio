public class Localidades 
{
	public int CodigoLocalidad { get; set; }
	public int CodigoDepartamento { get; set; }
	public int CodigoPais { get; set; }	
	public string DescripcionLocalidad { get; set; }

	public Localidades(int loca,int depa,int pai,string desc)
	{
		CodigoLocalidad = loca;
		CodigoDepartamento = depa;
		CodigoPais = pai;
		DescripcionLocalidad = desc;
	}
  
}