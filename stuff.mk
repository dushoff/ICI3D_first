%.makestuff:
	-cd $(dir $(ms)) && mv -f $(notdir $(ms)) .$(notdir $(ms))
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git
	-cd $(dir $(ms)) && rm -rf .$(notdir $(ms))
	touch $@

PUSHDIR = /home/dushoff/git/MMED2016/pages/lectures/

msrepo = https://github.com/dushoff
gitroot = ../
Drop = ~/Dropbox/
figdrop = ~/Dropbox/talkfigs
imagedrop = ~/Dropbox/Lecture_images

Sources += dushoff_local.mk
-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
