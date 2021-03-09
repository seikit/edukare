package edukare.processoseletivo.relatorios;

import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.domain.Professor;

import javax.persistence.Column;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Stream;

public class RelatorioProfessor {

    private static Logger logger = LoggerFactory.getLogger(RelatorioProfessor.class);

    public static ByteArrayInputStream gerarRelatorio(List<Professor> professores) {
        Document document = new Document(PageSize.A4.rotate());
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Relatório de professores", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(12);
            table.setWidthPercentage(100);

            Stream.of("ID", "Nome", "CPF","Celular","Telefone", "Email", "Processo seletivo ID", "Processo seletivo", "Inscrição ID", "Data efetivação", "Encaminhado","Escola encaminhamento")
                    .forEach(headerTitle -> {
                        PdfPCell header = new PdfPCell();
                        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD,11);
                        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                        header.setHorizontalAlignment(Element.ALIGN_CENTER);
                        header.setBorderWidth(2);
                        header.setPhrase(new Phrase(headerTitle, headFont));
                        table.addCell(header);
                    });

            for (Professor professor : professores) {
                Font fontCelula = FontFactory.getFont(FontFactory.HELVETICA,10);
                PdfPCell id = new PdfPCell(new Phrase(professor.getId().toString(),fontCelula));
                id.setPaddingLeft(4);
                id.setVerticalAlignment(Element.ALIGN_MIDDLE);
                id.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(id);

                PdfPCell nome = new PdfPCell(new Phrase(professor.getNomeCompleto(), fontCelula));
                nome.setPaddingLeft(4);
                nome.setVerticalAlignment(Element.ALIGN_MIDDLE);
                nome.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(nome);

                PdfPCell cpf = new PdfPCell(new Phrase(professor.getCpf(), fontCelula));
                cpf.setPaddingLeft(4);
                cpf.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cpf.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cpf);

                PdfPCell celular = new PdfPCell(new Phrase(professor.getCelular(),fontCelula));
                celular.setPaddingLeft(4);
                celular.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celular.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(celular);

                PdfPCell telefone = new PdfPCell(new Phrase(professor.getTelefoneFixo(),fontCelula));
                telefone.setPaddingLeft(4);
                telefone.setVerticalAlignment(Element.ALIGN_MIDDLE);
                telefone.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(telefone);

                PdfPCell email = new PdfPCell(new Phrase(professor.getEmail()));
                email.setPaddingLeft(4);
                email.setVerticalAlignment(Element.ALIGN_MIDDLE);
                email.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(email);

                PdfPCell processoId = new PdfPCell(new Phrase(professor.getProcessoSeletivoId().toString(),fontCelula));
                processoId.setPaddingLeft(4);
                processoId.setVerticalAlignment(Element.ALIGN_MIDDLE);
                processoId.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(processoId);

                PdfPCell processoTitulo = new PdfPCell(new Phrase(professor.getProcessoSeletivoTitulo(),fontCelula));
                processoTitulo.setPaddingLeft(4);
                processoTitulo.setVerticalAlignment(Element.ALIGN_MIDDLE);
                processoTitulo.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(processoTitulo);

                PdfPCell inscricaoId = new PdfPCell(new Phrase(professor.getInscricaoId().toString(),fontCelula));
                inscricaoId.setPaddingLeft(4);
                inscricaoId.setVerticalAlignment(Element.ALIGN_MIDDLE);
                inscricaoId.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(inscricaoId);

                DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                PdfPCell dataEfetivacao = new PdfPCell(new Phrase(professor.getDataEfetivacao().format(formatoData),fontCelula));
                dataEfetivacao.setPaddingLeft(4);
                dataEfetivacao.setVerticalAlignment(Element.ALIGN_MIDDLE);
                dataEfetivacao.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(dataEfetivacao);

                String encaminhado = professor.getEncaminhado() ? "Sim" : "Não";
                PdfPCell encaminhamento = new PdfPCell(new Phrase(encaminhado, fontCelula));
                encaminhamento.setPaddingLeft(4);
                encaminhamento.setVerticalAlignment(Element.ALIGN_MIDDLE);
                encaminhamento.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(encaminhamento);

                String escolaEncaminhamento = professor.getEncaminhado() ? professor.getEscolaEncaminhamento() : "";
                PdfPCell escola = new PdfPCell(new Phrase(escolaEncaminhamento, fontCelula));
                escola.setPaddingLeft(4);
                escola.setVerticalAlignment(Element.ALIGN_MIDDLE);
                escola.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(escola);

            }
            document.add(table);

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
