A theme module can override icons by simply adding an icon image with the same path and filename to the theme module’s /src/imageOverrides/<module-name> directory.
This icon will then take precedence over the version from the icons module.

for example :

image to override : ORD module://icons/x16/refresh.png
replacement image : src/imageOverrides/icons/x16/refresh.png
