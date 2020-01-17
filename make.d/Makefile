#!/usr/bin/env make
#  _   _ _     ___  __  __       _
# | | | | |   / _ \|  \/  | __ _| | _____
# | |_| | |  | | | | |\/| |/ _` | |/ / _ \
# |  _  | |__| |_| | |  | | (_| |   <  __/
# |_| |_|_____\___/|_|  |_|\__,_|_|\_\___|
#
# h@h-lo.me 20200106 101802 -0800 PST 1578334682 d(-_- )b...
#
# common tasks automation










EXIFARGS  = -c "%.8d" -d "%Y%m%d %H%D%S ($s)" -g -s -ColorSpace
EXIFARGS += -CreateDate -DateTimeOriginal -ExifImageHeight -SubjectArea
EXIFARGS += -ExifImageWidth -ExifVersion -ExposureMode -ExposureTime
EXIFARGS += -FNumber -FileAccessDate -FileModifyDate -FileSize -Flash
EXIFARGS += -FileInodeChangeDate -FocalLength -GPSAltitude -ISO -Make
EXIFARGS += -GPSDateTime -GPSImgDirection -GPSPosition -Model -Software
EXIFARGS += -ModifyDate -Orientation -ResolutionUnit -SensingMethod
EXIFARGS += -WhiteBalance
IMAGES    = .jpg .jpeg .png .gif .bmp .tif .tiff .webp

.SUFFIXES=
.SUFFIXES=  $(IMAGES) $${$${$(IMAGES)}:u}.jpg .jpeg .png .gif .bmp .tif .tiff .webp
	$(touppercase )




%.exif: %.JPG %.JPEG %.PNG %.GIF %.BMP %.TIF %.TIFF

%.exif: %.jpg %.jpeg %.png %.gif %.bmp %.tif %.tiff
	exiftool $(EXIFARGS) $< > $@

%.png: %.webp
	pv $< | dwebp -v -o - -- - > $@

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
