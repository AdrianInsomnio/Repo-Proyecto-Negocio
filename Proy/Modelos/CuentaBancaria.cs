public class CuentaBancaria 
{
	public string NumeroCuentaBancaria { get; set; }	
	public int CodigoBanco { get; set; }
	public string DescripcionCuentaBancaria { get; set; }
	public string Observaciones { get; set; }

	public CuentaBancaria(string numero,int codigo,string desc,string obs)
	{
		NumeroCuentaBancaria = numero;
		CodigoBanco = codigo;	
		DescripcionCuentaBancaria = desc;
		Observaciones=obs;
	}
  
}