package edukare.escola.relatorios;


import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.escola.domain.DemandaProfessores;
import edukare.escola.domain.Disciplina;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.stream.Stream;

public class RelatorioDisciplina {

    private static Logger logger = LoggerFactory.getLogger(RelatorioDisciplina.class);

    public static ByteArrayInputStream gerarRelatorio(List<Disciplina> disciplinas) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Relatório de disciplinas", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100);

            Stream.of("ID", "Nome", "Ativa")
                    .forEach(headerTitle -> {
                        PdfPCell header = new PdfPCell();
                        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
                        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        header.setHorizontalAlignment(Element.ALIGN_CENTER);
                        header.setBorderWidth(2);
                        header.setPhrase(new Phrase(headerTitle, headFont));
                        table.addCell(header);
                    });

            for (Disciplina disciplina : disciplinas) {
                PdfPCell id = new PdfPCell(new Phrase(disciplina.getId().toString()));
                id.setPaddingLeft(4);
                id.setVerticalAlignment(Element.ALIGN_MIDDLE);
                id.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(id);

                PdfPCell nome = new PdfPCell(new Phrase(disciplina.getNome()));
                nome.setPaddingLeft(4);
                nome.setVerticalAlignment(Element.ALIGN_MIDDLE);
                nome.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(nome);

                PdfPCell ativa = new PdfPCell(new Phrase(disciplina.getAtiva()));
                ativa.setPaddingLeft(4);
                ativa.setVerticalAlignment(Element.ALIGN_MIDDLE);
                ativa.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(ativa);
            }
            document.add(table);

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
