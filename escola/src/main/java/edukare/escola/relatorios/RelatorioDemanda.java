package edukare.escola.relatorios;


import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.escola.domain.DemandaProfessores;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Set;
import java.util.stream.Stream;

public class RelatorioDemanda {

    private static Logger logger = LoggerFactory.getLogger(RelatorioDemanda.class);

    public static ByteArrayInputStream relatorioDemanda(Set<DemandaProfessores> demandaProfessores) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Relatório de demandas por professores", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(8);
            table.setWidthPercentage(100);

            Stream.of("ID", "Ano", "Disciplina", "Semestre", "Id Escola", "Escola", "Quantidade", "Justificativa")
                    .forEach(headerTitle -> {
                        PdfPCell header = new PdfPCell();
                        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
                        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        header.setHorizontalAlignment(Element.ALIGN_CENTER);
                        header.setBorderWidth(2);
                        header.setPhrase(new Phrase(headerTitle, headFont));
                        table.addCell(header);
                    });

            for (DemandaProfessores demanda : demandaProfessores) {
                PdfPCell id = new PdfPCell(new Phrase(demanda.getId().toString()));
                id.setPaddingLeft(4);
                id.setVerticalAlignment(Element.ALIGN_MIDDLE);
                id.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(id);

                PdfPCell ano = new PdfPCell(new Phrase(demanda.getAno().toString()));
                ano.setPaddingLeft(4);
                ano.setVerticalAlignment(Element.ALIGN_MIDDLE);
                ano.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(ano);

                PdfPCell disciplina = new PdfPCell(new Phrase(demanda.getDisciplina()));
                disciplina.setPaddingLeft(4);
                disciplina.setVerticalAlignment(Element.ALIGN_MIDDLE);
                disciplina.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(disciplina);

                PdfPCell semestre = new PdfPCell(new Phrase(demanda.getSemestre().toString()));
                semestre.setPaddingLeft(4);
                semestre.setVerticalAlignment(Element.ALIGN_MIDDLE);
                semestre.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(semestre);

                PdfPCell escolaId = new PdfPCell(new Phrase(demanda.getEscolaId().toString()));
                escolaId.setPaddingLeft(4);
                escolaId.setVerticalAlignment(Element.ALIGN_MIDDLE);
                escolaId.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(escolaId);

                PdfPCell escola = new PdfPCell(new Phrase(demanda.getEscola()));
                escola.setPaddingLeft(4);
                escola.setVerticalAlignment(Element.ALIGN_MIDDLE);
                escola.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(escola);

                PdfPCell quantiadade = new PdfPCell(new Phrase(demanda.getQuantidade().toString()));
                quantiadade.setPaddingLeft(4);
                quantiadade.setVerticalAlignment(Element.ALIGN_MIDDLE);
                quantiadade.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(quantiadade);

                PdfPCell justificativa = new PdfPCell(new Phrase(demanda.getJustificativa()));
                justificativa.setPaddingLeft(4);
                justificativa.setVerticalAlignment(Element.ALIGN_MIDDLE);
                justificativa.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(justificativa);
            }
            document.add(table);

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
