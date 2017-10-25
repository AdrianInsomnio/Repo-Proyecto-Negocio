using System;

public class Iva
{
    #region Atributos
    private int m_CodigoIva;

    public int CodigoIva 
    {
        get { return m_IdIva; }
        set { m_IdIva = value; }
    }

    private string m_DescripcionIva;

    public string DescripcionIva
        {
        get { return m_DescripcionIva; }
        set { m_DescripcionIva = value; }
    }

    private decimal m_PorcentajeIva;

    public decimal PorcentajeIva
    {
        get { return m_PorcentajeIva; }
        set { m_PorcentajeIva = value; }
    }

    private decimal m_FactorMultiplicador;

    public decimal FactorMultiplicador
    {
        get { return m_FactorMultiplicador; }
        set { m_FactorMultiplicador = value; }
    }


    #endregion

    #region Contructores

    public Iva()
    {
    }

    public Iva(int codigo,string descripcion, decimal porcentaje,decimal factor)
    {
        CodigoIva = codigo;
        DescripcionIva = descripcion;
        PorcentajeIva = porcentaje;
        FactorMultiplicador = factor;

    }
    #endregion

    #region Overrides

    public override string ToString()
    {
        return (m_DescripcionIva +" "+ m_PorcentajeIva  ).ToString();
    }
    #endregion


}


/*
    DROP TABLE IF EXISTS Ivas;

CREATE TABLE Ivas(
  codigoIva int(10) unsigned NOT NULL,
  descripcionIva varchar(45) DEFAULT NULL,
  porcentajeIva decimal(45,2) unsigned DEFAULT NULL,
  factorMultiplicador decimal(45,2) unsigned DEFAULT NULL,
  PRIMARY KEY(codigoIva)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    */