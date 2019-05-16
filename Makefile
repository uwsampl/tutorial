all: tutorial/*.rst tutorial/relay/*.rst
	pandoc -s --toc --pdf-engine=xelatex \
		--from=rst \
	tutorial/*.rst tutorial/**/*.rst -o build/tutorial.pdf

clean:
	rm build/*.pdf
