LATEX_TEMPFILE_DIR=tmp

chessboard.pdf: chessboard.tex
	pdflatex --shell-escape -file-line-error -halt-on-error -jobname "$(basename $@)" -output-directory ${LATEX_TEMPFILE_DIR} "$<"
	@mv -v "${LATEX_TEMPFILE_DIR}/$@" ./

${LATEX_TEMPFILE_DIR}:
	@mkdir -v "${LATEX_TEMPFILE_DIR}"

clean:
	rm -r ${LATEX_TEMPFILE_DIR}

.PHONY: clean
