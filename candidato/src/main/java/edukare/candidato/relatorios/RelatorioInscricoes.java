package edukare.candidato.relatorios;

import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.candidato.domain.Inscricao;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public class RelatorioInscricoes {

    private static Logger logger = LoggerFactory.getLogger(RelatorioInscricoes.class);

    public static ByteArrayInputStream relatorioInscricao(Set<Inscricao> inscricoes) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Minhas inscrições", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);

            Stream.of("ID", "Situação", "Processo Seletivo ID", "Data inscrição")
                    .forEach(headerTitle -> {
                        PdfPCell header = new PdfPCell();
                        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
                        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        header.setHorizontalAlignment(Element.ALIGN_CENTER);
                        header.setBorderWidth(2);
                        header.setPhrase(new Phrase(headerTitle, headFont));
                        table.addCell(header);
                    });

            for (Inscricao inscricao : inscricoes) {
                PdfPCell id = new PdfPCell(new Phrase(inscricao.getId().toString()));
                id.setPaddingLeft(4);
                id.setVerticalAlignment(Element.ALIGN_MIDDLE);
                id.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(id);

                PdfPCell situacao = new PdfPCell(new Phrase(inscricao.getSituacao().situacao));
                situacao.setPaddingLeft(4);
                situacao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                situacao.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(situacao);

                PdfPCell processoSeletivoId = new PdfPCell(new Phrase(inscricao.getProcessoSeletivoId().toString()));
                processoSeletivoId.setPaddingLeft(4);
                processoSeletivoId.setVerticalAlignment(Element.ALIGN_MIDDLE);
                processoSeletivoId.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(processoSeletivoId);

                DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                PdfPCell dataInscricao = new PdfPCell(new Phrase(inscricao.getDataInscricao().format(formatoData)));
                dataInscricao.setPaddingLeft(4);
                dataInscricao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                dataInscricao.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(dataInscricao);
            }
            document.add(table);

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
