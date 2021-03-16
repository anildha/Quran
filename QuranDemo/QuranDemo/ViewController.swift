//
//  ViewController.swift
//  QuranDemo
//
//  Created by Piyush on 16/03/21.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var collectyionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectyionView.register(UINib(nibName: "QuranCell", bundle: nil), forCellWithReuseIdentifier: "QuranCell")
        self.collectyionView.delegate = self
        self.collectyionView.dataSource = self
        self.collectyionView.isPagingEnabled = true
        self.deleteQuran()
        self.addQuran()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.collectyionView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func addQuran() {
        self.insertRecords(surah: "19. Maryam", ayah: "1", title: "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ كهيعص ﴿١﴾ ذِكْرُ رَحْمَتِ رَبِّكَ عَبْدَهُ زَكَرِيَّا ﴿٢﴾ إِذْ نَادَىٰ رَبَّهُ نِدَاءً خَفِيًّا ﴿٣﴾ قَالَ رَبِّ إِنِّي وَهَنَ الْعَظْمُ مِنِّي وَاشْتَعَلَ الرَّأْسُ شَيْبًا وَلَمْ أَكُن بِدُعَائِكَ رَبِّ شَقِيًّا ﴿٤﴾ وَإِنِّي خِفْتُ الْمَوَالِيَ مِن وَرَائِي وَكَانَتِ امْرَأَتِي عَاقِرًا فَهَبْ لِي مِن لَّدُنكَ وَلِيًّا ﴿٥﴾ يَرِثُنِي وَيَرِثُ مِنْ آلِ يَعْقُوبَ ۖ وَاجْعَلْهُ رَبِّ رَضِيًّا ﴿٦﴾ يَا زَكَرِيَّا إِنَّا نُبَشِّرُكَ بِغُلَامٍ اسْمُهُ يَحْيَىٰ لَمْ نَجْعَل لَّهُ مِن قَبْلُ سَمِيًّا ﴿٧﴾ قَالَ رَبِّ أَنَّىٰ يَكُونُ لِي غُلَامٌ وَكَانَتِ امْرَأَتِي عَاقِرًا وَقَدْ بَلَغْتُ مِنَ الْكِبَرِ عِتِيًّا ﴿٨﴾ قَالَ كَذَٰلِكَ قَالَ رَبُّكَ هُوَ عَلَيَّ هَيِّنٌ وَقَدْ خَلَقْتُكَ مِن قَبْلُ وَلَمْ تَكُ شَيْئًا ﴿٩﴾ قَالَ رَبِّ اجْعَل لِّي آيَةً ۚ قَالَ آيَتُكَ أَلَّا تُكَلِّمَ النَّاسَ ثَلَاثَ لَيَالٍ سَوِيًّا ﴿١٠﴾ فَخَرَجَ عَلَىٰ قَوْمِهِ مِنَ الْمِحْرَابِ فَأَوْحَىٰ إِلَيْهِمْ أَن سَبِّحُوا بُكْرَةً وَعَشِيًّا ﴿١١﴾")
        
        self.insertRecords(surah: "18. Al-kahf", ayah: "98", title: "قَالَ هَـٰذَا رَحْمَةٌ مِّن رَّبِّي ۖ فَإِذَا جَاءَ وَعْدُ رَبِّي جَعَلَهُ دَكَّاءَ ۖ وَكَانَ وَعْدُ رَبِّي حَقًّا ﴿٩٨﴾ ۞ وَتَرَكْنَا بَعْضَهُمْ يَوْمَئِذٍ يَمُوجُ فِي بَعْضٍ ۖ وَنُفِخَ فِي الصُّورِ فَجَمَعْنَاهُمْ جَمْعًا ﴿٩٩﴾ وَعَرَضْنَا جَهَنَّمَ يَوْمَئِذٍ لِّلْكَافِرِينَ عَرْضًا ﴿١٠٠﴾ الَّذِينَ كَانَتْ أَعْيُنُهُمْ فِي غِطَاءٍ عَن ذِكْرِي وَكَانُوا لَا يَسْتَطِيعُونَ سَمْعًا ﴿١٠١﴾ أَفَحَسِبَ الَّذِينَ كَفَرُوا أَن يَتَّخِذُوا عِبَادِي مِن دُونِي أَوْلِيَاءَ ۚ إِنَّا أَعْتَدْنَا جَهَنَّمَ لِلْكَافِرِينَ نُزُلًا ﴿١٠٢﴾ قُلْ هَلْ نُنَبِّئُكُم بِالْأَخْسَرِينَ أَعْمَالًا ﴿١٠٣﴾ الَّذِينَ ضَلَّ سَعْيُهُمْ فِي الْحَيَاةِ الدُّنْيَا وَهُمْ يَحْسَبُونَ أَنَّهُمْ يُحْسِنُونَ صُنْعًا ﴿١٠٤﴾ أُولَـٰئِكَ الَّذِينَ كَفَرُوا بِآيَاتِ رَبِّهِمْ وَلِقَائِهِ فَحَبِطَتْ أَعْمَالُهُمْ فَلَا نُقِيمُ لَهُمْ يَوْمَ الْقِيَامَةِ وَزْنًا ﴿١٠٥﴾ ذَٰلِكَ جَزَاؤُهُمْ جَهَنَّمُ بِمَا كَفَرُوا وَاتَّخَذُوا آيَاتِي وَرُسُلِي هُزُوًا ﴿١٠٦﴾ إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ كَانَتْ لَهُمْ جَنَّاتُ الْفِرْدَوْسِ نُزُلًا ﴿١٠٧﴾ خَالِدِينَ فِيهَا لَا يَبْغُونَ عَنْهَا حِوَلًا ﴿١٠٨﴾ قُل لَّوْ كَانَ الْبَحْرُ مِدَادًا لِّكَلِمَاتِ رَبِّي لَنَفِدَ الْبَحْرُ قَبْلَ أَن تَنفَدَ كَلِمَاتُ رَبِّي وَلَوْ جِئْنَا بِمِثْلِهِ مَدَدًا ﴿١٠٩﴾ قُلْ إِنَّمَا أَنَا بَشَرٌ مِّثْلُكُمْ يُوحَىٰ إِلَيَّ أَنَّمَا إِلَـٰهُكُمْ إِلَـٰهٌ وَاحِدٌ ۖ فَمَن كَانَ يَرْجُو لِقَاءَ رَبِّهِ فَلْيَعْمَلْ عَمَلًا صَالِحًا وَلَا يُشْرِكْ بِعِبَادَةِ رَبِّهِ أَحَدًا ﴿١١٠﴾")
        self.insertRecords(surah: "18. Al-kahf", ayah: "84", title: "إِنَّا مَكَّنَّا لَهُ فِي الْأَرْضِ وَآتَيْنَاهُ مِن كُلِّ شَيْءٍ سَبَبًا ﴿٨٤﴾ فَأَتْبَعَ سَبَبًا ﴿٨٥﴾ حَتَّىٰ إِذَا بَلَغَ مَغْرِبَ الشَّمْسِ وَجَدَهَا تَغْرُبُ فِي عَيْنٍ حَمِئَةٍ وَوَجَدَ عِندَهَا قَوْمًا ۗ قُلْنَا يَا ذَا الْقَرْنَيْنِ إِمَّا أَن تُعَذِّبَ وَإِمَّا أَن تَتَّخِذَ فِيهِمْ حُسْنًا ﴿٨٦﴾ قَالَ أَمَّا مَن ظَلَمَ فَسَوْفَ نُعَذِّبُهُ ثُمَّ يُرَدُّ إِلَىٰ رَبِّهِ فَيُعَذِّبُهُ عَذَابًا نُّكْرًا ﴿٨٧﴾ وَأَمَّا مَنْ آمَنَ وَعَمِلَ صَالِحًا فَلَهُ جَزَاءً الْحُسْنَىٰ ۖ وَسَنَقُولُ لَهُ مِنْ أَمْرِنَا يُسْرًا ﴿٨٨﴾ ثُمَّ أَتْبَعَ سَبَبًا ﴿٨٩﴾ حَتَّىٰ إِذَا بَلَغَ مَطْلِعَ الشَّمْسِ وَجَدَهَا تَطْلُعُ عَلَىٰ قَوْمٍ لَّمْ نَجْعَل لَّهُم مِّن دُونِهَا سِتْرًا ﴿٩٠﴾ كَذَٰلِكَ وَقَدْ أَحَطْنَا بِمَا لَدَيْهِ خُبْرًا ﴿٩١﴾ ثُمَّ أَتْبَعَ سَبَبًا ﴿٩٢﴾ حَتَّىٰ إِذَا بَلَغَ بَيْنَ السَّدَّيْنِ وَجَدَ مِن دُونِهِمَا قَوْمًا لَّا يَكَادُونَ يَفْقَهُونَ قَوْلًا ﴿٩٣﴾ قَالُوا يَا ذَا الْقَرْنَيْنِ إِنَّ يَأْجُوجَ وَمَأْجُوجَ مُفْسِدُونَ فِي الْأَرْضِ فَهَلْ نَجْعَلُ لَكَ خَرْجًا عَلَىٰ أَن تَجْعَلَ بَيْنَنَا وَبَيْنَهُمْ سَدًّا ﴿٩٤﴾ قَالَ مَا مَكَّنِّي فِيهِ رَبِّي خَيْرٌ فَأَعِينُونِي بِقُوَّةٍ أَجْعَلْ بَيْنَكُمْ وَبَيْنَهُمْ رَدْمًا ﴿٩٥﴾ آتُونِي زُبَرَ الْحَدِيدِ ۖ حَتَّىٰ إِذَا سَاوَىٰ بَيْنَ الصَّدَفَيْنِ قَالَ انفُخُوا ۖ حَتَّىٰ إِذَا جَعَلَهُ نَارًا قَالَ آتُونِي أُفْرِغْ عَلَيْهِ قِطْرًا ﴿٩٦﴾ فَمَا اسْطَاعُوا أَن يَظْهَرُوهُ وَمَا اسْتَطَاعُوا لَهُ نَقْبًا ﴿٩٧﴾")
        self.insertRecords(surah: "18. Al-kahf", ayah: "75", title: "۞ قَالَ أَلَمْ أَقُل لَّكَ إِنَّكَ لَن تَسْتَطِيعَ مَعِيَ صَبْرًا ﴿٧٥﴾ قَالَ إِن سَأَلْتُكَ عَن شَيْءٍ بَعْدَهَا فَلَا تُصَاحِبْنِي ۖ قَدْ بَلَغْتَ مِن لَّدُنِّي عُذْرًا ﴿٧٦﴾ فَانطَلَقَا حَتَّىٰ إِذَا أَتَيَا أَهْلَ قَرْيَةٍ اسْتَطْعَمَا أَهْلَهَا فَأَبَوْا أَن يُضَيِّفُوهُمَا فَوَجَدَا فِيهَا جِدَارًا يُرِيدُ أَن يَنقَضَّ فَأَقَامَهُ ۖ قَالَ لَوْ شِئْتَ لَاتَّخَذْتَ عَلَيْهِ أَجْرًا ﴿٧٧﴾ قَالَ هَـٰذَا فِرَاقُ بَيْنِي وَبَيْنِكَ ۚ سَأُنَبِّئُكَ بِتَأْوِيلِ مَا لَمْ تَسْتَطِع عَّلَيْهِ صَبْرًا ﴿٧٨﴾ أَمَّا السَّفِينَةُ فَكَانَتْ لِمَسَاكِينَ يَعْمَلُونَ فِي الْبَحْرِ فَأَرَدتُّ أَنْ أَعِيبَهَا وَكَانَ وَرَاءَهُم مَّلِكٌ يَأْخُذُ كُلَّ سَفِينَةٍ غَصْبًا ﴿٧٩﴾ وَأَمَّا الْغُلَامُ فَكَانَ أَبَوَاهُ مُؤْمِنَيْنِ فَخَشِينَا أَن يُرْهِقَهُمَا طُغْيَانًا وَكُفْرًا ﴿٨٠﴾ فَأَرَدْنَا أَن يُبْدِلَهُمَا رَبُّهُمَا خَيْرًا مِّنْهُ زَكَاةً وَأَقْرَبَ رُحْمًا ﴿٨١﴾ وَأَمَّا الْجِدَارُ فَكَانَ لِغُلَامَيْنِ يَتِيمَيْنِ فِي الْمَدِينَةِ وَكَانَ تَحْتَهُ كَنزٌ لَّهُمَا وَكَانَ أَبُوهُمَا صَالِحًا فَأَرَادَ رَبُّكَ أَن يَبْلُغَا أَشُدَّهُمَا وَيَسْتَخْرِجَا كَنزَهُمَا رَحْمَةً مِّن رَّبِّكَ ۚ وَمَا فَعَلْتُهُ عَنْ أَمْرِي ۚ ذَٰلِكَ تَأْوِيلُ مَا لَمْ تَسْطِع عَّلَيْهِ صَبْرًا ﴿٨٢﴾ وَيَسْأَلُونَكَ عَن ذِي الْقَرْنَيْنِ ۖ قُلْ سَأَتْلُو عَلَيْكُم مِّنْهُ ذِكْرًا ﴿٨٣﴾")

    }
    
    func insertRecords(surah: String, ayah: String, title: String) {
        let realm = try! Realm()
        let group = QuranRealm()
        group.id = self.incrementID()
        group.surah = surah
        group.ayah = ayah
        group.title = title

        try! realm.write { //Insertar/Reemplazar grupo, sin productos
            realm.add(group)
        }
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(QuranRealm.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func getQuran() -> Results<QuranRealm>? {
        let realm = try! Realm()
        let dateObject = realm.objects(QuranRealm.self)
        return dateObject
    }
    
    func deleteQuran() {
        let realm = try! Realm()
        try! realm.write { //Insertar/Reemplazar grupo, sin productos
            realm.deleteAll()
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getQuran()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: QuranCell = self.collectyionView.dequeueReusableCell(withReuseIdentifier: "QuranCell", for: indexPath) as! QuranCell
        let model = self.getQuran()?[indexPath.row]
        cell.txtTitle.text = model?.title ?? ""
        cell.txtTitle.isUserInteractionEnabled = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.getQuran()?[indexPath.row]
        let alert = UIAlertController(title: "Alert", message: "surah \(model?.surah ?? "") and ayah \(model?.ayah ?? "")", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = self.collectyionView.bounds
        return CGSize(width: frame.width, height: frame.height)
    }
}

