public class Bancos 
{
	public int CodigoBanco { get; set; }
	public string DescripcionBanco { get; set; }
  
  public Bancos(int codigo,string desc)
  {
  	CodigoBanco = codigo;
  	DescripcionBanco = desc;
  }
}