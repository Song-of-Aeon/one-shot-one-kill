if amount < 1 scale = .6 else scale = 1.4+amount/20;
draw_text_transformed_color(x, y, amount, scale, scale, decay, c_red, c_red, c_red, c_red, 2-decay/20);