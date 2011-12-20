SOURCE := js/api-*.js js/*/*
IN := js/wrapper-start.js $(SOURCE) js/wrapper-end.js
TEMPLATES := $(SOURCE) templates/
COMPILE := cat
MINIFY := uglifyjs

all: lib/audiolib.min.js docs

lib/audiolib.js: $(IN)
	mkdir lib/ -p
	$(COMPILE) $^ > $@

%.min.js: %.js
	$(MINIFIER) $^ > $@ 


integrate:
	cd integration && sh integrate.sh

update: $(TEMPLATES)
	./build update all

wrappers: $(TEMPLATES)
	./build update wrappers

package: $(TEMPLATES)
	./build update package

docs: $(TEMPLATES)
	./build update docs

clean:
	rm lib/ -rf
