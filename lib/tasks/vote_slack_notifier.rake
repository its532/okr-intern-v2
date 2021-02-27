namespace :vote_slack_notifier do
  desc '投票結果をslackに通知させる'
  task slack_notifier: :environment do
    section_okr_ids = []

    p vote = SectionOkrVote.joins(:section_okr).order(:year).order(:quarter).last
    p latest_section_okr_votes = SectionOkrVote.joins(:section_okr).where("section_okrs.year = '#{vote.section_okr.year}'").where("section_okrs.quarter = '#{vote.section_okr.quarter}'")
    p ary = latest_section_okr_votes.pluck(:section_okr_id)
    p max_num = ary.max_by { |v| ary.count(v) }
    p ary_group = ary.group_by { |e| e }
    p ary_group[max_num].size
    ary_group.each{|k, v|
      if v.size == ary_group[max_num].size
        section_okr_ids.push(k)
      end
    }
    p section_okr_ids
    p section_okr_votes = SectionOkrVote.where(section_okr_id: section_okr_ids)

    SectionOkr.where(id: section_okr_ids).each do |section_okr|
      SlackNotifier.new.send("#{section_okr.quarter}の投票数第1位は#{section_okr.section}！！\nおめでとうございます！！\n寄せられたコメント")
      SlackNotifier.new.send(section_okr_votes.pluck(:comment).join("\n"))
    end
  end
end
