package edukare.processoseletivo.relatorios;

import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.processoseletivo.domain.ProcessoSeletivo;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Stream;

public class RelatorioProcessos {

    private static Logger logger = LoggerFactory.getLogger(RelatorioProcessos.class);

    public static ByteArrayInputStream gerarRelatorio(List<ProcessoSeletivo> processos) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Processos seletivos", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(6);
            table.setWidthPercentage(100);

            Stream.of("ID", "Título", "Descrição", "Situação", "Início inscrição", "Término inscrição")
                    .forEach(headerTitle -> {
                        PdfPCell header = new PdfPCell();
                        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
                        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        header.setHorizontalAlignment(Element.ALIGN_CENTER);
                        header.setBorderWidth(2);
                        header.setPhrase(new Phrase(headerTitle, headFont));
                        table.addCell(header);
                    });

            for (ProcessoSeletivo processo : processos) {
                PdfPCell id = new PdfPCell(new Phrase(processo.getId().toString()));
                id.setPaddingLeft(4);
                id.setVerticalAlignment(Element.ALIGN_MIDDLE);
                id.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(id);

                PdfPCell titulo = new PdfPCell(new Phrase(processo.getTitulo()));
                titulo.setPaddingLeft(4);
                titulo.setVerticalAlignment(Element.ALIGN_MIDDLE);
                titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(titulo);

                PdfPCell descricao = new PdfPCell(new Phrase(processo.getDescricao()));
                descricao.setPaddingLeft(4);
                descricao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                descricao.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(descricao);

                PdfPCell situacao = new PdfPCell(new Phrase(processo.getSituacao().situacao));
                situacao.setPaddingLeft(4);
                situacao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                situacao.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(situacao);

                DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                PdfPCell inicioInscricao = new PdfPCell(new Phrase(processo.getDtInicioInscricao().format(formatoData)));
                inicioInscricao.setPaddingLeft(4);
                inicioInscricao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                inicioInscricao.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(inicioInscricao);

                PdfPCell terminoInscricao = new PdfPCell(new Phrase(processo.getDtEncerramentoInscricao().format(formatoData)));
                terminoInscricao.setPaddingLeft(4);
                terminoInscricao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                terminoInscricao.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(terminoInscricao);
            }
            document.add(table);

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
