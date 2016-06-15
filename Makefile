# ICI3D
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: evaluation.pages 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
-include $(ms)/talk.def
-include $(ms)/perl.def

##################################################################

## Lecture

Sources += beamer.fmt beamer.tmp

## Model assessment lecture, given once at DAIDD; I don't remember what I said
## Add comments this time through?
Sources += evaluation.txt
evaluation.draft.pdf: talkdir/slidecomm.sty evaluation.txt
evaluation.pages: evaluation.draft.pdf
	/bin/cp -f $< ~/git/MMED2016/pages/lectures/


## Likelihood fitting II (should have a better name); started at MMED 2016
## Delete old_fit the next time you think of it
Sources += fitting.txt
fitting.draft.pdf: fitting.txt
fitting.pages: fitting.draft.pdf
	/bin/cp -f $< ~/git/MMED2016/pages/lectures/

##################################################################

## Diagrams

vitamins.Rout: ciplots.Rout vitamins.R

distance.Rout: distance.R

##################################################################

## figs; need to move these rules to step files, and do other cool tricks

figs/deer.jpg:
	wget -O $@ "https://yy1.staticflickr.com/8355/8414701990_dc1cd1b811_z.jpg"

figs/stepping.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Stepping_stones%2C_Hebden%2C_bench.jpg/1024px-Stepping_stones%2C_Hebden%2C_bench.jpg"

figs/machine.jpg:
	wget -O $@ "https://i.ytimg.com/vi/YFIFt2DI-sY/hqdefault.jpg"

figs/obey_kitties.jpg:
	wget -O $@ "http://img10.deviantart.net/9f66/i/2008/364/f/6/obey_the_kitties_by_gazzit.png"

figs/keeganClinicalDiagram.jpg:
	wget -O $@ "http://static-content.springer.com/image/art%3A10.1186%2F1471-2334-13-428/MediaObjects/12879_2013_2638_Fig1_HTML.jpg"

figs/keeganPhaseDiagram.jpg:
	wget -O $@ "http://static-content.springer.com/image/art%3A10.1186%2F1471-2334-13-428/MediaObjects/12879_2013_2638_Fig4_HTML.jpg"

figs/epicycles.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Cassini_apparent.jpg/781px-Cassini_apparent.jpg"

figs/heliocentric.jpg: 
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/2/28/Copernican_heliocentrism_diagram-2.jpg"

figs/SierraLeoneValidation.jpg:
	wget -O $@ "http://www.thelancet.com/cms/attachment/2031527248/2048638618/gr4.jpg"

figs/godDice.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/9/94/God-dice.jpg"

figs/Earth.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/512px-Earth_Eastern_Hemisphere.jpg"

figs/EbolaBurial.jpg:
	wget -O $@ "https://c2.staticflickr.com/8/7398/16355850376_70e5cc6ea2_b.jpg"

figs/QuestionAnswers.jpg:
	wget -O $@ "http://farm4.static.flickr.com/3394/3526522573_8f40a675b6.jpg"

figs/clear.jpg:
	wget -O $@ "http://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Golden_Gate_Bridge_on_a_clear_day.jpg/768px-Golden_Gate_Bridge_on_a_clear_day.jpg"
	 
figs/fog.jpg:
	wget -O $@ "http://upload.wikimedia.org/wikipedia/commons/4/47/Fog_Bowl_1988.jpg"

figs/BroadStreet.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/John_Snow_memorial_and_pub.jpg/576px-John_Snow_memorial_and_pub.jpg"

figs/choleraMap.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/c/c7/Snow-cholera-map.jpg"

figs/legoland.jpg:
	wget -O $@ "http://s3.freefoto.com/images/1002/02/1002_02_1_web.jpg"

figs/prometheus.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/6/61/Cassini_-_four_Saturn_Moons.jpg"

# Stuff cribbed from JS at the last minute
Sources += modelWorld.png Farr.png

##################################################################

## Directories

### This is not chaining! Why not? Because it ignores the first rule.
talkdir/%: talkdir
talkdir:
	/bin/ln -s $(ms)/talk $@

# Doing figdrop for now; goal should be to have rules in makestuff; image co-ordination files in the project; and an image dropbox. 

# Or maybe just move everything to lecture images?

figs/%: figs
figs:
	$(LN) $(figdrop) $@

images/%: images
images:
	$(LN) $(imagedrop) $@

## Not chaining well! Maybe because of old WW-extra-implicit stuff? Maybe fixed?
fitting/%: fitting
#	cd fitting && $(MAKE) $*

fitting:
	$(LN) $(gitroot)/fitting_code $@

## Old directory
EbolaFits/%: EbolaFits ;
EbolaFits:
	$(LN) ../Latent_incidence_fitting $@

## Corresponding new directory
hybrid/%: hybrid ;
hybrid:
	$(LN) ../hybrid_fitting $@

data/%: data
#	cd $< && $(MAKE) $*

data:
	$(LN) ../Disease_data $@

######################################################################

# Archive

Archive += $(wildcard archive/*.pdf)

archive/%.pdf: 
	$(MAKE) archive
	$(MAKE) currSlides.pdf
	/bin/cp -f currSlides.pdf $@

archive:
	mkdir $@

currSlides.pdf: evaluation.draft.pdf
	$(copy)

## Clausius

# log(P) = C-a/T
# a/T = C-log(P)
# T = a/(C-log(P))
# Slope at P=1



### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk
-include $(ms)/talk.mk
