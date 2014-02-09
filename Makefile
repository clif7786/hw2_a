name = use_cases
.PHONY: clean pdf png

pdf: ${name}.pdf
png: ${name}.png simple_${name}.png

%.png: %.pu
	java -jar plantuml.jar $<

${name}.pdf: ${name}.tex ${name}.png simple_${name}.png
	mkdir -p build
	latexmk -pdf -xelatex -interaction=nonstopmode ${name}.tex -outdir=./build
	mv ./build/${name}.pdf ./${name}.pdf

clean:
	rm ${name}.pdf -f
	rm ${name}.png simple_${name}.png -f
	cd build &&	latexmk -f -c ../${name}.tex 

