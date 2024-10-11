function item(name_, sprite_, desc_) constructor {
	name = name_;
	sprite = sprite_;
	desc = desc_;
	global.items[$name] = self;
}
global.items = {};
#macro it global.items

nu item("mistake", s_mistake, "you don't want to see him");
nu item("impostor", s_when_the, "you already regret this");