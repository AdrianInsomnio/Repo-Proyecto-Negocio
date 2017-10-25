public class SubRubros 
{
	public int CodigoSubRubro { get; set; }
	public int CodigoRubro 	{ get; set; }
	public string DescripcionSubRubro { get; set; }

	public SubRubros(int subrubro,int rubro,string descripcion)
	{
		SubRubros = subrubro;
		CodigoRubro = rubro;
		DescripcionSubRubro = descripcion;

	}
  
}