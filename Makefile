name = use_cases
.PHONY: clean pdf png

pdf: ${name}.pdf
png: master.png setupmisc.png

%.png: %.pu
	java -jar plantuml.jar $<

${name}.pdf: ${name}.tex master.png setupmisc.png
	mkdir -p build
	latexmk -pdf -xelatex -interaction=nonstopmode ${name}.tex -outdir=./build
	mv ./build/${name}.pdf ./${name}.pdf

clean:
	rm ${name}.pdf -f
	rm master.png setupmisc.png simple_${name}.png -f
	cd build &&	latexmk -f -c ../${name}.tex 

