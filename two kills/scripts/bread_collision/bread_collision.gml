function bread_collision(obj1, obj2, TYPE){
    var collList = ds_list_create();
    //v for variance, make this too big and it will lag like a bitch, make it too small and some problems may arise
    var v = 20
    collision_rectangle_list(obj1.bbox_left-v,obj1.bbox_top-v,obj1.bbox_right+v,obj1.bbox_bottom+v,obj2,false,true,collList,false);
    for(var i = 0; i < ds_list_size(collList);i++){
        var cond;
        if(TYPE == COLTYPE.LESSTHAN)
            cond = bread_collision_l(collList[|i],obj1)
        if(TYPE == COLTYPE.LESSTHANEQUALTO)
            cond = bread_collision_le(collList[|i],obj1)
        if( cond){
            return collList[|i]
        }
    }
}

enum COLTYPE{
    LESSTHAN,
    LESSTHANEQUALTO,
}

function bread_collision_l(obj1,obj2){
	return (obj1.bbox_left < obj2.bbox_right &&
    obj1.bbox_right > obj2.bbox_left &&
    obj1.bbox_top < obj2.bbox_bottom &&
    obj1.bbox_bottom > obj2.bbox_top);
}
function bread_collision_le(obj1,obj2){
    return (obj1.bbox_left <= obj2.bbox_right &&
    obj1.bbox_right >= obj2.bbox_left &&
    obj1.bbox_top <= obj2.bbox_bottom &&
    obj1.bbox_bottom >= obj2.bbox_top);
}