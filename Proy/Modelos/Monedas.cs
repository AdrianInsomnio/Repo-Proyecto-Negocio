public class Monedas 
{
	public int CodigoMoneda { get; set; }
	public string DescripcionMoneda { get; set; }
	public string SimboloMoneda { get; set; }
	public decimal CotizacionMoneda { get; set; }
	public char esMonedaReferenciaSistema { get; set; }

	public Monedas(int codigo,string dec,string simb,decimal coti,char esMoneda)
	{
		CodigoMoneda = codigo;
		DescripcionMoneda = dec;
		SimboloMoneda = simb;
		CotizacionMoneda = coti;
		esMonedaReferenciaSistema = esMoneda;
	}
  
}