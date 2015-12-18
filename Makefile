# ICI3D
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: evaluation.draft.pdf 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
-include $(ms)/talk.def
-include $(ms)/perl.def

##################################################################

## Lecture

Sources += beamer.fmt beamer.tmp

Sources += evaluation.txt
evaluation.draft.pdf: talkdir/slidecomm.sty evaluation.txt

##################################################################

## Diagrams

vitamins.Rout: ciplots.Rout vitamins.R

##################################################################

## figs

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

figs/%: figs

figs:
	$(LN) $(figdrop) $@

EbolaFits:
	$(LN) ../Latent_incidence_fitting $@

######################################################################

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
