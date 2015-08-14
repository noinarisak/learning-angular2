PHONY: watch

#kill:
#	@echo killing process...
#	@ps -ef | awk '/node/ && !/awk/ {print $2}' | xargs -r kill -9

run:
	@echo Runing...
	@http-server

watch:
	@echo Watching for changes...
	@tsc --watch -m commonjs -t es5 --experimentalDecorators --emitDecoratorMetadata main.ts
