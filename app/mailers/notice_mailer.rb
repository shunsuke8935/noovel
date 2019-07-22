class NoticeMailer < ApplicationMailer
	default from: 'from@example.com'
    layout 'mailer'

    def notice_mail(novel)
	  emails = novel.clips.map{|clip| clip.user.email}
	  @novel = novel
	  mail(from: 'mailertest782@gmail.com', to:  emails, subject: 'お気に入り作品の新規投稿がありました。')
    end
end
