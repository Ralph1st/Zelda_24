event_inherited()

Link_falling_top_down = false;

if (instance_place(x, y, OBJ_Link)) {
    Link_falling_top_down = true;
} else {
    Link_falling_top_down = false;
}