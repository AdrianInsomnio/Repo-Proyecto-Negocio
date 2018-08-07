public class Departamento 
{
	public int CodigoDepartamento { get; set; }
	public int CodigoPais { get; set; }
	public string DescripcionDepartamento { get; set; }
  
  	public Departamento(int depa,int pais,string descr)
  	{
  		CodigoDepartamento = depa;
  		CodigoPais =pais;
  		DescripcionDepartamento = descr;
  	}
}