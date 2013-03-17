# -*- coding: utf-8 -*-

Plugin.create(:omikuji) do
    command(:omikuji,
        name: "おみくじ",
        condition: Plugin::Command[:CanReplyAll],
        visible: true,
        role: :timeline
    ) do |m|
        m.messages.map do |msg|
            omikuji(msg.message)
        end
    end

    def omikuji(mes)
        id = mes.idname
        Post.primary_service.update(:message => "@#{id} おみくじ")
    end
end
