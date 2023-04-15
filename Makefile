release: ## Release (eg. V=0.0.1)
	 @[ "$(V)" ] \
		 && git config init.defaultBranch | grep "main" >/dev/null \
		 && read -p "Press enter to confirm and push tag v$(V) to origin, <Ctrl+C> to abort ..." \
		 && git tag v$(V) -m "chore: v$(V) release" \
		 && git push origin v$(V) -f \
		 && git fetch --tags --force --all -p \
		 && if [ ! -z "$(GITHUB_TOKEN)" ] ; then \
			curl \
			  -H "Authorization: token $(GITHUB_TOKEN)" \
				-X POST	\
				-H "Accept: application/vnd.github.v3+json"	\
				https://api.github.com/repos/atrakic/$(shell basename $$PWD)/releases \
				-d "{\"tag_name\":\"$(V)\",\"generate_release_notes\":true}"; \
			fi;
