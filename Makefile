RST_FILES =  tutorial/intro.rst \
			 tutorial/tvm/tvm.rst \
		     tutorial/relay/relay.rst \
			 tutorial/tvm/autotvm.rst \
			 tutorial/vta/vta.rst \
			 tutorial/applications.rst \
		     tutorial/uTVM.rst \
			 tutorial/ultra_low_precision.rst \
			 tutorial/byod.rst

all: tutorial/*.rst tutorial/relay/*.rst
	pandoc \
	    -s \
	    --pdf-engine=xelatex \
		--from=rst \
		--metadata=pandoc.yaml \
		$(RST_FILES) -o build/tutorial.tex
	pandoc -s --toc --pdf-engine=xelatex --metadata-file=pandoc.json\
		build/tutorial.tex -o build/tutorial.pdf

clean:
	rm -f build/*.pdf build/*.tex
