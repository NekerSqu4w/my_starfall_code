--@name Camera Frustum Culling
--@author AstalNeker

if CLIENT then
    
    local zfar = 1000
    local znear = 1
    local box_size = Vector(70,70,70)
    local box_amount = 8
    
    local box_size2 = box_size / 2
    
    function calculateFrustum(position, angle, aspect, fov, znear, zfar)
        local camForward = angle:getForward()
        local camUp = angle:getUp()
        local camRight = angle:getRight()
        
        local tanFovHalf = math.tan(math.rad(fov * 0.5))
        local nearPlaneHeight = tanFovHalf * znear
        local nearPlaneWidth = nearPlaneHeight * aspect
        
        
        local planes = {}
        
        // near and far Plane
        planes.near = {
            point = position + camForward * znear,
            normal = camForward
        }
        
        planes.far = {
            point = position + camForward * zfar,
            normal = -camForward
        }
        
        // compute the frustum corners on the near plane
        local nearCenter = position + camForward * znear
        local rightVec = camRight * nearPlaneWidth
        local upVec = camUp * nearPlaneHeight
        local nearTopLeft = nearCenter + upVec - rightVec
        local nearTopRight = nearCenter + upVec + rightVec
        local nearBottomLeft = nearCenter - upVec - rightVec
        local nearBottomRight = nearCenter - upVec + rightVec
        
        // right and left Planes
        planes.left = {
            point = position,
            normal = (nearTopLeft - position):cross(camUp):getNormalized()
        }
        planes.right = {
            point = position,
            normal = camUp:cross(nearTopRight - position):getNormalized()
        }
        
        // top and bottom Planes
        planes.top = {
            point = position,
            normal = (nearTopRight - position):cross(camRight):getNormalized()
        }
        planes.bottom = {
            point = position,
            normal = camRight:cross(nearBottomRight - position):getNormalized()
        }
        
        // pre compute all Eq distance
        for id, plane in pairs(planes) do
            local point = plane.point
            local normal = plane.normal
            planes[id].eq_d = normal[1] * point[1] + normal[2] * point[2] + normal[3] * point[3]
        end
        
        return planes
    end
    
    function isBoxInFrustum(position, boxMin, boxMax, frustumPlanes)
        local minX, minY, minZ = boxMin[1] + position[1], boxMin[2] + position[2], boxMin[3] + position[3]
        local maxX, maxY, maxZ = boxMax[1] + position[1], boxMax[2] + position[2], boxMax[3] + position[3]
        
        for index, plane in pairs(frustumPlanes) do
            local normal = plane.normal
            
            local nx, ny, nz = normal[1], normal[2], normal[3]
            local pX = nx > 0 and maxX or minX
            local pY = ny > 0 and maxY or minY
            local pZ = nz > 0 and maxZ or minZ
            local dist = nx * pX + ny * pY + nz * pZ - plane.eq_d
            
            if dist < 0 then return false end
        end
        return true
    end
    
    
    
    
    local scrw, scrh = render.getGameResolution()
    local aspect = scrw / scrh
    
    
    local total_visible = 0
    local amount_objects = 0
    local scene_render_time = 0
    local differed_scene_render_time = 0
    local differed_dt = 0
    local dt = 0
    hook.add("postdrawopaquerenderables", "", function()
        
        local frustum_position = eyePos()
        local frustrumPlanes = calculateFrustum(frustum_position, eyeAngles(), aspect, player():getFOV(), znear, zfar)
        
        local offset = chip():getPos()
        local box_ang = Angle()
        
        render.setRGBA(255,255,255,255)
        amount_objects = 0
        total_visible = 0
        
        
        
        // using frustum
        local scene_render_start = timer.systime()
        local p = Vector(0,0,0)
        for x=-box_amount, box_amount do
            for y=-box_amount, box_amount do
                amount_objects = amount_objects + 1
                
                p[1] = x * box_size.x
                p[2] = y * box_size.y
                local is_visible = isBoxInFrustum(offset + p, -box_size, box_size, frustrumPlanes)
                
                if is_visible then
                    render.draw3DWireframeBox(offset + p, box_ang, -box_size2, box_size2)
                    total_visible = total_visible + 1
                end
            end
        end
        
        scene_render_time = timer.systime() - scene_render_start
    end)
    
    
    timer.create("updateslow", 1, 0, function()
        differed_dt = dt
        differed_scene_render_time = scene_render_time
    end)
    
    
    local f = render.createFont("FontAwesome", 35)
    hook.add("drawhud", "", function()
        dt = timer.frametime()
        
        render.setFont(f)
        render.drawSimpleText(10, 256, "Total objects: " .. total_visible .. "/" .. amount_objects)
        render.drawSimpleText(10, 256 + 45, "Scene render time: " .. math.round(differed_scene_render_time * 1000, 1) .. "ms")
        
        render.setColor(differed_dt < 0.03 and Color(0,255,0) or Color(255,0,0))
        render.drawSimpleText(10, 256 + 45 * 2, "Framerate: " .. math.round(1 / differed_dt, 1) .. "fps")
    end)
    
    
    if player() == owner() then enableHud(player(), true) end
end