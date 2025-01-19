PROFILE=$1

TEMP_DIR=".aws-sam"

function clean_up() {
  echo "Cleaning up build directory"
  if [ -d "$TEMP_DIR" ]; then
    rm -r "$TEMP_DIR"
  fi
}

clean_up

if sam build -t "template.yaml" ; then
  sam deploy \
   --no-confirm-changeset \
   --config-env "$ENV" \
   --profile "$PROFILE"

   clean_up
fi


