help:
	$(info * deployment:  build, publish, publish-test)
	$(info * setup:       init, demo)

clean-build:
	$(info * cleaning build files)
	@find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__
	@rm -rf mnamer.egg-info build dist

clean-demo:
	$(info * cleaning demo files)
	@rm -rf build dist *.egg-info demo

clean: clean-build clean-demo


# Deployment Helpers -----------------------------------------------------------

publish:
	$(info * Build with docker and publish to HomeSweetHome)
	docker build -t mnamer:latest . --platform linux/amd64
	docker save mnamer > mnamer.tar
	scp -P 20755 mnamer.tar arno@192.168.1.23:/home/arno/workspace/mnamer/



# Setup Helpers ----------------------------------------------------------------

demo: clean-demo
	$(info * setting up demo directory)
	@mkdir -p \
	    demo
	@cd demo && touch \
        "La Reine des Neiges - Bande Annonce Olaf (2017).mkv" \
        "Dune.Part.Two.2024.FANSUB.VOSTFR.1080p.10bit.WEBRip.2CH.x265.HEVC-Slay3R.mkv" \
        "Florence Foresti - Boys Boys Boys (2024).mkv" \
        "Joker.Folie.a.Deux.2024.MULTi.VF2.1080p.WEB.H265-FW.mkv" \
        "Thank.You.Next.S01E04.MULTi.1080p.NF.WEB.x264-ONLYMOViE.mkv"
