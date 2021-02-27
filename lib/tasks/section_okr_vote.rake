namespace :section_okr_vote do
  desc '投票結果をslackに通知させる'
  task slack_notifier: :environment do
    section_okr_ids = []

    section_okr_vote = SectionOkrVote.joins(:section_okr).order(:year).order(:quarter).last
    latest_section_okr_votes = SectionOkrVote.joins(:section_okr).where("section_okrs.year = '#{section_okr_vote.section_okr.year}'").where("section_okrs.quarter = '#{section_okr_vote.section_okr.quarter}'")
    ary = latest_section_okr_votes.pluck(:section_okr_id)
    max_num = ary.max_by { |v| ary.count(v) }
    ary_group = ary.group_by { |e| e }
    ary_group[max_num].size
    ary_group.each{|k, v|
      if v.size == ary_group[max_num].size
        section_okr_ids.push(k)
      end
    }

    section_okr_votes = SectionOkrVote.where(section_okr_id: section_okr_ids)

    SectionOkr.where(id: section_okr_ids).each do |section_okr|
      SlackNotifier.new.send("#{section_okr.quarter}の投票数第1位は#{section_okr.section}！！\nおめでとうございます！！\n寄せられたコメント")
      SlackNotifier.new.send(section_okr_votes.pluck(:comment).join("\n"))
    end
  end
end
