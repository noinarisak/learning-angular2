PHONY: watch

watch:
	@echo Watching for changes...
	@tsc --watch -m commonjs -t es5 --experimentalDecorators --emitDecoratorMetadata app.ts
