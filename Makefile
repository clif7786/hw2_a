name = use_cases
.PHONY: clean pdf png

pdf: ${name}.pdf
png: ${name}.png

${name}.png:  ${name}.pu
	java -jar plantuml.jar ${name}.pu

${name}.pdf: ${name}.tex ${name}.png
	mkdir -p build
	latexmk -pdf -xelatex -interaction=nonstopmode ${name}.tex -outdir=./build
	mv ./build/${name}.pdf ./${name}.pdf

clean:
	rm ${name}.pdf -f
	rm ${name}.png -f
	cd build &&	latexmk -f -c ../${name}.tex 

