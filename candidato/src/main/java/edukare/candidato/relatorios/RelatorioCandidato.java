package edukare.candidato.relatorios;

import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.PdfWriter;
import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Titulo;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

public class RelatorioCandidato {

    private static Logger logger = LoggerFactory.getLogger(RelatorioCandidato.class);

    public static ByteArrayInputStream relatorioCandidato(Candidato candidato) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(document, out);
            document.open();

            Font font = FontFactory.getFont(FontFactory.COURIER, 14, BaseColor.BLACK);
            Paragraph para = new Paragraph( "Dados do candidato", font);
            para.setAlignment(Element.ALIGN_CENTER);
            document.add(para);
            document.add(Chunk.NEWLINE);

            Paragraph pEmailLogin = new Paragraph();
            Chunk cEmailLoginTitulo = new Chunk("Email de login: ", font);
            Chunk cEmailLogin = new Chunk(candidato.getEmailUsuario(), font);
            pEmailLogin.add(cEmailLoginTitulo);
            pEmailLogin.add(cEmailLogin);
            document.add(pEmailLogin);

            Paragraph pNome = new Paragraph();
            Chunk cNomeTitulo = new Chunk("Nome: ", font);
            Chunk cNome = new Chunk(candidato.getNomeCompleto(), font);
            pNome.add(cNomeTitulo);
            pNome.add(cNome);
            document.add(pNome);

            Paragraph pCpf = new Paragraph();
            Chunk cCpfTitulo = new Chunk("Cpf: ", font);
            Chunk cCpf = new Chunk(candidato.getCpf(), font);
            pCpf.add(cCpfTitulo);
            pCpf.add(cCpf);
            document.add(pCpf);

            Paragraph pFiliacao1 = new Paragraph();
            Chunk cFiliacaoTitulo1 = new Chunk("Filiação 1: ", font);
            Chunk cFiliacao1 = new Chunk(candidato.getFiliacao1(), font);
            pFiliacao1.add(cFiliacaoTitulo1);
            pFiliacao1.add(cFiliacao1);
            document.add(pFiliacao1);

            Paragraph pFiliacao2 = new Paragraph();
            Chunk cFiliacaoTitulo2 = new Chunk("Filiação 2: ", font);
            Chunk cFiliacao2 = new Chunk(candidato.getFiliacao2(), font);
            pFiliacao2.add(cFiliacaoTitulo2);
            pFiliacao2.add(cFiliacao2);
            document.add(pFiliacao2);

            Paragraph pEmail = new Paragraph();
            Chunk cEmailTitulo = new Chunk("Email cadastrado: ", font);
            Chunk cEmail = new Chunk(candidato.getEmail(), font);
            pEmail.add(cEmailTitulo);
            pEmail.add(cEmail);
            document.add(pEmail);

            Paragraph pTelefone = new Paragraph();
            Chunk cTelefoneTitulo = new Chunk("Telefone: ", font);
            Chunk cTelefone = new Chunk(candidato.getTelefoneFixo(), font);
            pTelefone.add(cTelefoneTitulo);
            pTelefone.add(cTelefone);
            document.add(pTelefone);

            Paragraph pCelular = new Paragraph();
            Chunk cCelularTitulo = new Chunk("Celular: ", font);
            Chunk cCelular = new Chunk(candidato.getCelular(), font);
            pCelular.add(cCelularTitulo);
            pCelular.add(cCelular);
            document.add(pCelular);

            Paragraph pNaturalidade = new Paragraph();
            Chunk cNaturalidadeTitulo = new Chunk("Naturalidade: ", font);
            Chunk cNaturalidade = new Chunk(candidato.getNaturalidade(), font);
            pNaturalidade.add(cNaturalidadeTitulo);
            pNaturalidade.add(cNaturalidade);
            document.add(pNaturalidade);

            // Endereço
            Paragraph tituloEndereco = new Paragraph( "Endereço", font);
            tituloEndereco.setAlignment(Element.ALIGN_CENTER);
            document.add(tituloEndereco);
            document.add(Chunk.NEWLINE);

            Paragraph pRua = new Paragraph();
            Chunk cRuaTitulo = new Chunk("Rua: ", font);
            Chunk cRua = new Chunk(candidato.getEndereco().getRua(), font);
            pRua.add(cRuaTitulo);
            pRua.add(cRua);
            document.add(pRua);

            Paragraph pNumero = new Paragraph();
            Chunk cNumeroTitulo = new Chunk("Número: ", font);
            Chunk cNumero = new Chunk(candidato.getEndereco().getNumero().toString(), font);
            pNumero.add(cNumeroTitulo);
            pNumero.add(cNumero);
            document.add(pNumero);

            Paragraph pBairro = new Paragraph();
            Chunk cBairrroTitulo = new Chunk("Bairro: ", font);
            Chunk cBairro = new Chunk(candidato.getEndereco().getBairro(), font);
            pBairro.add(cBairrroTitulo);
            pBairro.add(cBairro);
            document.add(pBairro);

            Paragraph pCidade = new Paragraph();
            Chunk cCidateTitulo = new Chunk("Cidade: ", font);
            Chunk cCidade = new Chunk(candidato.getEndereco().getCidadeResidencia(), font);
            pCidade.add(cCidateTitulo);
            pCidade.add(cCidade);
            document.add(pCidade);

            Paragraph pEstado = new Paragraph();
            Chunk cEstadoTitulo = new Chunk("Estado: ", font);
            Chunk cEstado = new Chunk(candidato.getEndereco().getEstadoResidencia(), font);
            pEstado.add(cEstadoTitulo);
            pEstado.add(cEstado);
            document.add(pEstado);

            // Educação
            Paragraph tituloEducacao = new Paragraph( "Educação", font);
            tituloEducacao.setAlignment(Element.ALIGN_CENTER);
            document.add(tituloEducacao);
            document.add(Chunk.NEWLINE);

            Paragraph pNivelEscolaridade = new Paragraph();
            Chunk cNivelEscolaridadeTitulo = new Chunk("Nível escolaridade: ", font);
            Chunk cNivelEscolaridade = new Chunk(candidato.getEducacao().getNivelEscolaridade(), font);
            pNivelEscolaridade.add(cNivelEscolaridadeTitulo);
            pNivelEscolaridade.add(cNivelEscolaridade);
            document.add(pNivelEscolaridade);

            // Titulos
            document.add(Chunk.NEWLINE);
            Paragraph tituloTitulo = new Paragraph( "Títulos", font);
            tituloTitulo.setAlignment(Element.ALIGN_CENTER);
            document.add(tituloTitulo);
            document.add(Chunk.NEWLINE);

            for (Titulo titulo: candidato.getEducacao().getTitulos()) {
                Paragraph pInstituicao = new Paragraph();
                Chunk cInstituicaoTitulo = new Chunk("Instituição: ", font);
                Chunk cInstituicao = new Chunk(titulo.getInstituicaoEnsino(), font);
                pInstituicao.add(cInstituicaoTitulo);
                pInstituicao.add(cInstituicao);
                document.add(pInstituicao);

                Paragraph pTituloCurso = new Paragraph();
                Chunk cTituloCursoTitulo = new Chunk("Título do curso: ", font);
                Chunk cTituloCurso = new Chunk(titulo.getTituloCurso(), font);
                pTituloCurso.add(cTituloCursoTitulo);
                pTituloCurso.add(cTituloCurso);
                document.add(pTituloCurso);

                Paragraph pAnoConclusao = new Paragraph();
                Chunk cAnoConclusaoTitulo = new Chunk("Ano conclusão: ", font);
                Chunk cAnoConclusao = new Chunk(titulo.getAnoConclusao().toString(), font);
                pAnoConclusao.add(cAnoConclusaoTitulo);
                pAnoConclusao.add(cAnoConclusao);
                document.add(pAnoConclusao);

                document.add(Chunk.NEWLINE);
            }

            document.close();
        }catch(DocumentException e) {
            logger.error(e.toString());
        }
        return new ByteArrayInputStream(out.toByteArray());
    }
}
