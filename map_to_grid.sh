INPUT=$1
OUTPUT=out
GRID_X_COUNT=3
GRID_Y_COUNT=3
GRID_X_LENGTH_MM=100
GRID_Y_LENGTH_MM=100

for i in $(seq 1 $GRID_X_COUNT); do
  for j in $(seq 1 $GRID_Y_COUNT); do
    start_crop_x=$(bc -l <<< "a=$i-1; a*$GRID_X_LENGTH_MM");
    start_crop_y=$(bc -l <<< "a=$j-1; a*$GRID_Y_LENGTH_MM");
    vpype read ${INPUT} crop ${start_crop_x}mm ${start_crop_y}mm ${GRID_X_LENGTH_MM}mm ${GRID_Y_LENGTH_MM}mm write --page-size ${GRID_X_LENGTH}x${GRID_Y_LENGTH}mm --center ${OUTPUT}_${i}_${j}.svg;
    echo "${OUTPUT}_${i}_${j}.svg"
  done;
done;