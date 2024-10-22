.PHONY: clean run docker-image stop

docker-image:
	docker build -f Dockerfile -t otobrglez/tttm-pascal .

TTTMServer: docker-image
	docker run --rm -v `pwd`:/tmp/tttm-pascal otobrglez/tttm-pascal \
		fpc /tmp/tttm-pascal/TTTMServer.pas

run: TTTMServer
	docker run --rm \
		-p 1999:1999 \
		-v `pwd`:/tmp/tttm-pascal \
		--name=tttm-pascal \
		otobrglez/tttm-pascal \
		./tmp/tttm-pascal/TTTMServer

stop: 
	docker stop -t 1 tttm-pascal

clean:
	rm -rf *.o TTTMServer
