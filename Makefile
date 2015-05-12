## Not a fan of makefiles still but here go's

DEPS := \
	golang.org/x/tools/cmd/cover github.com/golang/lint/golint github.com/kisielk/errcheck golang.org/x/tools/cmd/goimports 


deps: 
	go get -u $(DEPS)

develop: deps
	(cd .git/hooks && ln -sf ../../misc/pre-push.bash pre-push )

coverage:
	go test -coverprofile=coverage.out
	go tool cover -func=coverage.out
	rm coverage.out

lint:
	golint ./...

errcheck:
	errcheck github.com/v-studios/chkmd

vet:
	go vet ./...	

race:
	go test -race .

test:
	go test .

check:
	./misc/pre-push.sh
