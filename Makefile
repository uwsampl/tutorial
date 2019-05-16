all:
	pandoc -s --toc --pdf-engine=xelatex \
		--from=rst \
	tutorial/*.rst tutorial/**/*.rst -o build/tutorial.pdf

clean:
	rm tutorial.pdf
