--@name Mc Renderer
--@author AstalNeker

if CLIENT then
    local mc_renderer = {}
    mc_renderer.ascii_list = {}
    mc_renderer.ascii_base64 = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAABGdBTUEAALGPC/xhBQAABY1JREFUeNrtnNuS4yAMRP3/P937PpsEXVpI4E6VaiqT2GA4CN3IA+CRvFc0CAJAgyAAJAJAIgAkAkAiACQCQCIAJAJAIgAkAkAiACQCQCIAJK8FAMbPQfrO6v9IXv+Qr4eznW7BRAD+vr61j8D9QXzGJwEZpk0+CwDL9dYJzvQFrEEJaggIAI4GiE5+VBWD/D3vAqi+/mf/J2gAS3vW7QUNGuDZdH1J27s7AOf+b7EDsGEbQOUkTAdgxxaQ9QIyWwDLi+gCIwWvfOGBhllHHIBlhGWMvOeHlwBHGxEbhNX/DhjgtMP+A8CrYr0q2hvIAbg+NorfT9AE4ef/ZESh2FpGwMhbrd7MYFUDwQDYayi7IoFw+Ope9W1V0ZkBzbqY3i0Ag20A9/N/mhgQ1ExmAkFewaxcQ+UWgI7J99gAzwYboFolMwBAgwGIgm3Q5QVYYvlZK9tqhFaHkhHY3pgaY3skU3745X4+qyDEoyHY17M1UGRLQWKldW+JyzgAY4Amu1nZAWYYuZl7Y5HwWhnxrjjAt057VuBTQHhm/1/FOdhGFhL9swTIEPzcFAeAM/vWoeKeJhXaqQE8908B8AiAUgAmuMVLDYBiAHAZALgFAMYe3eUFZL2YrBfAuj+KgEp5AZLLzwVUr2CLm3mSGxrpf9YLAGErfKK5gF35c3Tsgc5MaCSUnU0Hewtj6Rqg2gaYAEBlXr8agFTByi4rujPbyNAAFc/VUZl8JQDWo2Eo1BBVtRLjAEAhIJUArGLplYdPjwdgVXef8kNJ+fodBSvRgg1GNhGVAEjur0f4CujEM29IPmj3sTBMMO4iJWEnAzCp/8+JADBi6dmcPYI2BCMS6Slb7y4IoVZkMYhmZg+RMDKzySzWSaBVwUZVQUg4GxgxJHanOzMVO7tC2VbAjgNgej2AN6HSla9nxRFGagCQbIBMzcAJFTuMKGNJPcCb/ODqNo6rB9Dhid5nZGUhERlPAdD/fCBe79ZCXj9+ZeRkK4JOMEKrvZStC8TrB6PIj97pxkXTydHJZEUCt2UDq9w0NFnBQM4dm1AvsEUDZEOpmf0wA0C2IMQKR8YNHQ9AdbaLWQ8A8vUMvz/Tv9ZkEWsFK45w8LkAycsPhkgEgEQASASARABIBIBEAEgEgKQt4LQ1La2Bn1cvgOI2IADOKhgpbUOD//KaRU2ANIAmQABIxh7frjL+BIA0zFUAWKqNIBDu1wCrej3gfbEE3B4I8hRs4mWTv/z8RkNq9xZQbcSxoogfv6d98I5jbq/WAJYtYOfqhGwAibwAyXkAwKBSPv3Fh/fWg6RMf37VNjPWsHq2SPuM+7vbzRyuxA8rHALgHACmawCrmxWdgNX9sXjOVfu/XlX336oBrKv/BA1gvS6rATIL4ToN4F2B3hXqXYHVGoDRv0z/8VYbILuCsvevtlFCGu5NXoAAKNIAp9gAAmChAXbk1auvrwYk48ZNuF4ACIB3APBpG4oAgMW9I5a7p3+R1xNpXBqg/tknHA1bJoMqXt33z67w6hU6SgNML87sjBROiPXT+ycABIAAEAAz0qm7ijcz7WcmJroNZ7/vNqAEgABwWZQVExDNDEbaj46RNMAhK1AagBi1yvjpIKzwyP2rYw/P5j5QgWFa4TuyXZ3ZwGj/BIAAEAAC4BIAJHMOwAK+A7IC4PDJ97wXAC+YfGQnXwDc8csfqSyvBvgcAGD8vzSAbAABcKsGsLjB2gIkNQAg+Jn3eyvKTy7IRLCtsv5ZkzSWwQdp8q0/duT9DA7LevfvGFqhj6TQ0xrAmw1jaQiQNAAModpuADKApwGYqgEiKwgJSLBBFUcBAGmBjrcBGBB5t4DqvRhJACwLc4sG6PqRRYaKbD19wwradGmAyioeJgCnZPP0O4EJQ0e+O1n+Aa1MJ+LeSEbXAAAAAElFTkSuQmCC"
    mc_renderer.ascii_texture = material.create("UnlitGeneric")
    mc_renderer.ascii_texture:setTextureURL("$basetexture", mc_renderer.ascii_base64, function(_,_,_,_,l) l(0,0,1024,1024,true) end)
    
    mc_renderer.tooltips_base64 = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAADXSURBVFhH7ZcxDsIwDEUdxi5d4A7cBIkLI27CHWDpwlhXOGmwTdvtJ5XIq6K0yWD3OR4SKNFTz+m1CAMNEvsgXxUJ85+fwlUWvmCFPPkmczbANLqBfWaygWO4yMKL7zKj8HHUGfjkgdUeGdOI/JQAjS9BBQM2jjJgM0PhTTsD+BJsGIith8ab3s8ZKJdAa0MbRxmwmaHYaENbGxwrBvwGjpUEypXAxqlgwJZaGWhtaDND4ePs5wz4DRz2R1sJlIE6bZjvBV04y0Ip3vyQeaEEpUbk32/HRBOvtu2bpt9qowAAAABJRU5ErkJggg=="
    mc_renderer.tooltips_texture = material.create("UnlitGeneric")
    mc_renderer.tooltips_texture:setTextureURL("$basetexture", mc_renderer.tooltips_base64)
    
    
    mc_renderer.mc_color = {
        dark_red = Color(170,0,0),
        red = Color(255,85,85),
        gold = Color(255,170,0),
        yellow = Color(255,255,85),
        dark_green = Color(0,170,0),
        green = Color(85,255,85),
        aqua = Color(85,255,255),
        dark_aqua = Color(0,170,170),
        dark_blue = Color(0,0,170),
        blue = Color(85,85,255),
        light_purple = Color(255,85,255),
        dark_purple = Color(170,0,170),
        white = Color(255,255,255),
        gray = Color(170,170,170),
        dark_gray = Color(85,85,85),
        black = Color(0,0,0)
    }
    
    /*
    local _s = string.char(194,167)
    mc_renderer.mc_color = {
        {name="dark_red",chat_code=_s.."4",color=Color(170,0,0)},
        {name="red",chat_code=_s.."c",color=Color(255,85,85)},
        {name="gold",chat_code=_s.."6",color=Color(255,170,0)},
        {name="yellow",chat_code=_s.."e",color=Color(255,255,85)},
        {name="dark_green",chat_code=_s.."2",color=Color(0,170,0)},
        {name="green",chat_code=_s.."a",color=Color(85,255,85)},
        {name="aqua",chat_code=_s.."b",color=Color(85,255,255)},
        {name="dark_aqua",chat_code=_s.."3",color=Color(0,170,170)},
        {name="dark_blue",chat_code=_s.."1",color=Color(0,0,170)},
        {name="blue",chat_code=_s.."9",color=Color(85,85,255)},
        {name="light_purple",chat_code=_s.."d",color=Color(255,85,255)},
        {name="dark_purple",chat_code=_s.."5",color=Color(170,0,170)},
        {name="white",chat_code=_s.."f",color=Color(255,255,255)},
        {name="gray",chat_code=_s.."7",color=Color(170,170,170)},
        {name="dark_gray",chat_code=_s.."8",color=Color(85,85,85)},
        {name="black",chat_code=_s.."0",color=Color(0,0,0)}
    }
    
    function mc_renderer.get_color(id)
        for i, d in pairs(mc_renderer.mc_color) do
            if d.name == id or d.chat_code == id then
                return d
            end
        end
        return {name="white",chat_code=_s.."f",color=Color(255,255,255)}
    end
    */
    
    function mc_renderer.createNineSlice(_xo, _yo, _wo, _ho, l, t, r, b)
        return function(x, y, w, h, tex)
            local _x = _xo / tex:getWidth()
            local _y = _yo / tex:getHeight()
            local _w = _wo / tex:getWidth()
            local _h = _ho / tex:getHeight()
            
            local left = math.min(l, math.ceil(w / 2))
            local right = math.min(r, math.floor(w / 2))
            local top = math.min(t, math.ceil(h / 2))
            local bottom = math.min(b, math.floor(h / 2))
            
            local _l = left / tex:getWidth()
            local _t = top / tex:getHeight()
            local _r = right / tex:getWidth()
            local _b = bottom / tex:getHeight()
            
            render.setMaterial(tex)
            
            //top
            render.drawTexturedRectUV( x, y, left, top, _x, _y, _x + _l, _y + _t)
            render.drawTexturedRectUV( x + left, y, w - left - right, top, _x + _l, _y, _x + _w - _r, _y + _t)
            render.drawTexturedRectUV( x + w - right, y, right, top, _x + _w - _r, _y, _x + _w, _y + _t)
                
            //middle
            render.drawTexturedRectUV( x, y + top, left, h - top - bottom, _x, _y + _t, _x + _l, _y + _h - _b)
            render.drawTexturedRectUV( x + left, y + top, w - left - right, h - top - bottom, _x + _l, _y + _t, _x + _w - _r, _y + _h - _b)
            render.drawTexturedRectUV( x + w - right, y + top, right, h - top - bottom, _x + _w - _r, _y + _t, _x + _w, _y + _h - _b)
                
            //bottom
            render.drawTexturedRectUV( x, y + h - bottom, left, bottom, _x, _y + _h - _b, _x + _l, _y + _h)
            render.drawTexturedRectUV( x + left, y + h - bottom, w - left - right, bottom, _x + _l, _y + _h - _b, _x + _w - _r, _y + _h)
            render.drawTexturedRectUV( x + w - right, y + h - bottom, right, bottom, _x + _w - _r, _y + _h - _b, _x + _w, _y + _h)
        end
    end
    
    function mc_renderer.initialize_char()
        // calculate ascii position in texture
        for char_index=0, 255 do
            local cx, cy = char_index % 16, math.floor(char_index / 16)
            mc_renderer.ascii_list[char_index] = {
                uv_start = {
                    u = cx / 16,
                    v = cy / 16
                },
                uv_end = {
                    u = (cx + 1) / 16,
                    v = (cy + 1) / 16
                },
                size = 5 / 8
            }
        end
        //
                
        // reformat some char size
        mc_renderer.ascii_list[32].size = 2 / 8 // SPACE
        mc_renderer.ascii_list[33].size = 1 / 8 // !
        mc_renderer.ascii_list[34].size = 3 / 8 // "
        mc_renderer.ascii_list[39].size = 1 / 8 // '
        mc_renderer.ascii_list[40].size = 3 / 8 // (
        mc_renderer.ascii_list[41].size = 3 / 8 // )
        mc_renderer.ascii_list[44].size = 1 / 8 // ,
        mc_renderer.ascii_list[46].size = 1 / 8 // .
        mc_renderer.ascii_list[58].size = 1 / 8 // :
        mc_renderer.ascii_list[59].size = 1 / 8 // ;
        mc_renderer.ascii_list[60].size = 4 / 8 // <
        mc_renderer.ascii_list[62].size = 4 / 8 // >
        mc_renderer.ascii_list[64].size = 6 / 8 // @
        mc_renderer.ascii_list[73].size = 3 / 8 // I
        mc_renderer.ascii_list[91].size = 3 / 8 // [
        mc_renderer.ascii_list[93].size = 3 / 8 // ]
        mc_renderer.ascii_list[102].size = 4 / 8 // f
        mc_renderer.ascii_list[105].size = 1 / 8 // i
        mc_renderer.ascii_list[107].size = 4 / 8 // k
        mc_renderer.ascii_list[108].size = 2 / 8 // l
        mc_renderer.ascii_list[116].size = 3 / 8 // t
        mc_renderer.ascii_list[123].size = 3 / 8 // {
        mc_renderer.ascii_list[124].size = 1 / 8 // |
        mc_renderer.ascii_list[125].size = 3 / 8 // }
        mc_renderer.ascii_list[126].size = 6 / 8 // ~
    end
    
    local hex_color = Color(0,0,0)
    local vec = Vector(0,0)
    function mc_renderer.extract_hexadecimal_color(hex)
        local nosharp = hex:sub(2)
        local rc = nosharp:sub(1, 2)
        local gc = nosharp:sub(3, 4)
        local bc = nosharp:sub(5, 6)
        hex_color[1] = tonumber(#rc > 0 and rc or "00", 16)
        hex_color[2] = tonumber(#gc > 0 and gc or rc, 16)
        hex_color[3] = tonumber(#bc > 0 and bc or rc, 16)
        return hex_color
    end
    
    local phrase = {}
    phrase.keybind = {
        ["key.forward"] = "+forward",
        ["key.back"] = "+back",
        ["key.left"] = "+moveleft",
        ["key.right"] = "+moveright",
        ["key.sprint"] = "+speed",
        ["key.jump"] = "+jump",
        ["key.sneak"] = "+strafe"
    }
    function mc_renderer.keybind_id(value)
        if phrase.keybind[value] then
            return select(2,input.lookupBinding(phrase.keybind[value])) or value
        end
        return value
    end
    
    function mc_renderer.text_size(text,text_size)
        local w = 0
        for id=1, #text do
            local char_data = mc_renderer.ascii_list[string.byte(text[id])]
            if char_data then
                w = w + (1 / 8) * text_size + text_size * char_data.size
            end
        end
        
        vec[1] = w
        vec[2] = text_size
        return vec
    end
    
    function mc_renderer.selector_check_value(value)
        // check for number
        local number_value = tonumber(value)
        if number_value then return number_value end
            
        // check for boolean
        if value == '1b' then return true elseif value == '0b' then return false end
        
        // check for range value
        local min, max = value:match('(%d*)%.%.(%d*)')
        if min or max then
            min = tonumber(min) or 0
            max = tonumber(max) or 10^10
            return {min=min,max=max}
        end
        
        // decode table
        // SOON
        
        return value // string by default
    end
    function mc_renderer.parse_selector(selector)
        local selector_data = {}
        selector_data.value = {}
        selector_data.method = selector:match('@%w+') // @p
        
        // decode each value inside '[]'
        for key, value in selector:gmatch('(%w+)=([^,]+)') do
            value = value:replace("]","")
            selector_data.value[key] = mc_renderer.selector_check_value(value)
        end
        
        return selector_data
    end
    function mc_renderer.get_selector_entity(selector)
        local parsed_selector = mc_renderer.parse_selector(selector)
        
        if parsed_selector.method == "@a" then return player() end
        if parsed_selector.method == "@p" then return find.closest(find.allPlayers(), chip():getPos()) end
        if parsed_selector.method == "@r" then return select(1, table.random(find.allPlayers())) end
        
        return nil
    end
    
    
    function mc_renderer.text(x,y,text,text_size,bold)
        local w = 0
        for id=1, #text do
            local char_data = mc_renderer.ascii_list[string.byte(text[id])]
            if char_data then
                x = math.floor(x)
                y = math.floor(y)
                render.drawTexturedRectUVFast(x + w,y,text_size,text_size,char_data.uv_start.u,char_data.uv_start.v,char_data.uv_end.u,char_data.uv_end.v,true)
                w = w + (1 / 8) * text_size + text_size * char_data.size
            end
        end
        
        vec[1] = w
        vec[2] = text_size
        return vec
    end
    
    local tooltips_nine_slice = mc_renderer.createNineSlice(0, 0, 32, 32, 4, 4, 4, 4)
    function mc_renderer.tooltips(x,y,text,text_size)
        x = math.floor(x)
        y = math.floor(y)
                
        local ts = mc_renderer.text_size(text,text_size)
        
        render.setColor(mc_renderer.mc_color.white)
        tooltips_nine_slice(x - 6,y - 6,ts.x + 12,ts.y + 12,mc_renderer.tooltips_texture)
        
        render.setMaterial(mc_renderer.ascii_texture)
        mc_renderer.text(x,y,text,text_size)
    end
    
    local tooltips_event = {}
    function mc_renderer.reset_tooltips_event()
        tooltips_event = {
            text = "",
            x = -50000,
            y = -50000,
            w = 0,
            h = 0,
            text_size = 15
        }
    end
    
    function mc_renderer.render_tooltips_event()
        if #tooltips_event.text > 0 then
            local cursorPos = render.getScreenEntity() and {render.cursorPos()} or {input.getCursorPos()}
            cursorPos[1], cursorPos[2] = cursorPos[1] or -50000, cursorPos[2] or -50000
            local cursor_hover = Vector(cursorPos[1], cursorPos[2]):withinAABox(Vector(tooltips_event.x - tooltips_event.w,tooltips_event.y), Vector(tooltips_event.x,tooltips_event.y + tooltips_event.h))
            
            if cursor_hover then
                mc_renderer.tooltips(cursorPos[1] + 12,cursorPos[2] - tooltips_event.text_size - 6,tooltips_event.text,tooltips_event.text_size)
            end
        end
    end
    
    function mc_renderer.json_text(x,y,json_data,text_size)
        for id, data in pairs(json_data) do
            local txt = data
            local use_color = mc_renderer.mc_color.white
            local is_bold = false
            local hoverEvent = {}
            
            if type(data) == "table" then
                txt = data.text or ""
                
                if data.color then
                    local c = data.color:trim()
                    if c:startWith("#") then
                        use_color = mc_renderer.extract_hexadecimal_color(c)
                    else
                        use_color = mc_renderer.mc_color[c] or use_color
                    end
                end
                
                // method selector
                if data.selector then
                    local valid_entity = mc_renderer.get_selector_entity(data.selector)
                    txt = txt .. (valid_entity and valid_entity:getName() or "UNKNOWN ENTITY")
                end
                
                // method hoverEvent
                if data.hoverEvent then
                    hoverEvent = {
                        action = data.hoverEvent.action,
                        content = data.hoverEvent.contents or "this is the default tooltips text"
                    }
                end
                
                // method keybind
                if data.keybind then
                    txt = txt .. mc_renderer.keybind_id(data.keybind:trim())
                end
                
                is_bold = data.bold or is_bold
            end
            
            render.setColor(use_color)
            if #txt > 0 then
                local size = mc_renderer.text(x,y,txt,text_size,is_bold)
                x = x + size.x
                
                if hoverEvent.action == "show_text" then
                    tooltips_event.x = x
                    tooltips_event.y = y
                    tooltips_event.w = size.x
                    tooltips_event.h = size.y
                    tooltips_event.text_size = text_size
                    tooltips_event.text = hoverEvent.content:trim()
                end
            end
        end
        
        render.setColor(mc_renderer.mc_color.white) // reset color
    end
    
    mc_renderer.initialize_char() // initialize char list
    
    local mc_js = '[{"text":"colored text + selector @p = ","color":"gold"},{"selector":"@p","bold":true,"color":"green"}]'
    local mc_js2 = '[{"text":"color also support hexadecimal color :D (#FF00FF)","color":"#FF00FF"}]'
    local mc_js3 = '[{"text":"you can also use "},{"text":"hoverEvent:action = show_text","hoverEvent":{"action":"show_text","contents":"tooltips text example !"},"color":"green"}]'
    local mc_js4 = '[{"text":"of course, use key "},{"keybind":"key.forward","color": "green"},{"text":", ","keybind":"key.left","color": "green"},{"text":", ","keybind":"key.back","color": "green"},{"text":", ","keybind":"key.right","color": "green"},{"text": " to move in world !"}]'
    
    hook.add("render","",function()
        render.setFilterMag(1)
        render.setFilterMin(1)
        
        mc_renderer.reset_tooltips_event()
        render.setMaterial(mc_renderer.ascii_texture) // apply ascii texture
        
        
        local scale = 1.5
        local txt_size = 9 * scale
        
        
        render.setColor(Color(timer.curtime() * 120,1,1):hsvToRGB())
        local size = mc_renderer.text(10,10,"MINECRAFT text renderer !",txt_size)
        
        local size2 = mc_renderer.text_size("MINECRAFT text renderer !",txt_size) // same the value returned by mc_renderer.text()
        mc_renderer.text(10 + size.x,10," > size of this text = " .. size2.x .. "x" .. size2.y,txt_size)
        
        render.setColor(Color(255,255,255))
        mc_renderer.json_text(10,txt_size * 2 + txt_size,json.decode(mc_js),txt_size)
        mc_renderer.json_text(10,txt_size * 3 + txt_size,json.decode(mc_js2),txt_size)
        mc_renderer.json_text(10,txt_size * 4 + txt_size,json.decode(mc_js3),txt_size)
        mc_renderer.json_text(10,txt_size * 5 + txt_size,json.decode(mc_js4),txt_size)
        
        mc_renderer.render_tooltips_event()
    end)
end