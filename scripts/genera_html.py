from pathlib import Path

from lxml import etree


RADICE = Path(__file__).resolve().parents[1]
PERCORSO_XML = RADICE / "data" / "tesauro.xml"
PERCORSO_XSD = RADICE / "schema" / "tesauro.xsd"
PERCORSO_XSLT = RADICE / "site" / "tesauro.xsl"
PERCORSO_HTML = RADICE / "site" / "index.html"


def main():
    documento_xml = etree.parse(str(PERCORSO_XML))
    schema = etree.XMLSchema(etree.parse(str(PERCORSO_XSD)))
    schema.assertValid(documento_xml)

    trasformazione = etree.XSLT(etree.parse(str(PERCORSO_XSLT)))
    risultato = trasformazione(documento_xml)
    PERCORSO_HTML.write_text(str(risultato), encoding="utf-8")

    print(f"Creato: {PERCORSO_HTML}")


if __name__ == "__main__":
    main()
