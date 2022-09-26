import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button_border.dart';
import 'package:ruang_temu_apps/themes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isToggledNotif = true;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Settings',
        iconSrc: 'assets/icons/icon_settings.png',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/accountPage');
              },
              child: Container(
                width: deviceWidth - 48.w,
                height: 120.h,
                padding: EdgeInsets.all(
                  10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: blueColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.h,
                      height: 50.h,
                      child: const Image(
                        image: AssetImage('assets/icons/icon_akun.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Akun',
                      style: heading1MediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_bahasa.png',
              title: 'Bahasa',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogBox(
                        widget: Column(
                          children: [
                            Text(
                              'Bahasa',
                              style: heading1MediumTextStyle.copyWith(
                                color: blueColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 20.h,
                              // color: yellowColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Indonesia',
                                    style: heading2TextStyle.copyWith(
                                      color: blueColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/icon_check.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              // color: yellowColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Inggris',
                                    style: heading2TextStyle.copyWith(
                                      color: blueColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/icon_check.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        height: 130.h,
                      );
                    });
              },
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_notifikasi.png',
              title: 'Notifikasi',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogBox(
                      widget: Column(
                        children: [
                          Text(
                            'Notifikasi',
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 190.w,
                                height: 50.h,
                                // color: yellowColor,
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        'Berita update dan lainnya',
                                        style: heading3TextStyle.copyWith(
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'Notifikasi update berita terbaru, dan berbagai informasi lain',
                                        style: heading4TextStyle.copyWith(
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 60.w,
                                height: 50.h,
                                child: Switch(
                                  // This bool value toggles the switch.
                                  value: isToggledNotif,
                                  // thumbColor: blueColor,
                                  // trackColor: Colors.blueGrey.withOpacity(0.14),
                                  activeColor:
                                      Colors.blueGrey.withOpacity(0.64),
                                  onChanged: (value) {
                                    setState(() {
                                      isToggledNotif = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: 100.h,
                    );
                  },
                );
              },
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_tentang.png',
              title: 'Tentang',
              onTap: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return DialogBox(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ruang Temu',
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 200.w,
                            height: 200.w,
                            child: const Image(
                              image:
                                  AssetImage('assets/images/logo_kabinet.png'),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Versi',
                            style: heading2TextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          Text(
                            '0.0.1',
                            style: heading3TextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'By\nBEM KM UNY 2022\nKABINET RUANG TEMU',
                            style: heading2TextStyle.copyWith(
                              color: blueColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      height: 360.h,
                    );
                  }),
                );
              },
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_privacy.png',
              title: 'Privacy Policy',
              onTap: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return DialogBox(
                      widget: Column(
                        children: [
                          Text(
                            'PRIVACY AND POLICY',
                            style: heading1BoldTextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 220.w,
                            height: 340.h,
                            child: SingleChildScrollView(
                              child: Text(
                                'Effective date: 2022-10-01\n1. Introduction\nWelcome to BEM KM UNY 2022 - KABINET RUANG TEMU.\nBEM KM UNY 2022 - KABINET RUANG TEMU (“us”, “we”, or “our”) operates http://ruangtemu.bemkmuny.com/ (hereinafter referred to as “Service”).\nOur Privacy Policy governs your visit to http://ruangtemu.bemkmuny.com/, and explains how we collect, safeguard and disclose information that results from your use of our Service.\nWe use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.\nOur Terms and Conditions (“Terms”) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (“agreement”).\n2. Definitions\nSERVICE means the http://ruangtemu.bemkmuny.com/ website operated by BEM KM UNY 2022 - KABINET RUANG TEMU.\nPERSONAL DATA means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).\nUSAGE DATA is data collected automatically either generated by the use of Service or from Service infrastructure itself (for example, the duration of a page visit).\nCOOKIES are small files stored on your device (computer or mobile device).\nDATA CONTROLLER means a natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal data are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your data.\nDATA PROCESSORS (OR SERVICE PROVIDERS) means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively.\nDATA SUBJECT is any living individual who is the subject of Personal Data.\nTHE USER is the individual using our Service. The User corresponds to the Data Subject, who is the subject of Personal Data.\n3. Information Collection and Use\nWe collect several different types of information for various purposes to provide and improve our Service to you.\n4. Types of Data Collected\nPersonal Data\nWhile using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”). Personally identifiable information may include, but is not limited to:\n0.1. Email address\n0.2. First name and last name\n0.3. Phone number\n0.4. Address, Country, State, Province, ZIP/Postal code, City\n0.5. Cookies and Usage Data\nWe may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.\nUsage Data\nWe may also collect information that your browser sends whenever you visit our Service or when you access Service by or through any device (“Usage Data”).\nThis Usage Data may include information such as your computer’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\nWhen you access Service with a device, this Usage Data may include information such as the type of device you use, your device unique ID, the IP address of your device, your device operating system, the type of Internet browser you use, unique device identifiers and other diagnostic data.\nTracking Cookies Data\nWe use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.\nCookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.\nYou can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.\nExamples of Cookies we use:\n0.1. Session Cookies: We use Session Cookies to operate our Service.\n0.2. Preference Cookies: We use Preference Cookies to remember your preferences and various settings.\n0.3. Security Cookies: We use Security Cookies for security purposes.\n0.4. Advertising Cookies: Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.\nOther Data\nWhile using our Service, we may also collect the following information: sex, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and actual address, telephone number (work, mobile), details of documents on education, qualification, professional training, employment agreements, NDA agreements, information on bonuses and compensation, information on marital status, family members, social security (or other taxpayer identification) number, office location and other data.\n5. Use of Data\nBEM KM UNY 2022 - KABINET RUANG TEMU uses the collected data for various purposes:\n0.1. to provide and maintain our Service;\n0.2. to notify you about changes to our Service;\n0.3. to allow you to participate in interactive features of our Service when you choose to do so;\n0.4. to provide customer support;\n0.5. to gather analysis or valuable information so that we can improve our Service;\n0.6. to monitor the usage of our Service;\n0.7. to detect, prevent and address technical issues;\n0.8. to fulfil any other purpose for which you provide it;\n0.9. to carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;\n0.10. to provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.;\n0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;\n0.12. in any other way we may describe when you provide the information;\n0.13. for any other purpose with your consent.\n6. Retention of Data\nWe will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\nWe will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.\n7. Transfer of Data\nYour information, including Personal Data, may be transferred to – and maintained on – computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.\nIf you are located outside Indonesia and choose to provide information to us, please note that we transfer the data, including Personal Data, to Indonesia and process it there.\nYour consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.\nBEM KM UNY 2022 - KABINET RUANG TEMU will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.\n8. Disclosure of Data\nWe may disclose personal information that we collect, or you provide:\n0.1. Disclosure for Law Enforcement.\nUnder certain circumstances, we may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities.\n0.2. Business Transaction.\nIf we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred.\n0.3. Other cases. We may disclose your information also:\n0.3.1. to our subsidiaries and affiliates;\n0.3.2. to contractors, service providers, and other third parties we use to support our business;\n0.3.3. to fulfill the purpose for which you provide it;\n0.3.4. for the purpose of including your company’s logo on our website;\n0.3.5. for any other purpose disclosed by us when you provide the information;\n0.3.6. with your consent in any other cases;\n0.3.7. if we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.\n9. Security of Data\nThe security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.\n10. Your Data Protection Rights Under General Data Protection Regulation (GDPR)\nIf you are a resident of the European Union (EU) and European Economic Area (EEA), you have certain data protection rights, covered by GDPR.\nWe aim to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Data.\nIf you wish to be informed what Personal Data we hold about you and if you want it to be removed from our systems, please email us at bemkm@student.uny.ac.id.\nIn certain circumstances, you have the following data protection rights:\n0.1. the right to access, update or to delete the information we have on you;\n0.2. the right of rectification. You have the right to have your information rectified if that information is inaccurate or incomplete;\n0.3. the right to object. You have the right to object to our processing of your Personal Data;\n0.4. the right of restriction. You have the right to request that we restrict the processing of your personal information;\n0.5. the right to data portability. You have the right to be provided with a copy of your Personal Data in a structured, machine-readable and commonly used format;\n0.6. the right to withdraw consent. You also have the right to withdraw your consent at any time where we rely on your consent to process your personal information;\nPlease note that we may ask you to verify your identity before responding to such requests. Please note, we may not able to provide Service without some necessary data.\nYou have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA).\n11. Your Data Protection Rights under the California Privacy Protection Act (CalOPPA)\nCalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law’s reach stretches well beyond California to require a person or company in the United States (and conceivable the world) that operates websites collecting personally identifiable information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals with whom it is being shared, and to comply with this policy.\nAccording to CalOPPA we agree to the following:\n0.1. users can visit our site anonymously;\n0.2. our Privacy Policy link includes the word “Privacy”, and can easily be found on the home page of our website;\n0.3. users will be notified of any privacy policy changes on our Privacy Policy Page;\n0.4. users are able to change their personal information by emailing us at bemkm@student.uny.ac.id.\nOur Policy on “Do Not Track” Signals:\nWe honor Do Not Track signals and do not track, plant cookies, or use advertising when a Do Not Track browser mechanism is in place. Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked.\nYou can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser.\n12. Your Data Protection Rights under the California Consumer Privacy Act (CCPA)\nIf you are a California resident, you are entitled to learn what data we collect about you, ask to delete your data and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:\n0.1. What personal information we have about you. If you make this request, we will return to you:\n0.0.1. The categories of personal information we have collected about you.\n0.0.2. The categories of sources from which we collect your personal information.\n0.0.3. The business or commercial purpose for collecting or selling your personal information.\n0.0.4. The categories of third parties with whom we share personal information.\n0.0.5. The specific pieces of personal information we have collected about you.\n0.0.6. A list of categories of personal information that we have sold, along with the category of any other company we sold it to. If we have not sold your personal information, we will inform you of that fact.\n0.0.7. A list of categories of personal information that we have disclosed for a business purpose, along with the category of any other company we shared it with.\nPlease note, you are entitled to ask us to provide you with this information up to two times in a rolling twelve-month period. When you make this request, the information provided may be limited to the personal information we collected about you in the previous 12 months.\n0.2. To delete your personal information. If you make this request, we will delete the personal information we hold about you as of the date of your request from our records and direct any service providers to do the same. In some cases, deletion may be accomplished through de-identification of the information. If you choose to delete your personal information, you may not be able to use certain functions that require your personal information to operate.\n0.3. To stop selling your personal information. We don’t sell or rent your personal information to any third parties for any purpose. We do not sell your personal information for monetary consideration. However, under some circumstances, a transfer of personal information to a third party, or within our family of companies, without monetary consideration may be considered a “sale” under California law. You are the only owner of your Personal Data and can request disclosure or deletion at any time.\nIf you submit a request to stop selling your personal information, we will stop making such transfers.\nPlease note, if you ask us to delete or stop selling your data, it may impact your experience with us, and you may not be able to participate in certain programs or membership services which require the usage of your personal information to function. But in no circumstances, we will discriminate against you for exercising your rights.\nTo exercise your California data protection rights described above, please send your request(s) by email: bemkm@student.uny.ac.id.\nYour data protection rights, described above, are covered by the CCPA, short for the California Consumer Privacy Act. To find out more, visit the official California Legislative Information website. The CCPA took effect on 01/01/2020.\n13. Service Providers\nWe may employ third party companies and individuals to facilitate our Service (“Service Providers”), provide Service on our behalf, perform Service-related services or assist us in analysing how our Service is used.\nThese third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.\n14. Analytics\nWe may use third-party Service Providers to monitor and analyze the use of our Service.\n15. CI/CD tools\nWe may use third-party Service Providers to automate the development process of our Service.\n16. Behavioral Remarketing\nWe may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.\n17. Links to Other Sites\nOur Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party’s site. We strongly advise you to review the Privacy Policy of every site you visit.\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\nFor example, the outlined privacy policy has been made using PolicyMaker.io, a free tool that helps create high-quality legal documents. PolicyMaker’s privacy policy generator is an easy-to-use tool for creating a privacy policy for blog, website, e-commerce store or mobile app.\n18. Children’s Privacy\nOur Services are not intended for use by children under the age of 18 (“Child” or “Children”).\nWe do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.\n19. Changes to This Privacy Policy\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.\nWe will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update “effective date” at the top of this Privacy Policy.\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n20. Contact Us\nIf you have any questions about this Privacy Policy, please contact us by email: bemkm@student.uny.ac.id.\nThis Privacy Policy was created for http://ruangtemu.bemkmuny.com/ by PolicyMaker.io on 2022-10-01.',
                                style: heading2TextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: 400.h,
                    );
                  }),
                );
              },
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_terms.png',
              title: 'Terms and Condition',
              onTap: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return DialogBox(
                      widget: Column(
                        children: [
                          Text(
                            'PRIVACY AND POLICY',
                            style: heading1BoldTextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 220.w,
                            height: 340.h,
                            child: SingleChildScrollView(
                              child: Text(
                                'Last updated: 2022-10-01\n1. Introduction\nWelcome to BEM KM UNY 2022 - KABINET RUANG TEMU (“Company”, “we”, “our”, “us”)!\nThese Terms of Service (“Terms”, “Terms of Service”) govern your use of our website located at http://ruangtemu.bemkmuny.com/ (together or individually “Service”) operated by BEM KM UNY 2022 - KABINET RUANG TEMU.\nOur Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.\nYour agreement with us includes these Terms and our Privacy Policy (“Agreements”). You acknowledge that you have read and understood Agreements, and agree to be bound of them.\nIf you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at bemkm@student.uny.ac.id so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.\n2. Communications\nBy using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at bemkm@student.uny.ac.id.\n3. Contests, Sweepstakes and Promotions\nAny contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.\n4. Content\nOur Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (“Content”). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.\nBy posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.\nYou retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.\nBEM KM UNY 2022 - KABINET RUANG TEMU has the right but not the obligation to monitor and edit all Content provided by users.\nIn addition, Content found on or through this Service are the property of BEM KM UNY 2022 - KABINET RUANG TEMU or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.\n5. Prohibited Uses\nYou may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:\n0.1. In any way that violates any applicable national or international law or regulation.\n0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.\n0.3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation.\n0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.\n0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.\n0.6. To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.\nAdditionally, you agree not to:\n0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party’s use of Service, including their ability to engage in real time activities through Service.\n0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.\n0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.\n0.4. Use any device, software, or routine that interferes with the proper working of Service.\n0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.\n0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.\n0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.\n0.8. Take any action that may damage or falsify Company rating.\n0.9. Otherwise attempt to interfere with the proper working of Service.\n6. Analytics\nWe may use third-party Service Providers to monitor and analyze the use of our Service.\n7. No Use By Minors\nService is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.\n8. Intellectual Property\nService and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of BEM KM UNY 2022 - KABINET RUANG TEMU and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of BEM KM UNY 2022 - KABINET RUANG TEMU.\n9. Copyright Policy\nWe respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity.\nIf you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to bemkm@student.uny.ac.id, with the subject line: “Copyright Infringement” and include in your claim a detailed description of the alleged Infringement as detailed below, under “DMCA Notice and Procedure for Copyright Infringement Claims”\nYou may be held accountable for damages (including costs and attorneys’ fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.\n10. DMCA Notice and Procedure for Copyright Infringement Claims\nYou may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):\n0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright’s interest;\n0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;\n0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;\n0.4. your address, telephone number, and email address;\n0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;\n0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.\nYou can contact our Copyright Agent via email at bemkm@student.uny.ac.id.\n11. Error Reporting and Feedback\nYou may provide us either directly at bemkm@student.uny.ac.id or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.\n12. Links To Other Web Sites\nOur Service may contain links to third party web sites or services that are not owned or controlled by BEM KM UNY 2022 - KABINET RUANG TEMU.\nBEM KM UNY 2022 - KABINET RUANG TEMU has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.\nFor example, the outlined Terms of Use have been created using PolicyMaker.io, a free web application for generating high-quality legal documents. PolicyMaker’s Terms and Conditions generator is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.\nYOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.\nWE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.\n13. Disclaimer Of Warranty\nTHESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.\nNEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.\nCOMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.\nTHE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.\n14. Limitation Of Liability\nEXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.\n15. Termination\nWe may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.\nIf you wish to terminate your account, you may simply discontinue using Service.\nAll provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.\n16. Governing Law\nThese Terms shall be governed and construed in accordance with the laws of Indonesia, which governing law applies to agreement without regard to its conflict of law provisions.\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.\n17. Changes To Service\nWe reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.\n18. Amendments To Terms\nWe may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.\nYour continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.\nBy continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.\n19. Waiver And Severability\nNo waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.\nIf any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.\n20. Acknowledgement\nBY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.\n21. Contact Us\nPlease send your feedback, comments, requests for technical support by email: bemkm@student.uny.ac.id.\nThese Terms of Service were created for http://ruangtemu.bemkmuny.com/ by PolicyMaker.io on 2022-10-01.',
                                style: heading2TextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: 400.h,
                    );
                  }),
                );
              },
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_logout.png',
              title: 'Log Out',
              onTap: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return DialogBox(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Apakah Anda yakin ingin Logout?',
                              style: heading2TextStyle.copyWith(
                                color: blueColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RoundedButtonBorder(
                                  width: 100,
                                  height: 30.h,
                                  text: 'Iya',
                                  borderColor: blueColor,
                                  borderWidth: 1.w,
                                  textColor: blueColor,
                                  onPressed: () {},
                                ),
                                RoundedButton(
                                  width: 100.w,
                                  height: 30.h,
                                  text: 'Tidak',
                                  buttonColor: blueColor,
                                  textColor: whiteColor,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        height: 100.h);
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  DialogBox({
    Key? key,
    required this.widget,
    required this.height,
  }) : super(key: key);
  Widget widget;
  double height;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        height: height,
        child: widget,
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  SettingButton({
    Key? key,
    required this.deviceWidth,
    required this.imgSrc,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double deviceWidth;
  Function onTap;
  String title;
  String imgSrc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: deviceWidth - 48.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 5.h,
        ),
        margin: EdgeInsets.only(
          bottom: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: blueColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 30.h,
                    height: 30.h,
                    child: Image(
                      image: AssetImage(imgSrc),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    title,
                    style: heading1MediumTextStyle.copyWith(
                      color: whiteColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.h,
              height: 20.h,
              child: const Image(
                image: AssetImage('assets/icons/icon_arrow_next.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
